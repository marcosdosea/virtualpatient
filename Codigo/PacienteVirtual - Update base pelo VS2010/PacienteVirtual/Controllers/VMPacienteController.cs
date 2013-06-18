using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models.ViewModel;
using PacienteVirtual.Models.Negocio;
using PacienteVirtual.Models;
using System.Collections;

namespace PacienteVirtual.Controllers.ViewModelControllers
{
    public class VMPacienteController : Controller
    {
        //
        // GET: /PacienteVM/

        public ActionResult Index()
        {
            return View(listaVMPaciente());//Tipar a View com uma lista
        }

        //Método destinado a pesquisar todos os paciente e obter todos os seus relatos
        private List<VMPaciente> listaVMPaciente()
        {
            List<VMPaciente> listPacienteVM = new List<VMPaciente>();

            GerenciadorRelatoClinico gRelato = GerenciadorRelatoClinico.GetInstance();
            IEnumerable<PacienteModel> listPacientes = GerenciadorPaciente.GetInstance().ObterTodos();
            foreach (PacienteModel paciente in listPacientes)
            {
                VMPaciente vmPaciente = new VMPaciente();
                vmPaciente.paciente = paciente;
                vmPaciente.relatosClinico = gRelato.ObterRelatos(paciente.IdPaciente).ToList();
                vmPaciente.quantRelatos = vmPaciente.relatosClinico.Count();
                listPacienteVM.Add(vmPaciente);

            }
            return listPacienteVM;
        }

        public FileContentResult GetImage(int id)
        {
            var imageData = GerenciadorPaciente.GetInstance().Obter(id).Foto;
            if (imageData != null)
                return File(imageData, "image/jpg");
            return null;
        }

        public ActionResult Create()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Create(VMPaciente vmPaciente)
        {
            if (ModelState.IsValid)
            {
                int tamanho = (int)Request.Files[0].InputStream.Length;
                byte[] arq = new byte[tamanho];
                Request.Files[0].InputStream.Read(arq, 0, tamanho);
                byte[] arqUp = arq;
                vmPaciente.paciente.Foto = arqUp;
                int idPaciente = GerenciadorPaciente.GetInstance().Inserir(vmPaciente.paciente);

                if (ModelState.IsValidField("relatosClinico"))
                {
                    List<RelatoClinicoModel> listaRelato = vmPaciente.relatosClinico;
                    if (listaRelato != null)
                        foreach (RelatoClinicoModel relato in listaRelato)
                        {
                            relato.IdPaciente = idPaciente;
                            GerenciadorRelatoClinico.GetInstance().Inserir(relato);
                        }
                    else
                        return RedirectToAction("Index", "Home");
                    return RedirectToAction("Index");
                }
            }

            return View(vmPaciente);
        }

        [HttpPost]
        public ActionResult CriarNovoRelato(VMPaciente vmPaciente)
        {
            return View();
        }

        public ActionResult Edit(int id)
        {
            VMPaciente vmPaciente = new VMPaciente();

            vmPaciente.paciente = GerenciadorPaciente.GetInstance().Obter(id);

            vmPaciente.experienciaMedicamentos = GerenciadorExperienciaMedicamentos.GetInstance().Obter(id);


            DiarioPessoalModel dp = new DiarioPessoalModel();
            dp.Horario = "09/12/1992";
            dp.IdConsultaFixo = 9;
            dp.IdMedicamento = 7;
            dp.Periodo = "segundo";
            dp.Quantidade = "5";
            dp.TipoBebida = "cachaça";

            vmPaciente.diarioPessoal = dp;

            vmPaciente.relatoClinico = GerenciadorRelatoClinico.GetInstance().Obter(id);
            ViewBag.ab = "aD";
            return View(vmPaciente);
        }

        public PartialViewResult DemograficosAntropomedicos(int id)
        {
            DemograficosAntropometricosModel dm = new DemograficosAntropometricosModel();
            dm.IdConsultaFixo = id;
            dm.IdEscolaridade = id;
            dm.IdPlanoSaude = id;
            dm.Nome = "asdf";
            dm.OcupacaoDescricao = "funcionário";

            return PartialView(dm);
        }
        [HttpPost]
        public PartialViewResult DemograficosAntropomedicos(DemograficosAntropometricosModel d)
        {

            if (ModelState.IsValid)
            {
                //db.tb_demograficos_antropometricos.AddObject(tb_demograficos_antropometricos);
                //db.SaveChanges();
                d.IdConsultaFixo = GerenciadorDemograficosAntropometricos.GetInstance().Inserir(d);
                return PartialView(d);
            }
            d.IdConsultaFixo = 666;
            return PartialView(d);
        }


        public PartialViewResult RelatoClinico(RelatoClinicoModel relato)
        {
            return PartialView();
        }


        public PartialViewResult DiarioPessoal(DiarioPessoalModel id)
        {
            if (id == null)
                return PartialView(7);

            return PartialView(id);
        }

        public ViewResult ExperienciaMedicamentos(ExperienciaMedicamentosModel d)
        {

            return View();
        }


        public ActionResult Curso(CursoModel cursoModel)
        {
            return View();
        }

        //
        // POST: /Curso/Create
        //[HttpPost]
        //public ActionResult Curso(CursoModel cursoModel)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        cursoModel.IdCurso = GerenciadorCurso.GetInstance().Inserir(cursoModel);
        //        return RedirectToAction("Index");
        //    }
        //    return View(cursoModel);
        //}
    }
}
