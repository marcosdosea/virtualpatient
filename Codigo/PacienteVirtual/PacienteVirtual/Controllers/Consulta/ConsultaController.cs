﻿using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class ConsultaController : Controller
    {

        GerenciadorEscolaridade gEscolaridade = GerenciadorEscolaridade.GetInstance();
        GerenciadorPlanoSaude gPlanoSaude = GerenciadorPlanoSaude.GetInstance();
        GerenciadorOcupacao gOcupacao = GerenciadorOcupacao.GetInstance();
        GerenciadorResposta gResposta = GerenciadorResposta.GetInstance();

        public ViewResult Index()
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos(), "IdPaciente", "NomePaciente");
            // TODO: Obter por usuário autenticado
            return View(GerenciadorConsultaVariavel.GetInstance().ObterTodos());
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = -1)
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            if (IdPaciente != -1)
                return View(GerenciadorRelatoClinico.GetInstance().ObterRelatos(IdPaciente));
            if (IdPaciente == -1)
                return View(GerenciadorRelatoClinico.GetInstance().ObterTodos());
            return View();
        }

         //
        // GET: /VMConsulta/Edit
        public ActionResult Edit(long? idConsultaVariavel)
        {
            long idConsultaVariavelTemp = (idConsultaVariavel == null) ? SessionController.ConsultaVariavel.IdConsultaVariavel : (long)idConsultaVariavel;
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavelTemp);
            SessionController.ConsultaVariavel = consultaVariavelModel;
            
            ConsultaModel consultaModel = new ConsultaModel();
            consultaModel.ConsultaVariavel = consultaVariavelModel;
            consultaModel.Paciente = SessionController.Paciente;
            consultaModel.RelatoClinico = SessionController.RelatoClinico;
            consultaModel.ConsultaFixo = SessionController.ConsultaFixo;
            consultaModel.Historia = SessionController.Historia;
            consultaModel.DemograficoAntropometrico = SessionController.DemograficosAntropometricos;
            consultaModel.ExperienciaMedicamentos = SessionController.ExperienciaMedicamentos;
            consultaModel.ListaDiarioPessoal = SessionController.ListaDiarioPessoal;
            consultaModel.DiarioPessoal = new DiarioPessoalModel() { IdConsultaFixo = SessionController.ConsultaVariavel.IdConsultaFixo };

            //consultaModel.ConsultaVariavel = GerenciadorConsultaVariavel.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaFixo, SessionController.IdRelato);
            consultaModel.EstiloVida = new EstiloVidaModel() { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
            consultaModel.MedicamentoNaoPrescrito = new MedicamentoNaoPrescritoModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
            consultaModel.MedicamentoPrescrito = new MedicamentoPrescritoModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
            consultaModel.MedicamentosAnteriores = new MedicamentosAnterioresModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
            consultaModel.ListaMedicamentoPrescrito = SessionController.ListaMedicamentosPrescritos;
            consultaModel.ListaMedicamentosAnteriores = SessionController.ListaMedicamentosAnteriores;
            consultaModel.ListaMedicamentoNaoPrescrito = SessionController.ListaMedicamentoNaoPrescrito;

            // Dados Demográficos
            ViewBag.IdEscolaridade = new SelectList(gEscolaridade.ObterTodos().ToList(), "IdEscolaridade", "Nivel", consultaModel.DemograficoAntropometrico.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(gOcupacao.ObterTodos().ToList(), "IdOcupacao", "Descricao", consultaModel.DemograficoAntropometrico.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(gPlanoSaude.ObterTodos().ToList(), "IdPlanoSaude", "Nome", consultaModel.DemograficoAntropometrico.IdPlanoSaude);
            
            //Experiência Medicamentos
            ViewBag.IdRespostaEsperaTratamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaPreocupacoes = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaGrauEntendimento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaCultural = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaComportamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            
            // Diário Pessoal
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "Nome");
            ViewBag.IdBebida = new SelectList(SessionController.ListaBebidas, "IdBebida", "Nome");
            

            return View(consultaModel);
        }

        //Experiencia medicamentos
        public PartialViewResult ExperienciaMedicamentos(int id)
        {
            return PartialView();
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
        
        /* Medicamento não prescrito*/


        // Medicamento Nao Prescrito
        public PartialViewResult MedicamentoNaoPrescrito(int id)
        {
            ViewBag.MedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance().ObterTodos();
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);

            MedicamentoNaoPrescritoModel medNaoPrescrito = new MedicamentoNaoPrescritoModel();
            medNaoPrescrito.IdConsultaVariavel = id;
            return PartialView(medNaoPrescrito);
        }

        // Medicamento Nao Prescrito
        [HttpPost]
        public PartialViewResult MedicamentoNaoPrescrito(MedicamentoNaoPrescritoModel medicamentoNaoPrescrito)
        {
            if (ModelState.IsValid)
            {
                GerenciadorMedicamentoNaoPrescrito.GetInstance().Inserir(medicamentoNaoPrescrito);
            }
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);
            ViewBag.MedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance().ObterTodos().ToList();

            return PartialView(medicamentoNaoPrescrito);
        }

        // Medicamentos não prescrito
        [HttpPost, ActionName("Delete")]
        public PartialViewResult RemoverMedicamentoNaoPrescrito(long idConsultaV, long idMedicamento)
        {
            GerenciadorMedicamentoNaoPrescrito.GetInstance().Remover(idConsultaV, idMedicamento);

            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);
            ViewBag.MedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance().ObterTodos();

            MedicamentoNaoPrescritoModel medNaoPrescrito = new MedicamentoNaoPrescritoModel();
            medNaoPrescrito.IdConsultaVariavel = idConsultaV;
            return PartialView(medNaoPrescrito);
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