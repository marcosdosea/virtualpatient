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
                        return RedirectToAction("Index","Home");
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
            vmPaciente.demograficosAntropomedicos = GerenciadorDemograficosAntropometricos.GetInstance().Obter(id);
            vmPaciente.experienciaMedicamentos = GerenciadorExperienciaMedicamentos.GetInstance().Obter(id);
            vmPaciente.diarioPessoal = GerenciadorDiarioPessoal.GetInstance().Obter(id);
            vmPaciente.relatoClinico = GerenciadorRelatoClinico.GetInstance().Obter(id);
            ViewBag.ab = "aD";
            return View(vmPaciente);
        }

        public PartialViewResult RelatoClinico(RelatoClinicoModel relato)
        {
            return PartialView();

        }


        public PartialViewResult DemograficosAntropomedicos(DemograficosAntropometricosModel demoAntro)
        {
            return PartialView();

        }


        public ViewResult DiarioPessoal(DiarioPessoalModel d)
        {

            return View();
        }

        public ViewResult ExperienciaMedicamentos(ExperienciaMedicamentosModel d)
        {

            return View();
        }

    }
}
