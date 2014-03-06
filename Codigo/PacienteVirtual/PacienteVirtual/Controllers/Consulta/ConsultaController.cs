using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using System.Collections.Generic;

namespace PacienteVirtual.Controllers
{
    public class ConsultaController : Controller
    {

        const int PERGUNTA_ESPERA_TRATAMENTO = 2;
        const int PERGUNTA_PREOCUPACOES = 3;
        const int PERGUNTA_GRAU_ENTENDIMENTO = 4;
        const int PERGUNTA_CULTURAL = 5;
        const int PERGUNTA_COMPORTAMENTO = 6;
        const int PERGUNTA_INCORPORADO_PLANO = 7;

        GerenciadorEscolaridade gEscolaridade = GerenciadorEscolaridade.GetInstance();
        GerenciadorPlanoSaude gPlanoSaude = GerenciadorPlanoSaude.GetInstance();
        GerenciadorOcupacao gOcupacao = GerenciadorOcupacao.GetInstance();
        GerenciadorResposta gResposta = GerenciadorResposta.GetInstance();

        public ViewResult Index()
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos(), "IdPaciente", "NomePaciente");
            ViewBag.Codigo = -1;
            // TODO: Obter por usuário autenticado

            Global.ZeraSessaoConsulta();
            SessionController.TutorVisualizaConsultaPeloCorrigirConsultas = false;
            
            if (SessionController.DadosTurmaPessoa.IdRole == Global.Tutor)
            {
                return View(GerenciadorConsultaVariavel.GetInstance().ObterConsultasPorTurma(SessionController.DadosTurmaPessoa.IdTurma));
            }
            return View(GerenciadorConsultaVariavel.GetInstance().ObterConsultasPorTurmaPessoa(SessionController.DadosTurmaPessoa.IdTurma, SessionController.Pessoa.IdPessoa));
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = -1)
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos().ToList(), "IdPaciente", "NomePaciente");

            if (IdPaciente != -1)
            {
                ViewBag.Codigo = IdPaciente;
                if (SessionController.DadosTurmaPessoa.IdRole == Global.Tutor) {
                    return View(GerenciadorConsultaVariavel.GetInstance().ObterPorPacienteTurma(IdPaciente, SessionController.DadosTurmaPessoa.IdTurma));
                }
                return View(GerenciadorConsultaVariavel.GetInstance().ObterPorPacienteTurmaPessoa(IdPaciente, SessionController.DadosTurmaPessoa.IdTurma, SessionController.Pessoa.IdPessoa));
            }
            ViewBag.Codigo = -1;
            if (SessionController.DadosTurmaPessoa.IdRole == Global.Tutor)
            {
                return View(GerenciadorConsultaVariavel.GetInstance().ObterConsultasPorTurma(SessionController.DadosTurmaPessoa.IdTurma));
            }
            return View(GerenciadorConsultaVariavel.GetInstance().ObterConsultasPorTurmaPessoa(SessionController.DadosTurmaPessoa.IdTurma, SessionController.Pessoa.IdPessoa));
        }

        //
        // GET: /VMConsulta/Edit
        public ActionResult Edit(long? idConsultaVariavel)
        {
            long idConsultaVariavelTemp = (idConsultaVariavel == null) ? SessionController.ConsultaVariavel.IdConsultaVariavel : (long)idConsultaVariavel;
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavelTemp);
            
            if (SessionController.DadosTurmaPessoa.IdRole != Global.Tutor &&  consultaVariavelModel.IdEstadoConsulta == Global.AguardandoPreenchimento)
            {
                consultaVariavelModel.IdEstadoConsulta = Global.EmPreenchimento;
            }
            SessionController.EmCorrecao = false;
            if (SessionController.DadosTurmaPessoa.IdRole == Global.Tutor && (consultaVariavelModel.IdEstadoConsulta == Global.EmCorrecaoPeloTutor || consultaVariavelModel.IdEstadoConsulta == Global.EnviadoParaCorrecao))
            {
                consultaVariavelModel.IdEstadoConsulta = Global.EmCorrecaoPeloTutor;
                SessionController.EmCorrecao = true;
            }
            
            GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
            SessionController.ConsultaVariavel = consultaVariavelModel;

            ConsultaModel consultaModel = ConsultaSelecionada(consultaVariavelModel, true);

            // Consulta Queixa
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos(), "IdSistema", "NomeSistema", consultaModel.IdSistema);
            ViewBag.IdQueixa = new SelectList(GerenciadorQueixa.GetInstance().ObterPorSistema(consultaModel.IdSistema), "IdQueixa", "DescricaoQueixa");
            ViewBag.EscondeLinks = false;
            
            // Exames Fisicos
            ViewBag.IdAlergia = new SelectList(GerenciadorAlergia.GetInstance().ObterTodos().ToList(), "IdAlergia", "Alergia");

            // teste com razão encontro
            ViewBag.IdRazaoEncontro = new SelectList(GerenciadorRazaoEncontro.GetInstance().ObterTodos().ToList(), "IdRazaoEncontro", "DescricaoRazao", consultaModel.ConsultaVariavel.IdRazaoEncontro);

            // Dados Demográficos
            ViewBag.IdEscolaridade = new SelectList(gEscolaridade.ObterTodos(), "IdEscolaridade", "Nivel", consultaModel.DemograficoAntropometrico.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(gOcupacao.ObterTodos(), "IdOcupacao", "Descricao", consultaModel.DemograficoAntropometrico.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(gPlanoSaude.ObterTodos(), "IdPlanoSaude", "Nome", consultaModel.DemograficoAntropometrico.IdPlanoSaude);
            ViewBag.IdEstadoCivil = new SelectList(GerenciadorEstadoCivil.GetInstance().ObterTodos(), "IdEstadoCivil", "EstadoCivil", consultaModel.DemograficoAntropometrico.IdEstadoCivil);
            ViewBag.IdNaturalidade = new SelectList(GerenciadorNaturalidade.GetInstance().ObterTodos(), "IdNaturalidade", "Naturalidade", consultaModel.DemograficoAntropometrico.IdNaturalidade);
            ViewBag.IdReligiao = new SelectList(GerenciadorReligiao.GetInstance().ObterTodos(), "IdReligiao", "Religiao", consultaModel.DemograficoAntropometrico.IdReligiao);
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "Nome");

            //Parâmetro Clínico
            ViewBag.IdParametroClinico = new SelectList(GerenciadorParametroClinico.GetInstance().ObterTodos().ToList(), "IdParametroClinico", "ParametroClinico");

            // Preencher perguntas e respostas do eperiência Medicamentos
            ViewBag.PerguntaEsperaTratamento = SessionController.ObterPergunta(PERGUNTA_ESPERA_TRATAMENTO).Pergunta;
            ViewBag.IdRespostaEsperaTratamento = new SelectList(SessionController.ObterRespostas(PERGUNTA_ESPERA_TRATAMENTO), "IdResposta", "Resposta", consultaModel.ExperienciaMedicamentos.IdRespostaEsperaTratamento);
            ViewBag.PerguntaPreocupacoes = SessionController.ObterPergunta(PERGUNTA_PREOCUPACOES).Pergunta;
            ViewBag.IdRespostaPreocupacoes = new SelectList(SessionController.ObterRespostas(PERGUNTA_PREOCUPACOES), "IdResposta", "Resposta", consultaModel.ExperienciaMedicamentos.IdRespostaPreocupacoes);
            ViewBag.PerguntaGrauEntendimento = SessionController.ObterPergunta(PERGUNTA_GRAU_ENTENDIMENTO).Pergunta;
            ViewBag.IdRespostaGrauEntendimento = new SelectList(SessionController.ObterRespostas(PERGUNTA_GRAU_ENTENDIMENTO), "IdResposta", "Resposta", consultaModel.ExperienciaMedicamentos.IdRespostaGrauEntendimento);
            ViewBag.PerguntaCultural = SessionController.ObterPergunta(PERGUNTA_CULTURAL).Pergunta;
            ViewBag.IdRespostaCultural = new SelectList(SessionController.ObterRespostas(PERGUNTA_CULTURAL), "IdResposta", "Resposta", consultaModel.ExperienciaMedicamentos.IdRespostaCultural);
            ViewBag.PerguntaComportamento = SessionController.ObterPergunta(PERGUNTA_COMPORTAMENTO).Pergunta;
            ViewBag.IdRespostaComportamento = new SelectList(SessionController.ObterRespostas(PERGUNTA_COMPORTAMENTO), "IdResposta", "Resposta", consultaModel.ExperienciaMedicamentos.IdRespostaComportamento);
            ViewBag.PerguntaIncorporadoPlano = SessionController.ObterPergunta(PERGUNTA_INCORPORADO_PLANO).Pergunta;
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(SessionController.ObterRespostas(PERGUNTA_INCORPORADO_PLANO), "IdResposta", "Resposta", consultaModel.ExperienciaMedicamentos.IdRespostaIncorporadoPlano);
            ViewBag.Abas1 = SessionController.Abas1;
            ViewBag.AbasRelato = SessionController.ConsultaVariavel.OrdemCronologica;
            ViewBag.Curso = SessionController.DadosTurmaPessoa.Curso;

            SessionController.IdEstadoConsulta = consultaVariavelModel.IdEstadoConsulta;
            
            SessionController.PrimeiraTelaConsulta = true;
            if (SessionController.EmCorrecao)
            {
                corrigir(consultaVariavelModel.IdPaciente, consultaVariavelModel.OrdemCronologica);
            }

            return View(consultaModel);
        }

        //
        // GET: /Consulta2/
        public ActionResult Edit2(long? idConsultaVariavel)
        {
            long idConsultaVariavelTemp = (idConsultaVariavel == null) ? SessionController.ConsultaVariavel.IdConsultaVariavel : (long)idConsultaVariavel;
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavelTemp);
            SessionController.ConsultaVariavel = consultaVariavelModel;

            ConsultaModel consultaModel = ConsultaSelecionada(consultaVariavelModel, false);

            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "Nome");
            ViewBag.IdSuspeitaPrm = new SelectList(GerenciadorSuspeitaPrm.GetInstance().ObterTodos().ToList(), "IdSuspeitaPrm", "Descricao");
            ViewBag.IdBebida = new SelectList(SessionController.ListaBebidas, "IdBebida", "Nome");
            ViewBag.IdAcaoQueixa1 = new SelectList(GerenciadorAcaoQueixa.GetInstance().ObterTodos().ToList(), "IdAcaoQueixa", "DescricaoAcao");
            ViewBag.IdAcaoQueixa2 = new SelectList(GerenciadorAcaoQueixa.GetInstance().ObterTodos().ToList(), "IdAcaoQueixa", "DescricaoAcao");
            ViewBag.IdQueixaMedicamento = new SelectList(GerenciadorConsultaVariavelQueixa.GetInstance().ObterPorConsultaVariavelTodosSuspeitaPRM(SessionController.ConsultaVariavel.IdConsultaVariavel).ToList(), "IdQueixa", "DescricaoQueixa");
            ViewBag.IdGrupoIntervencao = new SelectList(GerenciadorGrupoIntervencao.GetInstance().ObterTodos().ToList(), "IdGrupoIntervencao", "DescricaoGrupoIntervencao", SessionController.IdGrupoIntervencao);
            ViewBag.IdIntervencao = new SelectList(GerenciadorIntervencao.GetInstance().ObterPorGrupoIntervencao(SessionController.IdGrupoIntervencao), "IdIntervencao", "DescricaoIntervencao");
            ViewBag.IdCarta = new SelectList(GerenciadorCarta.GetInstance().ObterTodos(), "IdCarta", "NomePaciente");
            ViewBag.IdEspecialidade = new SelectList(GerenciadorEspecialidade.GetInstance().ObterTodos(), "IdEspecialidade", "Especialidade");
            ViewBag.AbasRelato = SessionController.ConsultaVariavel.OrdemCronologica;
            ViewBag.EscondeLinks = true;
            ViewBag.Curso = SessionController.DadosTurmaPessoa.Curso;
            ViewBag.Abas2 = SessionController.Abas2;
            
            SessionController.IdEstadoConsulta = consultaVariavelModel.IdEstadoConsulta;
            SessionController.PrimeiraTelaConsulta = false;
            
            return View(consultaModel);
        }

        public ActionResult Concluir(long? idConsultaVariavel)
        {
            long idConsultaVariavelTemp = (idConsultaVariavel == null) ? SessionController.ConsultaVariavel.IdConsultaVariavel : (long)idConsultaVariavel;
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavelTemp);
            if (SessionController.DadosTurmaPessoa.IdRole == Global.Usuario)
            {
                consultaVariavelModel.IdEstadoConsulta = Global.EnviadoParaCorrecao;
            }
            else if(SessionController.DadosTurmaPessoa.IdRole == Global.Administrador) 
            {
                consultaVariavelModel.IdEstadoConsulta = Global.GabaritoDisponivel;
            }
            GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
            return RedirectToAction("Index", "Consulta");
        }

        public ConsultaModel ConsultaSelecionada(ConsultaVariavelModel consultaVariavelModel, bool primeiraTela)
        {
            ConsultaModel consultaModel = new ConsultaModel();
            consultaModel.ConsultaVariavel = consultaVariavelModel;
            consultaModel.Paciente = SessionController.Paciente;
            consultaModel.RelatoClinico = SessionController.RelatoClinico;
            consultaModel.ConsultaFixo = SessionController.ConsultaFixo;

            // aponta para consulta 1
            if (consultaVariavelModel.OrdemCronologica != 1)
            {
                ConsultaVariavelModel consultaOrdem1 = GerenciadorConsultaVariavel.GetInstance().ObterPrimeiraConsulta(consultaVariavelModel.IdPessoa
                    , consultaVariavelModel.IdTurma, consultaVariavelModel.IdPaciente);
                if (primeiraTela)
                {
                    SessionController.Historia = GerenciadorHistoria.GetInstance().Obter(consultaOrdem1.IdConsultaFixo);
                    SessionController.DemograficosAntropometricos = GerenciadorDemograficosAntropometricos.GetInstance().Obter(consultaOrdem1.IdConsultaFixo);
                    SessionController.ExperienciaMedicamentos = GerenciadorExperienciaMedicamentos.GetInstance().Obter(consultaOrdem1.IdConsultaFixo);
                }
                else
                {
                    SessionController.ListaDiarioPessoal = GerenciadorDiarioPessoal.GetInstance().Obter(consultaOrdem1.IdConsultaFixo);
                }
            }

            if (primeiraTela)
            {
                consultaModel.Historia = SessionController.Historia;
                consultaModel.DemograficoAntropometrico = SessionController.DemograficosAntropometricos;
                consultaModel.ExperienciaMedicamentos = SessionController.ExperienciaMedicamentos;
                consultaModel.EstiloVida = SessionController.EstiloVida;
                consultaModel.MedicamentoNaoPrescrito = new MedicamentoNaoPrescritoModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
                consultaModel.MedicamentoPrescrito = new MedicamentoPrescritoModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
                consultaModel.MedicamentosAnteriores = new MedicamentosAnterioresModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
                consultaModel.ConsultaParametro = new ConsultaParametroModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
                consultaModel.ExamesFisicos = SessionController.ExamesFisicos;
                consultaModel.ListaMedicamentoPrescrito = SessionController.ListaMedicamentosPrescritos;
                consultaModel.ListaMedicamentosAnteriores = SessionController.ListaMedicamentosAnteriores;
                consultaModel.ListaMedicamentoNaoPrescrito = SessionController.ListaMedicamentoNaoPrescrito;
                consultaModel.ListaConsultaParametro = SessionController.ListaConsultaParametro;
                consultaModel.ConsultaVariavelQueixa = new ConsultaVariavelQueixaModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
                consultaModel.ListaConsultaVariavelQueixa = SessionController.ListaConsultaVariavelQueixa;
                consultaModel.IdSistema = SessionController.Sistema;
                consultaModel.AlergiaExamesFisicos = new AlergiaExamesFisicosModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel }; ;
                consultaModel.ListaAlergia = SessionController.ListaAlergia;
            }
            else
            {
                consultaModel.ListaDiarioPessoal = SessionController.ListaDiarioPessoal;
                consultaModel.DiarioPessoal = new DiarioPessoalModel() { IdConsultaFixo = SessionController.ConsultaVariavel.IdConsultaFixo };
                consultaModel.ListaConsultaVariavelQueixa = SessionController.ListaConsultaVariavelQueixa;
                consultaModel.QueixaMedicamento = new QueixaMedicamentoModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
                consultaModel.ListaQueixaMedicamento = SessionController.ListaQueixaMedicamento;
                consultaModel.IntervencaoConsulta = new IntervencaoConsultaModel() { IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel };
                consultaModel.ListaIntervencaoConsulta = SessionController.ListaIntervencaoConsulta;
                consultaModel.Carta = new CartaModel() { IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel };
                consultaModel.ListaCarta = SessionController.ListaCarta;
            }
            return consultaModel;
        }

        public void corrigir(int idPaciente, int ordemCronologica)
        {
            // Gabarito da consulta
            ConsultaVariavelModel gabaritoConsultaSelecionada = GerenciadorConsultaVariavel.GetInstance().ObterConsultaGabarito(idPaciente, ordemCronologica);
            // Demograficos Antropomedicos
            DemograficosAntropometricosModel demograficoGabarito = GerenciadorDemograficosAntropometricos.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorDemograficosAntropometricos.GetInstance().CorrigirRespostas(SessionController.DemograficosAntropometricos, demograficoGabarito, ModelState);
            TryValidateModel(SessionController.DemograficosAntropometricos);
            // Exames Físicos
            ExamesFisicosModel examesFisicosGabarito = GerenciadorExamesFisicos.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorExamesFisicos.GetInstance().CorrigirRespostas(SessionController.ExamesFisicos, examesFisicosGabarito, ModelState);
            TryValidateModel(SessionController.ExamesFisicos);
            // Estilo de Vida
            EstiloVidaModel estiloVidaGabarito = GerenciadorEstiloVida.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorEstiloVida.GetInstance().CorrigirRespostas(SessionController.EstiloVida, estiloVidaGabarito, ModelState);
            TryValidateModel(SessionController.EstiloVida);
            // Historia
            HistoriaModel historiaGabarito = GerenciadorHistoria.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorHistoria.GetInstance().CorrigirRespostas(SessionController.Historia, historiaGabarito, ModelState);
            TryValidateModel(SessionController.Historia);
            // Razão do encontro
            GerenciadorConsultaVariavel.GetInstance().CorrigirRespostasRazaoEncontro(SessionController.ConsultaVariavel, gabaritoConsultaSelecionada, ModelState);
            TryValidateModel(SessionController.ConsultaVariavel);
            // Experiencia com Medicamentos
            ExperienciaMedicamentosModel experienciaMedicamentosGabarito = GerenciadorExperienciaMedicamentos.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorExperienciaMedicamentos.GetInstance().CorrigirRespostas(SessionController.ExperienciaMedicamentos, experienciaMedicamentosGabarito, ModelState);
            TryValidateModel(SessionController.ExperienciaMedicamentos);
            // Medicamentos Prescristos
            IEnumerable<MedicamentoPrescritoModel> ListaMedPrescGabarito = GerenciadorMedicamentoPrescrito.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorMedicamentoPrescrito.GetInstance().CorrigirRespostas(SessionController.ListaMedicamentosPrescritos, ListaMedPrescGabarito, ModelState);
            // Medicamentos Nao prescristos
            IEnumerable<MedicamentoNaoPrescritoModel> ListaMedNaoPrescGabarito = GerenciadorMedicamentoNaoPrescrito.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorMedicamentoNaoPrescrito.GetInstance().CorrigirRespostas(SessionController.ListaMedicamentoNaoPrescrito, ListaMedNaoPrescGabarito, ModelState);
            // Medicamentos Anteriores
            IEnumerable<MedicamentosAnterioresModel> ListaMedAntGabarito = GerenciadorMedicamentosAnteriores.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorMedicamentosAnteriores.GetInstance().CorrigirRespostas(SessionController.ListaMedicamentosAnteriores, ListaMedAntGabarito, ModelState);
            // Parâmetros Clínicos
            IEnumerable<ConsultaParametroModel> ListaParametroGabarito = GerenciadorConsultaParametro.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorConsultaParametro.GetInstance().CorrigirRespostas(SessionController.ListaConsultaParametro, ListaParametroGabarito, ModelState);
            // Alergias
            IEnumerable<AlergiaModel> ListaAlergiaGabarito = GerenciadorExamesFisicos.GetInstance().ObterAlergias(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorExamesFisicos.GetInstance().CorrigirRespostasAlergias(SessionController.ListaAlergia, ListaAlergiaGabarito, ModelState);
        }
        
    }
}
