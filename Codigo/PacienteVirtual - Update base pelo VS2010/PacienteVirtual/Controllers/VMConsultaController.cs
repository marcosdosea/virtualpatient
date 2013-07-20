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
        GerenciadorDemograficosAntropometricos gDemoAntrop = GerenciadorDemograficosAntropometricos.GetInstance();

        public ViewResult Index()
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos(), "IdPaciente", "NomePaciente");
            return View();
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = -1)
        {

            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            if (IdPaciente != -1)
                return View(GerenciadorRelatoClinico.GetInstance().ObterRelatos(IdPaciente));

            return View();
        }

        //public ActionResult Index()
        //{
        //    return View(listaVMConsulta());
        //}

        ////Método destinado a pesquisar todos os paciente e obter todos os seus relatos
        //private List<VMConsulta> listaVMConsulta()
        //{
        //    List<VMConsulta> listPacienteVM = new List<VMConsulta>();

        //    GerenciadorRelatoClinico gRelato = GerenciadorRelatoClinico.GetInstance();
        //    IEnumerable<PacienteModel> listPacientes = GerenciadorPaciente.GetInstance().ObterTodos();
        //    foreach (PacienteModel paciente in listPacientes)
        //    {
        //        VMConsulta vmPaciente = new VMConsulta();
        //        vmPaciente.paciente = paciente;
        //        listPacienteVM.Add(vmPaciente);

        //    }
        //    return listPacienteVM;
        //}

        //
        // GET: /VMConsulta/Create

        public ActionResult AdicionarAlterar(int idPaciente, int idRelato)
        {
            int idPessoa = Global.ID_PESSOA;
            int idTurma = Global.ID_TURMA;
            VMConsulta vmConsulta = new VMConsulta();

            vmConsulta.paciente = GerenciadorPaciente.GetInstance().Obter(idPaciente);
            vmConsulta.relatoClinico = GerenciadorRelatoClinico.GetInstance().Obter(idRelato);

            ConsultaVariavelModel consultaV = GerenciadorConsultaVariavel.GetInstance().Obter(idTurma, idPessoa, idRelato);


            if (consultaV == null){

                consultaV.IdPessoa = idPessoa;
                consultaV.IdTurma = idTurma;
                consultaV.IdRelato = idRelato;
                consultaV.IdConsultaFixo = 1;//Default
                consultaV.IdRazaoEncontro = 1;//Default

                long idConsultaV = GerenciadorConsultaVariavel.GetInstance().Inserir(consultaV);
                return View(vmConsulta);
            }
            

            return View(vmConsulta);
        }

        public PartialViewResult DemograficosAntropomedicos(int id)
        {
            ViewBag.foi = "foi";
            //DemograficosAntropometricosModel demoAntrop = GerenciadorDemograficosAntropometricos.GetInstance().Obter(id);

            DemograficosAntropometricosModel demoAntrop = new DemograficosAntropometricosModel();
            if (!demoAntrop.IdConsultaFixo.ToString().Equals(null))
            ViewBag.foi = demoAntrop.IdConsultaFixo.ToString();
                
            ViewBag.IdEscolaridade = new SelectList(GerenciadorEscolaridade.GetInstance().ObterTodos().ToList(), "IdEscolaridade", "Nivel");
            ViewBag.IdOcupacao = new SelectList(GerenciadorOcupacao.GetInstance().ObterTodos().ToList(), "IdOcupacao", "Descricao");
            ViewBag.IdPlanoSaude = new SelectList(GerenciadorPlanoSaude.GetInstance().ObterTodos().ToList(), "IdPlanoSaude", "Nome");

            return PartialView(demoAntrop);
        }
        
        [HttpPost]
        public PartialViewResult DemograficosAntropomedicos(DemograficosAntropometricosModel demoAntrop)
        {
            ViewBag.foi = "salvo " + demoAntrop.IdConsultaFixo;
            ViewBag.IdEscolaridade = new SelectList(gDemoAntrop.ObterTodos(), "IdEscolaridade", "Nivel");
            ViewBag.IdOcupacao = new SelectList(gDemoAntrop.ObterTodos(), "IdOcupacao", "Descricao");
            ViewBag.IdPlanoSaude = new SelectList(gDemoAntrop.ObterTodos(), "IdPlanoSaude", "Nome");

            if (ModelState.IsValid)
            {
                demoAntrop.IdConsultaFixo = gDemoAntrop.Inserir(demoAntrop);
                ViewBag.foi = "salvo Mesmo";

                return PartialView();
            
            }
            return PartialView(demoAntrop);

        }


        public PartialViewResult ExperienciaMedicamentos(int id)
        {

            return PartialView();
        }

        public PartialViewResult DiarioPessoal(int id)
        {
            ViewBag.foi = "foi Int";

            DiarioPessoalModel dp = new DiarioPessoalModel();
            dp.Horario = "09/12/1992";
            dp.IdConsultaFixo = 95;
            dp.IdMedicamento = 7;
            dp.Periodo = "segundo ....";
            dp.Quantidade = "5";
            dp.TipoBebida = "cachaça da boa";

            return PartialView();
        }

        //[HttpPost]
        //public ActionResult DiarioPessoal(int id)
        //{
        //    ViewBag.foi = "foi? Não Válido";

        //    if (ModelState.IsValid)
        //    {
        //        ViewBag.foi = "foi? Valido";
        //    }


        //    DiarioPessoalModel dp = new DiarioPessoalModel();
        //    dp.Horario = "09/12/1992";
        //    dp.IdConsultaFixo = 5;
        //    dp.IdMedicamento = 7;
        //    dp.Periodo = "segundo";
        //    dp.Quantidade = "5";
        //    dp.TipoBebida = "cachaça da boa valido";

        //   //if (model == null)
        //   //     return PartialView(7);


        //    return PartialView();
        //}

        public PartialViewResult RelatoClinico(RelatoClinicoModel model)
        {
            return PartialView(model);
        }

        public PartialViewResult EstiloVida(int id)
        {

            return PartialView();
        }

        public PartialViewResult MedicamentosAnteriores(int id)
        {

            return PartialView();
        }

        public PartialViewResult MedicamentoPrescrito(int id)
        {
            return PartialView();
        }

        public PartialViewResult MedicamentoNaoPrescrito(int id)
        {

            return PartialView();
        }

        public PartialViewResult Queixa(int id)
        {
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos().ToList(), "IdSistema", "NomeSistema");
            return PartialView();
        }

        public PartialViewResult ListarQueixa(int id)
        {
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos().ToList(), "IdSistema", "NomeSistema");
            return PartialView();
        }       
    }
}
