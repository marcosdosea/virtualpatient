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

        // Index
        public ViewResult Index()
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos(), "IdPaciente", "NomePaciente");
            ViewBag.Codigo = Global.NaoSelecionado;
            Global.ZeraSessaoConsulta();
            SessionController.TutorVisualizaConsultaPeloCorrigirConsultas = false;
            if (SessionController.DadosTurmaPessoa.IdRole == Global.Tutor || SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorEnfermagem
                || SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorFarmacia)
            {
                return View(GerenciadorConsultaVariavel.GetInstance().ObterConsultasPorTurma(SessionController.DadosTurmaPessoa.IdTurma));
            }
            return View(GerenciadorConsultaVariavel.GetInstance().ObterConsultasPorTurmaPessoa(SessionController.DadosTurmaPessoa.IdTurma, SessionController.Pessoa.IdPessoa));
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = Global.NaoSelecionado)
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            if (IdPaciente != Global.NaoSelecionado)
            {
                ViewBag.Codigo = IdPaciente;
                if (SessionController.DadosTurmaPessoa.IdRole == Global.Tutor || SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorEnfermagem
                    || SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorFarmacia) 
                {
                    return View(GerenciadorConsultaVariavel.GetInstance().ObterPorPacienteTurma(IdPaciente, SessionController.DadosTurmaPessoa.IdTurma));
                }
                return View(GerenciadorConsultaVariavel.GetInstance().ObterPorPacienteTurmaPessoa(IdPaciente, SessionController.DadosTurmaPessoa.IdTurma, SessionController.Pessoa.IdPessoa));
            }
            ViewBag.Codigo = Global.NaoSelecionado;
            if (SessionController.DadosTurmaPessoa.IdRole == Global.Tutor || SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorEnfermagem
                || SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorFarmacia)
            {
                return View(GerenciadorConsultaVariavel.GetInstance().ObterConsultasPorTurma(SessionController.DadosTurmaPessoa.IdTurma));
            }
            return View(GerenciadorConsultaVariavel.GetInstance().ObterConsultasPorTurmaPessoa(SessionController.DadosTurmaPessoa.IdTurma, SessionController.Pessoa.IdPessoa));
        }

        //
        // GET: /Consulta/Edit
        public ActionResult Edit(long? idConsultaVariavel)
        {
            long idConsultaVariavelTemp = (idConsultaVariavel == null) ? SessionController.ConsultaVariavel.IdConsultaVariavel : (long)idConsultaVariavel;
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavelTemp);

            AtribuiEstadoDaConsultaEstadoDaCorrecao(consultaVariavelModel);
            
            GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
            SessionController.ConsultaVariavel = consultaVariavelModel;

            ConsultaModel consultaModel = ConsultaPrimeiraTela(consultaVariavelModel);
            ViewBagsPrimeiraParteConsulta(consultaModel);

            SessionController.IdEstadoConsulta = consultaVariavelModel.IdEstadoConsulta;
            SessionController.PrimeiraTelaConsulta = true;
            if (SessionController.EmCorrecao)
            {
                corrigirPrimeiraTela(consultaVariavelModel.IdPaciente, consultaVariavelModel.OrdemCronologica);
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

            ConsultaModel consultaModel = ConsultaSegundaTela(consultaVariavelModel);
            ViewBagsSegundaParteConsulta();
            
            SessionController.IdEstadoConsulta = consultaVariavelModel.IdEstadoConsulta;
            SessionController.PrimeiraTelaConsulta = false;

            if (SessionController.EmCorrecao)
            {
                corrigirSegundaTela(consultaVariavelModel.IdPaciente, consultaVariavelModel.OrdemCronologica);
            }
            
            return View(consultaModel);
        }

        // Concluir
        public ActionResult Concluir(long? idConsultaVariavel)
        {
            GerenciadorConsultaVariavel.GetInstance().Concluir(idConsultaVariavel);
            return RedirectToAction("Index", "Consulta");
        }

        /// <summary>
        /// Views bags com dados para a primeira parte da consulta
        /// </summary>
        /// <param name="consultaModel"></param>
        private void ViewBagsPrimeiraParteConsulta(ConsultaModel consultaModel)
        {
            // views bags comun aos cursos
            ViewBag.IdAlergia = new SelectList(GerenciadorAlergia.GetInstance().ObterTodos().ToList(), "IdAlergia", "Alergia");
            ViewBag.IdEstadoCivil = new SelectList(GerenciadorEstadoCivil.GetInstance().ObterTodos(), "IdEstadoCivil", "EstadoCivil", consultaModel.DemograficoAntropometrico.IdEstadoCivil);
            ViewBag.IdEscolaridade = new SelectList(gEscolaridade.ObterTodos(), "IdEscolaridade", "Nivel", consultaModel.DemograficoAntropometrico.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(gOcupacao.ObterTodos(), "IdOcupacao", "Descricao", consultaModel.DemograficoAntropometrico.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(gPlanoSaude.ObterTodos(), "IdPlanoSaude", "Nome", consultaModel.DemograficoAntropometrico.IdPlanoSaude);
            ViewBag.IdNaturalidade = new SelectList(GerenciadorNaturalidade.GetInstance().ObterTodos(), "IdNaturalidade", "Naturalidade", consultaModel.DemograficoAntropometrico.IdNaturalidade);
            ViewBag.IdReligiao = new SelectList(GerenciadorReligiao.GetInstance().ObterTodos(), "IdReligiao", "Religiao", consultaModel.DemograficoAntropometrico.IdReligiao);
            ViewBag.Abas1 = SessionController.Abas1;
            ViewBag.AbasRelato = SessionController.ConsultaVariavel.OrdemCronologica;
            ViewBag.Curso = SessionController.DadosTurmaPessoa.Curso;
            ViewBag.EscondeLinks = false;

            if (SessionController.DadosTurmaPessoa.Curso.Equals(Global.cursoFarmacia))
            {
                ViewsBagPrimeiraTelaCursoFarmacia(consultaModel);
            }
            else
            {
                ViewsBagPrimeiraTelaCursoEnfermagem();
            }
            
        }

        /// <summary>
        /// Atribui valores aos views bags exclusivos do curso de Enfermagem
        /// </summary>
        private void ViewsBagPrimeiraTelaCursoEnfermagem()
        {
            ViewBag.IdPatologia = new SelectList(GerenciadorPatologia.GetInstance().ObterTodos(), "IdPatologia", "Descricao");
        }

        /// <summary>
        /// Atribui valores aos views bags exclusivos do curso de Farmacia
        /// </summary>
        /// <param name="consultaModel"></param>
        private void ViewsBagPrimeiraTelaCursoFarmacia(ConsultaModel consultaModel)
        {
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos(), "IdSistema", "NomeSistema", consultaModel.IdSistema);
            ViewBag.IdQueixa = new SelectList(GerenciadorQueixa.GetInstance().ObterPorSistema(consultaModel.IdSistema), "IdQueixa", "DescricaoQueixa");
            ViewBag.IdRazaoEncontro = new SelectList(GerenciadorRazaoEncontro.GetInstance().ObterTodos().ToList(), "IdRazaoEncontro", "DescricaoRazao", consultaModel.ConsultaVariavel.IdRazaoEncontro);
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "Nome");
            ViewBag.IdParametroClinico = new SelectList(GerenciadorParametroClinico.GetInstance().ObterTodos().ToList(), "IdParametroClinico", "ParametroClinico");
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
        }
        
        /// <summary>
        /// Views bags com dados para a segunda parte da consulta
        /// </summary>
        private void ViewBagsSegundaParteConsulta()
        {
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "Nome");
            ViewBag.IdSuspeitaPrm = new SelectList(GerenciadorSuspeitaPrm.GetInstance().ObterTodos().ToList(), "IdSuspeitaPrm", "Descricao");
            ViewBag.IdBebida = new SelectList(SessionController.ListaBebidas, "IdBebida", "Nome");
            ViewBag.IdAcaoQueixa1 = new SelectList(GerenciadorAcaoQueixa.GetInstance().ObterTodos().ToList(), "IdAcaoQueixa", "DescricaoAcao");
            ViewBag.IdAcaoQueixa2 = new SelectList(GerenciadorAcaoQueixa.GetInstance().ObterTodos().ToList(), "IdAcaoQueixa", "DescricaoAcao");
            ViewBag.IdQueixaMedicamento = new SelectList(GerenciadorConsultaVariavelQueixa.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel).ToList(), "IdQueixa", "DescricaoQueixa");
            ViewBag.IdGrupoIntervencao = new SelectList(GerenciadorGrupoIntervencao.GetInstance().ObterTodos().ToList(), "IdGrupoIntervencao", "DescricaoGrupoIntervencao", SessionController.IdGrupoIntervencao);
            ViewBag.IdIntervencao = new SelectList(GerenciadorIntervencao.GetInstance().ObterPorGrupoIntervencao(SessionController.IdGrupoIntervencao), "IdIntervencao", "DescricaoIntervencao");
            ViewBag.IdCarta = new SelectList(GerenciadorCarta.GetInstance().ObterTodos(), "IdCarta", "NomePaciente");
            ViewBag.IdEspecialidade = new SelectList(GerenciadorEspecialidade.GetInstance().ObterTodos(), "IdEspecialidade", "Especialidade");
            ViewBag.AbasRelato = SessionController.ConsultaVariavel.OrdemCronologica;
            ViewBag.EscondeLinks = true;
            ViewBag.Curso = SessionController.DadosTurmaPessoa.Curso;
            ViewBag.Abas2 = SessionController.Abas2;
        }

        /// <summary>
        /// Preenchimento da consulta da primeira tela
        /// </summary>
        /// <param name="consultaVariavelModel"></param>
        /// <returns></returns>
        private ConsultaModel ConsultaPrimeiraTela(ConsultaVariavelModel consultaVariavelModel)
        {
            ConsultaModel consultaModel = ConsultaComumTelas(consultaVariavelModel, new ConsultaModel());
            ApontaPrimeiraConsultaPrimeiraTela(consultaVariavelModel);
            consultaModel.DemograficoAntropometrico = SessionController.DemograficosAntropometricos;
            if (SessionController.DadosTurmaPessoa.Curso.Equals(Global.cursoFarmacia))
            {
                ConsultaFarmaciaPrimeiraTela(consultaModel);
            }
            else
            {
                ConsultaEnfermagemPrimeiraTela(consultaModel);
            }
            return consultaModel;
        }

        /// <summary>
        /// Obtém os dados da consulta referente ao curso de Enfermagem
        /// </summary>
        /// <param name="consultaModel"></param>
        private static void ConsultaEnfermagemPrimeiraTela(ConsultaModel consultaModel)
        {
            consultaModel.Oxigenacao = SessionController.Oxigenacao;
            consultaModel.Termorregulacao = SessionController.Termorregulacao;
            consultaModel.ClinicoInternacao = SessionController.ClinicoInternacao;
            consultaModel.PatologiasAtuais = new PatologiasAtuaisModel { IdConsultaFixo = SessionController.ConsultaFixo.IdConsultaFixo };
            consultaModel.ListaPatologiasAtuais = SessionController.ListaPatologiasAtuais;
            consultaModel.AntecedentesPatologicos = new AntecedentesPatologicosModel { IdConsultaFixo = SessionController.ConsultaFixo.IdConsultaFixo };
            consultaModel.ListaAntecedentesPatologicos = SessionController.ListaAntecedentesPatologicos;
            consultaModel.AntecedentesFamiliares = new AntecedentesFamiliaresModel { IdConsultaFixo = SessionController.ConsultaFixo.IdConsultaFixo };
            consultaModel.ListaAntecedentesFamiliares = SessionController.ListaAntecedentesFamiliares;
            consultaModel.ClinicoInternacaoAlergias = new ClinicoInternacaoAlergiasModel { IdConsultaFixo = SessionController.ConsultaFixo.IdConsultaFixo };
            consultaModel.ListaClinicoInternacaoAlergias = SessionController.ListaClinicoInternacaoAlergia;
            consultaModel.IntegridadeTecidual = SessionController.IntegridadeTecidual;
            consultaModel.Higiene = SessionController.Higiene;
        }

        /// <summary>
        /// Obtém os dados da consulta referente ao curso de Farmacia
        /// </summary>
        /// <param name="consultaModel"></param>
        private static void ConsultaFarmaciaPrimeiraTela(ConsultaModel consultaModel)
        {
            consultaModel.Historia = SessionController.Historia;
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

        /// <summary>
        /// Preenchimento da consulta da segunda tela
        /// </summary>
        /// <param name="consultaVariavelModel"></param>
        /// <returns></returns>
        private ConsultaModel ConsultaSegundaTela(ConsultaVariavelModel consultaVariavelModel)
        {
            ConsultaModel consultaModel = ConsultaComumTelas(consultaVariavelModel, new ConsultaModel());
            ApontaPrimeiraConsultaSegundaTela(consultaVariavelModel);
            consultaModel.ListaDiarioPessoal = SessionController.ListaDiarioPessoal;
            consultaModel.DiarioPessoal = new DiarioPessoalModel() { IdConsultaFixo = SessionController.ConsultaVariavel.IdConsultaFixo };
            consultaModel.ListaConsultaVariavelQueixa = SessionController.ListaConsultaVariavelQueixa;
            consultaModel.QueixaMedicamento = new QueixaMedicamentoModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
            consultaModel.ListaQueixaMedicamento = SessionController.ListaQueixaMedicamento;
            consultaModel.IntervencaoConsulta = new IntervencaoConsultaModel() { IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel };
            consultaModel.ListaIntervencaoConsulta = SessionController.ListaIntervencaoConsulta;
            consultaModel.Carta = new CartaModel() { IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel };
            consultaModel.ListaCarta = SessionController.ListaCarta;
            return consultaModel;
        }

        /// <summary>
        /// Preenchimento dos valores comuns as duas telas da consulta
        /// </summary>
        /// <param name="consultaVariavelModel"></param>
        /// <param name="consultaModel"></param>
        /// <returns></returns>
        private ConsultaModel ConsultaComumTelas(ConsultaVariavelModel consultaVariavelModel, ConsultaModel consultaModel)
        {
            consultaModel.ConsultaVariavel = consultaVariavelModel;
            consultaModel.Paciente = SessionController.Paciente;
            consultaModel.RelatoClinico = SessionController.RelatoClinico;
            consultaModel.ConsultaFixo = SessionController.ConsultaFixo;
            return consultaModel;
        }
        
        /// <summary>
        /// Aponta para os dados Fixos da primeira consulta do paciente da primeira tela 
        /// </summary>
        /// <param name="consultaVariavelModel"></param>
        private void ApontaPrimeiraConsultaPrimeiraTela(ConsultaVariavelModel consultaVariavelModel)
        {
            if (consultaVariavelModel.OrdemCronologica != Global.ValorInicial)
            {
                ConsultaVariavelModel consultaOrdem1 = GerenciadorConsultaVariavel.GetInstance().ObterPrimeiraConsulta(consultaVariavelModel.IdPessoa
                    , consultaVariavelModel.IdTurma, consultaVariavelModel.IdPaciente);
                SessionController.DemograficosAntropometricos = GerenciadorDemograficosAntropometricos.GetInstance().Obter(consultaOrdem1.IdConsultaFixo);
                if (SessionController.DadosTurmaPessoa.Curso.Equals(Global.cursoFarmacia))
                {
                    SessionController.Historia = GerenciadorHistoria.GetInstance().Obter(consultaOrdem1.IdConsultaFixo);
                    SessionController.ExperienciaMedicamentos = GerenciadorExperienciaMedicamentos.GetInstance().Obter(consultaOrdem1.IdConsultaFixo);
                }
            }
        }

        /// <summary>
        /// Aponta para os dados Fixos da primeira consulta do paciente da segunda tela
        /// </summary>
        /// <param name="consultaVariavelModel"></param>
        private void ApontaPrimeiraConsultaSegundaTela(ConsultaVariavelModel consultaVariavelModel)
        {
            if (consultaVariavelModel.OrdemCronologica != Global.ValorInicial)
            {
                ConsultaVariavelModel consultaOrdem1 = GerenciadorConsultaVariavel.GetInstance().ObterPrimeiraConsulta(consultaVariavelModel.IdPessoa
                    , consultaVariavelModel.IdTurma, consultaVariavelModel.IdPaciente);
                SessionController.ListaDiarioPessoal = GerenciadorDiarioPessoal.GetInstance().Obter(consultaOrdem1.IdConsultaFixo);
            }
        }

        /// <summary>
        /// Atribui o estado da consulta e se a consulta está ou não em correção
        /// </summary>
        /// <param name="consultaVariavelModel"></param>
        private static void AtribuiEstadoDaConsultaEstadoDaCorrecao(ConsultaVariavelModel consultaVariavelModel)
        {
            if (SessionController.DadosTurmaPessoa.IdRole != Global.Tutor && consultaVariavelModel.IdEstadoConsulta == Global.AguardandoPreenchimento)
            {
                consultaVariavelModel.IdEstadoConsulta = Global.EmPreenchimento;
            }
            SessionController.EmCorrecao = false;
            if (SessionController.DadosTurmaPessoa.IdRole == Global.Tutor && (consultaVariavelModel.IdEstadoConsulta == Global.EmCorrecaoPeloTutor || consultaVariavelModel.IdEstadoConsulta == Global.EnviadoParaCorrecao))
            {
                consultaVariavelModel.IdEstadoConsulta = Global.EmCorrecaoPeloTutor;
                SessionController.EmCorrecao = true;
            }
        }
        
        /// <summary>
        /// Obtem o gabarito e faz a correção da consulta na primeira tela
        /// </summary>
        /// <param name="idPaciente"></param>
        /// <param name="ordemCronologica"></param>
        public void corrigirPrimeiraTela(int idPaciente, int ordemCronologica)
        {
            ConsultaVariavelModel gabaritoConsultaSelecionada = GerenciadorConsultaVariavel.GetInstance().ObterConsultaGabarito(idPaciente, ordemCronologica);
            DemograficosAntropometricosModel demograficoGabarito = GerenciadorDemograficosAntropometricos.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorDemograficosAntropometricos.GetInstance().CorrigirRespostas(SessionController.DemograficosAntropometricos, demograficoGabarito, ModelState);
            TryValidateModel(SessionController.DemograficosAntropometricos);
            if (SessionController.DadosTurmaPessoa.Curso.Equals(Global.cursoFarmacia))
            {
                CorrigirPrimeiraTelaCursoFarmacia(gabaritoConsultaSelecionada);
            }
            else
            {
                CorrigirPrimeiraTelaCursoEnfermagem(gabaritoConsultaSelecionada);
            }
        }

        /// <summary>
        /// Faz a correção da primeira tela do curso de Enfermagem
        /// </summary>
        /// <param name="gabaritoConsultaSelecionada"></param>
        private void CorrigirPrimeiraTelaCursoEnfermagem(ConsultaVariavelModel gabaritoConsultaSelecionada)
        {
            ClinicoInternacaoModel clinicoInternacaoGabarito = GerenciadorClinicoInternacao.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorClinicoInternacao.GetInstance().CorrigirRespostasClinicoInternacao(SessionController.ClinicoInternacao, clinicoInternacaoGabarito, ModelState);
            TryValidateModel(SessionController.ClinicoInternacao);
            IEnumerable<AlergiaModel> ListaClinicoInternacaoAlergiaGabarito = GerenciadorClinicoInternacao.GetInstance().ObterAlergias(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorClinicoInternacao.GetInstance().CorrigirRespostasAlergias(SessionController.ListaClinicoInternacaoAlergia, ListaClinicoInternacaoAlergiaGabarito, ModelState);
            IEnumerable<PatologiaModel> ListaAntecedentesPatologicosGabarito = GerenciadorClinicoInternacao.GetInstance().ObterAntecedentesPatologicos(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorClinicoInternacao.GetInstance().CorrigirRespostasAntecedentesPatologicos(SessionController.ListaAntecedentesPatologicos, ListaAntecedentesPatologicosGabarito, ModelState);
            IEnumerable<PatologiaModel> ListaAntecedentesFamiliaresGabarito = GerenciadorClinicoInternacao.GetInstance().ObterAntecedentesFamiliares(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorClinicoInternacao.GetInstance().CorrigirRespostasAntecedentesFamiliares(SessionController.ListaAntecedentesFamiliares, ListaAntecedentesFamiliaresGabarito, ModelState);
            IEnumerable<PatologiaModel> ListaPatologiasAtuaisGabarito = GerenciadorClinicoInternacao.GetInstance().ObterPatologiasAtuais(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorClinicoInternacao.GetInstance().CorrigirRespostasPatologiasAtuais(SessionController.ListaPatologiasAtuais, ListaPatologiasAtuaisGabarito, ModelState);
        }

        /// <summary>
        /// Faz a correção da primeira tela da consulta do curso de Farmácia
        /// </summary>
        /// <param name="gabaritoConsultaSelecionada"></param>
        private void CorrigirPrimeiraTelaCursoFarmacia(ConsultaVariavelModel gabaritoConsultaSelecionada)
        {
            ExamesFisicosModel examesFisicosGabarito = GerenciadorExamesFisicos.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorExamesFisicos.GetInstance().CorrigirRespostas(SessionController.ExamesFisicos, examesFisicosGabarito, ModelState);
            TryValidateModel(SessionController.ExamesFisicos);
            EstiloVidaModel estiloVidaGabarito = GerenciadorEstiloVida.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorEstiloVida.GetInstance().CorrigirRespostas(SessionController.EstiloVida, estiloVidaGabarito, ModelState);
            TryValidateModel(SessionController.EstiloVida);
            HistoriaModel historiaGabarito = GerenciadorHistoria.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorHistoria.GetInstance().CorrigirRespostas(SessionController.Historia, historiaGabarito, ModelState);
            TryValidateModel(SessionController.Historia);
            GerenciadorConsultaVariavel.GetInstance().CorrigirRespostasRazaoEncontro(SessionController.ConsultaVariavel, gabaritoConsultaSelecionada, ModelState);
            TryValidateModel(SessionController.ConsultaVariavel);
            ExperienciaMedicamentosModel experienciaMedicamentosGabarito = GerenciadorExperienciaMedicamentos.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorExperienciaMedicamentos.GetInstance().CorrigirRespostas(SessionController.ExperienciaMedicamentos, experienciaMedicamentosGabarito, ModelState);
            TryValidateModel(SessionController.ExperienciaMedicamentos);
            IEnumerable<MedicamentoPrescritoModel> ListaMedPrescGabarito = GerenciadorMedicamentoPrescrito.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorMedicamentoPrescrito.GetInstance().CorrigirRespostas(SessionController.ListaMedicamentosPrescritos, ListaMedPrescGabarito, ModelState);
            IEnumerable<MedicamentoNaoPrescritoModel> ListaMedNaoPrescGabarito = GerenciadorMedicamentoNaoPrescrito.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorMedicamentoNaoPrescrito.GetInstance().CorrigirRespostas(SessionController.ListaMedicamentoNaoPrescrito, ListaMedNaoPrescGabarito, ModelState);
            IEnumerable<MedicamentosAnterioresModel> ListaMedAntGabarito = GerenciadorMedicamentosAnteriores.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorMedicamentosAnteriores.GetInstance().CorrigirRespostas(SessionController.ListaMedicamentosAnteriores, ListaMedAntGabarito, ModelState);
            IEnumerable<ConsultaParametroModel> ListaParametroGabarito = GerenciadorConsultaParametro.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorConsultaParametro.GetInstance().CorrigirRespostas(SessionController.ListaConsultaParametro, ListaParametroGabarito, ModelState);
            IEnumerable<AlergiaModel> ListaAlergiaGabarito = GerenciadorExamesFisicos.GetInstance().ObterAlergias(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorExamesFisicos.GetInstance().CorrigirRespostasAlergias(SessionController.ListaAlergia, ListaAlergiaGabarito, ModelState);
            IEnumerable<ConsultaVariavelQueixaModel> ListaConsultVarQueixa = GerenciadorConsultaVariavelQueixa.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorConsultaVariavelQueixa.GetInstance().CorrigirRespostasConsulta1(SessionController.ListaConsultaVariavelQueixa, ListaConsultVarQueixa, ModelState);
        }
        
        /// <summary>
        /// Obtem o gabarito e faz a correção da consulta na segunda tela
        /// </summary>
        /// <param name="idPaciente"></param>
        /// <param name="ordemCronologica"></param>
        public void corrigirSegundaTela(int idPaciente, int ordemCronologica)
        {
            ConsultaVariavelModel gabaritoConsultaSelecionada = GerenciadorConsultaVariavel.GetInstance().ObterConsultaGabarito(idPaciente, ordemCronologica);
            IEnumerable<ConsultaVariavelQueixaModel> ListaConsultVarQueixa = GerenciadorConsultaVariavelQueixa.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorConsultaVariavelQueixa.GetInstance().CorrigirRespostasConsulta2(SessionController.ListaConsultaVariavelQueixa, ListaConsultVarQueixa, ModelState);
            IEnumerable<QueixaMedicamentoModel> ListaQueixaMedicamento = GerenciadorQueixaMedicamento.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorQueixaMedicamento.GetInstance().CorrigirRespostas(SessionController.ListaQueixaMedicamento, ListaQueixaMedicamento, ModelState);
            IEnumerable<DiarioPessoalModel> ListaDiarioPessoal = GerenciadorDiarioPessoal.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaFixo);
            GerenciadorDiarioPessoal.GetInstance().CorrigirRespostas(SessionController.ListaDiarioPessoal, ListaDiarioPessoal, ModelState);
            IEnumerable<CartaModel> listaCarta = GerenciadorCarta.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorCarta.GetInstance().CorrigirRespostas(SessionController.ListaCarta, listaCarta, ModelState);
            IEnumerable<IntervencaoConsultaModel> listaIntervencao = GerenciadorIntervencaoConsulta.GetInstance().Obter(gabaritoConsultaSelecionada.IdConsultaVariavel);
            GerenciadorIntervencaoConsulta.GetInstance().CorrigirRespostas(SessionController.ListaIntervencaoConsulta, listaIntervencao, ModelState);
        }
    }
}
