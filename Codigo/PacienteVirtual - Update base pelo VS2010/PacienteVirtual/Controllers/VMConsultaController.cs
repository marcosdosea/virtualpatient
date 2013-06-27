using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Models.Negocio;
using PacienteVirtual.Models.ViewModel;

namespace PacienteVirtual.Controllers
{
    public class VMConsultaController : Controller
    {
        //
        // GET: /VMConsulta/

        public ActionResult Index()
        {
            return View(listaVMConsulta());
        }

        //Método destinado a pesquisar todos os paciente e obter todos os seus relatos
        private List<VMConsulta> listaVMConsulta()
        {
            List<VMConsulta> listPacienteVM = new List<VMConsulta>();

            GerenciadorRelatoClinico gRelato = GerenciadorRelatoClinico.GetInstance();
            IEnumerable<PacienteModel> listPacientes = GerenciadorPaciente.GetInstance().ObterTodos();
            foreach (PacienteModel paciente in listPacientes)
            {
                VMConsulta vmPaciente = new VMConsulta();
                vmPaciente.paciente = paciente;
                listPacienteVM.Add(vmPaciente);

            }
            return listPacienteVM;
        }

        //
        // GET: /VMConsulta/Create

        public ActionResult AdicionarAlterar()
        {
            VMConsulta vmPaciente = new VMConsulta();

            //vmPaciente.paciente = GerenciadorPaciente.GetInstance().Obter(id);

            //vmPaciente.experienciaMedicamentos = GerenciadorExperienciaMedicamentos.GetInstance().Obter(id);


            DiarioPessoalModel dp = new DiarioPessoalModel();
            dp.Horario = "09/12/1992";
            dp.IdConsultaFixo = 9;
            dp.IdMedicamento = 7;
            dp.Periodo = "segundo";
            dp.Quantidade = "5";
            dp.TipoBebida = "cachaça";

            vmPaciente.diarioPessoal = dp;

            
            //vmPaciente.relatoClinico = GerenciadorRelatoClinico.GetInstance().Obter(id);
            //ViewBag.ab = "aD";
            return View(vmPaciente);
        }

        //
        // POST: /VMConsulta/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public PartialViewResult DemograficosAntropomedicos(DemograficosAntropometricosModel id)
        {

            return PartialView();
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

        public PartialViewResult ExperienciaMedicamentos(ExperienciaMedicamentosModel id)
        {

            return PartialView();
        }

        public PartialViewResult EstiloVida(EstiloVidaModel id)
        {

            return PartialView();
        }

        public PartialViewResult MedicamentosAnteriores(MedicamentosAnterioresModel id)
        {

            return PartialView();
        }

        public PartialViewResult MedicamentoPrescrito(MedicamentoPrescritoModel id)
        {

            return PartialView();
        }

        public PartialViewResult MedicamentoNaoPrescrito(MedicamentoNaoPrescritoModel id)
        {

            return PartialView();
        }

        public PartialViewResult Queixa(QueixaModel id)
        {
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos().ToList(), "IdSistema", "NomeSistema");
            return PartialView();
        }

        public PartialViewResult ListarQueixa(QueixaModel id)
        {
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos().ToList(), "IdSistema", "NomeSistema");
            return PartialView();
        }
    }
}
