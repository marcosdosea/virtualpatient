using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class RelatoClinicoController : Controller
    {
        GerenciadorRelatoClinico gRelato = GerenciadorRelatoClinico.GetInstance();
        GerenciadorPaciente gPaciente = GerenciadorPaciente.GetInstance();

        //
        // RelatoClinico/Atribuir/5
        public ActionResult Atribuir(int idRelato, int idPaciente, int ordemCronologica)
        {
            SessionController.AlertaBox = "";
            SessionController.IdRelato = idRelato;
            ViewBag.NomePaciente = GerenciadorPaciente.GetInstance().ObterNomePorId(idPaciente);
            ViewBag.OrdemCronologica = ordemCronologica;
            if (SessionController.DadosTurmaPessoa.IdRole == Global.Administrador || 
                SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorEnfermagem ||
                SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorFarmacia)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterPorPerfil(SessionController.DadosTurmaPessoa.IdRole));
            }
            else
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterPorTurma(SessionController.DadosTurmaPessoa.IdTurma));
            }
        }

        //
        // RelatoClinico/AtribuirRelato/5
        public ActionResult AtribuirRelato(int idTurma, int idPessoa)
        {
            RelatoClinicoModel relato = GerenciadorRelatoClinico.GetInstance().Obter(SessionController.IdRelato);
            GerenciadorConsultaVariavel.GetInstance().VerificaSeConsultaFoiAtribuida(idPessoa, idTurma, relato.IdPaciente, relato.OrdemCronologica,
                SessionController.DadosTurmaPessoa.IdCurso);

            long idConsultaFixo = 0;
            ConsultaVariavelModel consultaVariavelAnteriorModel = null;
            CriaConsultaFixaOuApontaParaPrimeira(idTurma, idPessoa, relato, ref idConsultaFixo, ref consultaVariavelAnteriorModel);

            ConsultaVariavelModel cvm;
            long idConsultaVariavel;
            InserirConsultaVariavelTurmaPessoaRelato(idTurma, idPessoa, idConsultaFixo, out cvm, out idConsultaVariavel);

            if (relato.OrdemCronologica != Global.ValorInicial)
            {
                InserirDadosConsultaAnterior(consultaVariavelAnteriorModel, cvm, idConsultaVariavel);
            }
            SessionController.IdRelato = 0;
            SessionController.AlertaBox = "true";
            return RedirectToAction("Index", "RelatoClinico");
        }

        /// <summary>
        /// cria uma nova consulta Fixa ou faz apontar para os dados fixos da primeira consulta do paciente
        /// </summary>
        /// <param name="idTurma"></param>
        /// <param name="idPessoa"></param>
        /// <param name="relato"></param>
        /// <param name="idConsultaFixo"></param>
        /// <param name="consultaVariavelAnteriorModel"></param>
        private static void CriaConsultaFixaOuApontaParaPrimeira(int idTurma, int idPessoa, RelatoClinicoModel relato, ref long idConsultaFixo, ref ConsultaVariavelModel consultaVariavelAnteriorModel)
        {
            if (relato.OrdemCronologica == Global.ValorInicial)
            {
                ConsultaFixoModel cfm = new ConsultaFixoModel();
                idConsultaFixo = GerenciadorConsultaFixo.GetInstance().Inserir(cfm);
            }
            else
            {
                GerenciadorConsultaVariavel.GetInstance().ConsultaAnteriorFinalizada(idPessoa, idTurma, relato.IdPaciente, relato.OrdemCronologica,
                    SessionController.DadosTurmaPessoa.IdCurso);

                consultaVariavelAnteriorModel = GerenciadorConsultaVariavel.GetInstance().ObterConsultaAnterior(idPessoa, idTurma,
                    relato.IdPaciente, relato.OrdemCronologica);
                idConsultaFixo = consultaVariavelAnteriorModel.IdConsultaFixo;
            }
        }

        /// <summary>
        /// Cria e insere os dados de uma nova ConsultaVariavel e de uma TurmaPessoaRelato 
        /// </summary>
        /// <param name="idTurma"></param>
        /// <param name="idPessoa"></param>
        /// <param name="idConsultaFixo"></param>
        /// <param name="cvm"></param>
        /// <param name="idConsultaVariavel"></param>
        private static void InserirConsultaVariavelTurmaPessoaRelato(int idTurma, int idPessoa, long idConsultaFixo, out ConsultaVariavelModel cvm, out long idConsultaVariavel)
        {
            cvm = new ConsultaVariavelModel();
            TurmaPessoaRelatoModel tprm = new TurmaPessoaRelatoModel();
            cvm.IdConsultaFixo = idConsultaFixo;
            if (SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorEnfermagem || SessionController.DadosTurmaPessoa.IdRole == Global.AdministradorFarmacia)
            {
                cvm.IdEstadoConsulta = Global.GabaritoEmPreenchimento;
            }
            else
            {
                cvm.IdEstadoConsulta = Global.AguardandoPreenchimento;
            }
            cvm.IdPessoa = idPessoa;
            cvm.IdTurma = idTurma;
            cvm.IdRelato = SessionController.IdRelato;
            cvm.IdRazaoEncontro = Global.IdRazaoEncontro;

            tprm.IdConsultaFixo = idConsultaFixo;
            tprm.IdPessoa = idPessoa;
            tprm.IdTurma = idTurma;
            tprm.IdRelato = SessionController.IdRelato;
            GerenciadorTurmaPessoaRelato.GetInstance().Inserir(tprm);
            idConsultaVariavel = GerenciadorConsultaVariavel.GetInstance().Inserir(cvm);
        }

        /// <summary>
        /// Insere os dados não fixos da consulta anterior do paciente
        /// </summary>
        /// <param name="consultaVariavelAnteriorModel"></param>
        /// <param name="cvm"></param>
        /// <param name="idConsultaVariavel"></param>
        private static void InserirDadosConsultaAnterior(ConsultaVariavelModel consultaVariavelAnteriorModel, ConsultaVariavelModel cvm, long idConsultaVariavel)
        {
            cvm.IdRazaoEncontro = consultaVariavelAnteriorModel.IdRazaoEncontro;
            cvm.IdConsultaVariavel = idConsultaVariavel;
            cvm.DescricaoOutrosAchados = consultaVariavelAnteriorModel.DescricaoOutrosAchados;
            cvm.DescricaoDadosComplementares = consultaVariavelAnteriorModel.DescricaoDadosComplementares;
            cvm.InfoFornecidas = consultaVariavelAnteriorModel.InfoFornecidas;
            GerenciadorConsultaVariavel.GetInstance().Atualizar(cvm);
            SessionController.ConsultaVariavel = consultaVariavelAnteriorModel;

            if (SessionController.DadosTurmaPessoa.Curso.Equals(Global.cursoFarmacia))
            {
                DadosConsultaAnteriorFarmacia(consultaVariavelAnteriorModel, idConsultaVariavel);
            }
            else
            {
                DadosConsultaAnteriorEnfermagem(idConsultaVariavel);
            }
        }

        /// <summary>
        /// Insere os dados não fixos da consulta Anterior do curso de Enfermagem
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        private static void DadosConsultaAnteriorEnfermagem(long idConsultaVariavel)
        {
            ComunicacaoModel comunicacao = SessionController.Comunicacao;
            comunicacao.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorComunicacao.GetInstance().Inserir(comunicacao);
            SensorialModel sensorial = SessionController.Sensorial;
            sensorial.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorSensorial.GetInstance().Inserir(sensorial);
            OutrasNecessidadesModel outrasNecessidades = SessionController.OutrasNecessidades;
            outrasNecessidades.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorOutrasNecessidades.GetInstance().Inserir(outrasNecessidades);
            SexualidadeModel sexualidade = SessionController.Sexualidade;
            sexualidade.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorSexualidade.GetInstance().Inserir(sexualidade);
            ConscienciaModel consciencia = SessionController.Consciencia;
            consciencia.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorConsciencia.GetInstance().Inserir(consciencia);
            OxigenacaoModel oxigenacao = SessionController.Oxigenacao;
            oxigenacao.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorOxigenacao.GetInstance().Inserir(oxigenacao);
            TermorregulacaoModel termoRegulacao = SessionController.Termorregulacao;
            termoRegulacao.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorTermorregulacao.GetInstance().Inserir(termoRegulacao);
            IntegridadeTecidualModel integridadeTecidual = SessionController.IntegridadeTecidual;
            integridadeTecidual.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorIntegridadeTecidual.GetInstance().Inserir(integridadeTecidual);
            HigieneModel higiene = SessionController.Higiene;
            higiene.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorHigiene.GetInstance().Inserir(higiene);
            PsicoEspiritualModel psicoEspiritual = SessionController.PsicoEspiritual;
            psicoEspiritual.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorPsicoEspiritual.GetInstance().Inserir(psicoEspiritual);
            NutricaoModel nutricao = SessionController.Nutricao;
            nutricao.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorNutricao.GetInstance().Inserir(nutricao);
        }

        /// <summary>
        /// Insere os dados não fixos da consulta Anterior do curso de Farmacia
        /// </summary>
        /// <param name="consultaVariavelAnteriorModel"></param>
        /// <param name="idConsultaVariavel"></param>
        private static void DadosConsultaAnteriorFarmacia(ConsultaVariavelModel consultaVariavelAnteriorModel, long idConsultaVariavel)
        {
            EstiloVidaModel evm = SessionController.EstiloVida;
            evm.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorEstiloVida.GetInstance().Inserir(evm);
            ExamesFisicosModel efm = SessionController.ExamesFisicos;
            efm.IdConsultaVariavel = idConsultaVariavel;
            GerenciadorExamesFisicos.GetInstance().Inserir(efm);
            foreach (var a in GerenciadorExamesFisicos.GetInstance().ObterAlergias(consultaVariavelAnteriorModel.IdConsultaVariavel))
            {
                GerenciadorExamesFisicos.GetInstance().InserirAlergia(efm, a.IdAlergia);
            }
            foreach (var mp in SessionController.ListaMedicamentosPrescritos)
            {
                mp.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorMedicamentoPrescrito.GetInstance().Inserir(mp);
            }
            foreach (var ma in SessionController.ListaMedicamentosAnteriores)
            {
                ma.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorMedicamentosAnteriores.GetInstance().Inserir(ma);
            }
            foreach (var mnp in SessionController.ListaMedicamentoNaoPrescrito)
            {
                mnp.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorMedicamentoNaoPrescrito.GetInstance().Inserir(mnp);
            }
            foreach (var cp in SessionController.ListaConsultaParametro)
            {
                cp.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorConsultaParametro.GetInstance().Inserir(cp);
            }
            foreach (var cvq in SessionController.ListaConsultaVariavelQueixa)
            {
                cvq.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorConsultaVariavelQueixa.GetInstance().Inserir(cvq);
            }
            foreach (var qm in SessionController.ListaQueixaMedicamento)
            {
                qm.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorQueixaMedicamento.GetInstance().Inserir(qm);
            }
            foreach (var ic in SessionController.ListaIntervencaoConsulta)
            {
                ic.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorIntervencaoConsulta.GetInstance().Inserir(ic);
            }
            foreach (var c in SessionController.ListaCarta)
            {
                c.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorCarta.GetInstance().Inserir(c);
            }
        }

        // GET: /RelatoClinico/
        public ViewResult Index()
        {
            ViewBag.codigo = Global.NaoSelecionado;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            return View(gRelato.ObterTodos());
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = Global.NaoSelecionado)
        {
            ViewBag.codigo = IdPaciente;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            if (IdPaciente != Global.NaoSelecionado)
            {
                return View(gRelato.ObterRelatos(IdPaciente).ToList());
            }
            else
            {
                return View(gRelato.ObterTodos());
            }
        }

        // Listar
        public ViewResult Listar(int id)
        {
            return View(gRelato.ObterRelatos(id));
        }

        //Relato Clinico
        public PartialViewResult DetailsConsulta(RelatoClinicoModel model)
        {
            return PartialView(model);
        }

        //
        // GET: /RelatoClinico/Details/5
        public ViewResult Details(int id)
        {
            return View(gRelato.Obter(id));
        }

        public FileContentResult GetImage(int id)
        {
            if (id != Global.NaoSelecionado)
            {
                var imageData = GerenciadorPaciente.GetInstance().Obter(id).Foto;
                if (imageData != null)
                    return File(imageData, "image/jpg");
            }
            byte[] byt = System.IO.File.ReadAllBytes(Server.MapPath("~/Content/themes/pv/img/default-avatar.png"));
            return File(byt, "image/jpg");
        }

        // GET: /RelatoClinico/Create
        public ActionResult Create()
        {
            ViewBag.fotoId = Global.NaoSelecionado;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            ViewBag.IdAreaAtuacao = new SelectList(GerenciadorAreaAtuacao.GetInstance().ObterTodos(), "IdAreaAtuacao", "AreaAtuacao");
            return View();
        }

        //
        // POST: /RelatoClinico/Create
        [HttpPost]
        public ActionResult Create(RelatoClinicoModel relatoModel)
        {
            if (ModelState.IsValid)
            {
                relatoModel.IdRelato = gRelato.Inserir(relatoModel);
                ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
                return View("Index", gRelato.ObterRelatos(relatoModel.IdPaciente));

            }
            ViewBag.fotoId = Global.NaoSelecionado;
            if (relatoModel.IdPaciente > Global.ValorInteiroNulo)
            {
                ViewBag.fotoId = relatoModel.IdPaciente;
            }
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            ViewBag.IdAreaAtuacao = new SelectList(GerenciadorAreaAtuacao.GetInstance().ObterTodos(), "IdAreaAtuacao", "AreaAtuacao");
            return View(relatoModel);
        }

        //
        // GET: /RelatoClinico/Edit/5
        public ActionResult Edit(int id)
        {
            RelatoClinicoModel relatoModel = gRelato.Obter(id);
            ViewBag.fotoId = relatoModel.IdPaciente;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
            ViewBag.IdAreaAtuacao = new SelectList(GerenciadorAreaAtuacao.GetInstance().ObterTodos(), "IdAreaAtuacao", "AreaAtuacao", relatoModel.IdAreaAtuacao);
            return View(relatoModel);
        }

        //
        // POST: /RelatoClinico/Edit/5

        [HttpPost]
        public ActionResult Edit(RelatoClinicoModel relatoModel)
        {
            if (ModelState.IsValid)
            {
                gRelato.AtualizarRelatoSemOrdemCronologicaRepetida(relatoModel);
                return RedirectToAction("Index");
            }
            ViewBag.fotoId = relatoModel.IdPaciente;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
            ViewBag.IdAreaAtuacao = new SelectList(GerenciadorAreaAtuacao.GetInstance().ObterTodos(), "IdAreaAtuacao", "AreaAtuacao", relatoModel.IdAreaAtuacao);
            return View(relatoModel);
        }

        //
        // GET: /RelatoClinico/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gRelato.Obter(id));
        }

        //
        // POST: /RelatoClinico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gRelato.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }

    }
}