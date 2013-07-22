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

            if (consultaV == null)
            {
                ConsultaVariavelModel consultaVM = new ConsultaVariavelModel();
                consultaVM.IdPessoa = idPessoa;
                consultaVM.IdTurma = idTurma;
                consultaVM.IdRelato = idRelato;
                consultaVM.IdConsultaFixo = 1;//Default
                consultaVM.IdRazaoEncontro = 1;//Default

                long idConsultaV = GerenciadorConsultaVariavel.GetInstance().Inserir(consultaVM);
                return View(vmConsulta);
            }

            vmConsulta.idConsultaFixo = consultaV.IdConsultaFixo;

            return View(vmConsulta);
        }

        public PartialViewResult DemograficosAntropomedicos(int id)
        {
            DemograficosAntropometricosModel demoAntrop = gDemoAntrop.Obter(id);

            ViewBag.foi = "";

            if (demoAntrop == null)
            {
                demoAntrop = new DemograficosAntropometricosModel();
                demoAntrop.IdConsultaFixo = id;
                ViewBag.foi = "Dados ainda não cadastrados";
                gDemoAntrop.Inserir(demoAntrop);
            }

            ViewBag.IdEscolaridade = new SelectList(GerenciadorEscolaridade.GetInstance().ObterTodos().ToList(), "IdEscolaridade", "EscolaridadeNivel", demoAntrop.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(GerenciadorOcupacao.GetInstance().ObterTodos().ToList(), "IdOcupacao", "OcupacaoDescricao", demoAntrop.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(GerenciadorPlanoSaude.GetInstance().ObterTodos().ToList(), "IdPlanoSaude", "PlanoSaudeNome", demoAntrop.IdPlanoSaude);

            return PartialView(demoAntrop);
        }

        [HttpPost]
        public PartialViewResult DemograficosAntropomedicos(DemograficosAntropometricosModel demoAntrop)
        {
            ViewBag.foi = "";

            if (ModelState.IsValid)
            {
                gDemoAntrop.Atualizar(demoAntrop);
                ViewBag.foi = "Atualizado";
            }

            ViewBag.IdEscolaridade = new SelectList(GerenciadorEscolaridade.GetInstance().ObterTodos().ToList(), "IdEscolaridade", "EscolaridadeNivel", demoAntrop.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(GerenciadorOcupacao.GetInstance().ObterTodos().ToList(), "IdOcupacao", "OcupacaoDescricao", demoAntrop.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(GerenciadorPlanoSaude.GetInstance().ObterTodos().ToList(), "IdPlanoSaude", "PlanoSaudeNome", demoAntrop.IdPlanoSaude);

            return PartialView(demoAntrop);

        }


        public PartialViewResult ExperienciaMedicamentos(int id)
        {

            return PartialView();
        }

        //Valores retorna valores iniciais se exsitirem
        public PartialViewResult DiarioPessoal(int id)
        {
            DiarioPessoalModel diarioPessoal = GerenciadorDiarioPessoal.GetInstance().Obter(id);

            ViewBag.situacao = "ssssss";

            if (diarioPessoal == null)
            {
                ViewBag.situacao = "Dados ainda não cadastrados";

                diarioPessoal = new DiarioPessoalModel();
                diarioPessoal.IdConsultaFixo = id;
                diarioPessoal.IdMedicamento = 1; //Default
                diarioPessoal.Periodo = "0"; //Default
                GerenciadorDiarioPessoal.GetInstance().Inserir(diarioPessoal);
            }

            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", diarioPessoal.IdMedicamento);
            
            return PartialView(diarioPessoal);
        }

        // Atualização de campos
        [HttpPost]
        public PartialViewResult DiarioPessoal(DiarioPessoalModel diarioModel)
        {
            ViewBag.situacao = "Atualizadodoaosdoaodoasdo";

            if (ModelState.IsValid)
            {
                GerenciadorDiarioPessoal.GetInstance().Atualizar(diarioModel);
                ViewBag.situacao = "Atualizado";
            }

            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", diarioModel.IdMedicamento);

            return PartialView("DiarioPessoal",diarioModel);
        }

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
