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
            ViewBag.codigo = -1;
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos(), "IdPaciente", "NomePaciente");
            return View(GerenciadorRelatoClinico.GetInstance().ObterTodos());
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = -1)
        {
            ViewBag.codigo = IdPaciente;
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            if (IdPaciente != -1)
                return View(GerenciadorRelatoClinico.GetInstance().ObterRelatos(IdPaciente));
            if (IdPaciente == -1)
                return View(GerenciadorRelatoClinico.GetInstance().ObterTodos());
            return View();
        }

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

            if (consultaV == null)//caso a consulta nunca tenha sido feita para esse relato
            {
                ConsultaFixoModel consultaF = new ConsultaFixoModel();

                long idConsultaF = GerenciadorConsultaFixo.GetInstance().Inserir(consultaF);
                //ainda em teste
                //alimenta a tabela tb_turma_pessoa_relato 
                TurmaPessoaRelatoModel tPR = new TurmaPessoaRelatoModel();
                tPR.IdPessoa = idPessoa;
                tPR.IdTurma = idTurma;
                tPR.IdRelato = idRelato;
                tPR.IdConsultaFixo = idConsultaF; //Default
                tPR.EstadoPreenchimento = "A";
                                
                GerenciadorTurmaPessoaRelato.GetInstance().Inserir(tPR);
                
                //Cria uma consulta Variavel caso não exista uma para as seguintes especificações
                ConsultaVariavelModel consultaVM = new ConsultaVariavelModel();
                consultaVM.IdPessoa = idPessoa;
                consultaVM.IdTurma = idTurma;
                consultaVM.IdRelato = idRelato;
                consultaVM.IdConsultaFixo = idConsultaF;//Default
                consultaVM.IdRazaoEncontro = 1;//Default

                long idConsultaV = GerenciadorConsultaVariavel.GetInstance().Inserir(consultaVM);

                vmConsulta.idConsultaFixo = idConsultaF;
                vmConsulta.idConsultaVariavel = idConsultaV;

                return View(vmConsulta);
            }

            vmConsulta.idConsultaFixo = consultaV.IdConsultaFixo;
            vmConsulta.idConsultaVariavel = consultaV.IdConsultaVariavel;
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
                demoAntrop.Nome = "";
                demoAntrop.Genero = "";
                demoAntrop.IdPlanoSaude = 1;
                demoAntrop.IdEscolaridade = 1;
                demoAntrop.IdOcupacao = 1;
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

        //Experiencia medicamentos
        public PartialViewResult ExperienciaMedicamentos(int id)
        {

            return PartialView();
        }

        //Diario Pessoal
        public PartialViewResult DiarioPessoal(int id)
        {
            DiarioPessoalModel diarioPessoal = GerenciadorDiarioPessoal.GetInstance().Obter(id);

            ViewBag.situacao = "sssrrrsssss";

            if (diarioPessoal == null)
            {
                ViewBag.situacao = "Dados ainda não cadastrados";

                diarioPessoal = new DiarioPessoalModel();
                diarioPessoal.IdConsultaFixo = id;
                diarioPessoal.IdMedicamento = 1; //Default
                diarioPessoal.Periodo = "M"; //Default
                diarioPessoal.IdBebida = 1;
                GerenciadorDiarioPessoal.GetInstance().Inserir(diarioPessoal);
            }

            /*
            ViewBag.Periodo = new SelectList(new[] 
            {
                new {Valor = 1, Texto = "Manhã"}, 
                new {Valor = 2, Texto = "Tarde"}, 
                new {Valor = 3, Texto = "Noite"}
            }, "Valor", "Texto"); */
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", diarioPessoal.IdMedicamento);
            ViewBag.IdBebida = new SelectList(GerenciadorBebida.GetInstance().ObterTodos().ToList(), "IdBebida", "NomeBebida", diarioPessoal.IdBebida);
            return PartialView(diarioPessoal);
        }

        // Diario Pessoal
        [HttpPost]
        public PartialViewResult DiarioPessoal(DiarioPessoalModel diarioModel)
        {
            ViewBag.situacao = "Não Atualizado";

            if (ModelState.IsValid)
            {
                GerenciadorDiarioPessoal.GetInstance().Atualizar(diarioModel);
                ViewBag.situacao = "Atualizado";
            }

            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", diarioModel.IdMedicamento);
            ViewBag.IdBebida = new SelectList(GerenciadorBebida.GetInstance().ObterTodos().ToList(), "IdBebida", "NomeBebida", diarioModel.IdBebida);
            return PartialView(diarioModel);
        }

        //Estilo de Vida
        public PartialViewResult EstiloVida(int id)
        {
            EstiloVidaModel estiloVida = GerenciadorEstiloVida.GetInstance().Obter(id);

            if(estiloVida == null){

                estiloVida = new EstiloVidaModel();
                estiloVida.IdConsultaVariavel = id;

                GerenciadorEstiloVida.GetInstance().Inserir(estiloVida);
            }

            return PartialView(estiloVida);
        }

        //Estilo de Vida
        [HttpPost]
        public PartialViewResult EstiloVida(EstiloVidaModel estiloVida)
        {

            if (ModelState.IsValid)
            {
                GerenciadorEstiloVida.GetInstance().Atualizar(estiloVida);
            }

            return PartialView(estiloVida);
        }

        //Relato Clinico
        public PartialViewResult RelatoClinico(RelatoClinicoModel model)
        {
            return PartialView(model);
        }



        // Medicamentos Anteriores
        public PartialViewResult MedicamentosAnteriores(int id)
        {
            ViewBag.MedicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance().ObterTodos();
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 1);
         
            MedicamentosAnterioresModel medAnt = new MedicamentosAnterioresModel();
            medAnt.IdConsultaVariavel = id;
            return PartialView(medAnt);
        }
        // Medicamentos Anteriores
        [HttpPost]
        public PartialViewResult MedicamentosAnteriores(MedicamentosAnterioresModel medAnteriores)
        {
            if (ModelState.IsValid)
            {
                GerenciadorMedicamentosAnteriores.GetInstance().Inserir(medAnteriores);
            }
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 1);
            ViewBag.MedicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance().ObterTodos();
            
            return PartialView(medAnteriores);
        }

        // Medicamentos Anteriores
        [HttpPost, ActionName("Delete")]
        public PartialViewResult RemoverMedicamentosAnteriores(long idConsultaV, long idMedicamento)
        {
            GerenciadorMedicamentosAnteriores.GetInstance().Remover(idConsultaV, idMedicamento);

            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 1);
            ViewBag.medicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance().ObterTodos();


            MedicamentosAnterioresModel medAnt = new MedicamentosAnterioresModel();
            medAnt.IdConsultaVariavel = idConsultaV;
            return PartialView(medAnt);
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
