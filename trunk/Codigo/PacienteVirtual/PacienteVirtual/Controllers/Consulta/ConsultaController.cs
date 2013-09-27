using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models.Consulta;
using PacienteVirtual.Negocio.Consulta;

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
            
            // zerando sessão para ir no banco ir pegar os dados com o devido IdVariavel
            SessionController.Sistema = 0;
            SessionController.ConsultaFixo = null;
            SessionController.ConsultaVariavel = null;
            SessionController.DemograficosAntropometricos = null;
            SessionController.EstiloVida = null;
            SessionController.ExamesFisicos = null;
            SessionController.ExperienciaMedicamentos = null;
            SessionController.Historia = null;
            SessionController.ListaBebidas = null;
            SessionController.ListaConsultaParametro = null;
            SessionController.ListaConsultaVariavelQueixa = null;
            SessionController.ListaDiarioPessoal = null;
            SessionController.ListaMedicamentoNaoPrescrito = null;
            SessionController.ListaMedicamentos = null;
            SessionController.ListaMedicamentosAnteriores = null;
            SessionController.ListaMedicamentosPrescritos = null;
            SessionController.Paciente = null;
            SessionController.Pessoa = null;
            SessionController.RelatoClinico = null;
            SessionController.ListaAlergia = null;
            SessionController.ListaQueixaMedicamento = null;
            /////////////////////////////////////////////////////////////////

            return View(GerenciadorConsultaVariavel.GetInstance().ObterTodos());
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = -1)
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            if (IdPaciente != -1)
            {
                ViewBag.Codigo = IdPaciente;
                return View(GerenciadorRelatoClinico.GetInstance().ObterRelatos(IdPaciente));
            }
            if (IdPaciente == -1)
            {
                ViewBag.Codigo = -1;
                return View(GerenciadorRelatoClinico.GetInstance().ObterTodos());
            }
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

            consultaModel.AlergiaExamesFisicos = new AlergiaExamesFisicosModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel }; ;
            consultaModel.ListaAlergia = SessionController.ListaAlergia;

            // Exames Fisicos
            ViewBag.IdAlergia = new SelectList(GerenciadorAlergia.GetInstance().ObterTodos().ToList(), "IdAlergia", "Alergia");

            // teste com razão encontro
            ViewBag.IdRazaoEncontro = new SelectList(GerenciadorRazaoEncontro.GetInstance().ObterTodos().ToList(), "IdRazaoEncontro", "DescricaoRazao", consultaModel.ConsultaVariavel.IdRazaoEncontro);

            // Dados Demográficos
            ViewBag.IdEscolaridade = new SelectList(gEscolaridade.ObterTodos().ToList(), "IdEscolaridade", "Nivel", consultaModel.DemograficoAntropometrico.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(gOcupacao.ObterTodos().ToList(), "IdOcupacao", "Descricao", consultaModel.DemograficoAntropometrico.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(gPlanoSaude.ObterTodos().ToList(), "IdPlanoSaude", "Nome", consultaModel.DemograficoAntropometrico.IdPlanoSaude);
            
            // Diário Pessoal
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "Nome");
            ViewBag.IdBebida = new SelectList(SessionController.ListaBebidas, "IdBebida", "Nome");
            
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

            return View(consultaModel);
        }

        //
        // GET: /Consulta2/
        public ActionResult Edit2(long? idConsultaVariavel)
        {
            long idConsultaVariavelTemp = (idConsultaVariavel == null) ? SessionController.ConsultaVariavel.IdConsultaVariavel : (long)idConsultaVariavel;
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavelTemp);
            SessionController.ConsultaVariavel = consultaVariavelModel;

            ConsultaModel consultaModel = new ConsultaModel();
            consultaModel.ConsultaVariavel = consultaVariavelModel;
            consultaModel.Paciente = SessionController.Paciente;
            consultaModel.RelatoClinico = SessionController.RelatoClinico;

            consultaModel.ConsultaVariavelQueixa = new ConsultaVariavelQueixaModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
            consultaModel.ListaConsultaVariavelQueixa = SessionController.ListaConsultaVariavelQueixa;
            consultaModel.IdSistema = SessionController.Sistema;
            consultaModel.QueixaMedicamento = new QueixaMedicamentoModel { IdConsultaVariavel = consultaModel.ConsultaVariavel.IdConsultaVariavel };
            consultaModel.ListaQueixaMedicamento = SessionController.ListaQueixaMedicamento;


            // Consulta Queixa
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos(), "IdSistema", "NomeSistema", consultaModel.IdSistema);
            ViewBag.IdQueixa = new SelectList(GerenciadorQueixa.GetInstance().ObterPorSistema(consultaModel.IdSistema), "IdQueixa", "DescricaoQueixa");

            // queixa medicamentos
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "Nome");
            //ViewBag.IdSuspeitaPrm = new SelectList(gerenciador);

            return View(consultaModel);
        }

    }
}
