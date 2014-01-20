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
        // GET: /RelatoClinico/Atribuir/5
        public ActionResult Atribuir(int idRelato, int idPaciente, int ordemCronologica)
        {
            SessionController.IdRelato = idRelato;
            ViewBag.NomePaciente = GerenciadorPaciente.GetInstance().ObterNomePorId(idPaciente);
            ViewBag.OrdemCronologica = ordemCronologica;
            if (SessionController.DadosTurmaPessoa != null)
            {
                if (SessionController.DadosTurmaPessoa.IdRole == Global.Administrador)
                {
                    return View(GerenciadorTurmaPessoa.GetInstance().ObterPorPerfil(SessionController.DadosTurmaPessoa.IdRole));
                }
            }
            return View(GerenciadorTurmaPessoa.GetInstance().ObterPorTurma(SessionController.DadosTurmaPessoa.IdTurma));
        }

        //
        // GET: /RelatoClinico/AtribuirRelato/5
        public ActionResult AtribuirRelato(int idTurma, int idPessoa)
        {
            RelatoClinicoModel relato = GerenciadorRelatoClinico.GetInstance().Obter(SessionController.IdRelato);

            if (GerenciadorConsultaVariavel.GetInstance().consultaAtribuida(idPessoa, idTurma, relato.IdPaciente, relato.OrdemCronologica))
            {
                throw new NegocioException("Essa consulta já foi atribuída.");
            } 

            ConsultaFixoModel cfm = new ConsultaFixoModel();
            long idConsultaFixo = GerenciadorConsultaFixo.GetInstance().Inserir(cfm);
            
            ConsultaVariavelModel cvm = new ConsultaVariavelModel();
            TurmaPessoaRelatoModel tprm = new TurmaPessoaRelatoModel();
            
            // dados consulta variavel
            cvm.IdConsultaFixo = idConsultaFixo;
            cvm.IdEstadoConsulta = Global.AguardandoPreenchimento;
            cvm.IdPessoa = idPessoa;
            cvm.IdTurma = idTurma;
            cvm.IdRelato = SessionController.IdRelato;
            cvm.IdRazaoEncontro = Global.IdRazaoEncontro;
            // dados turma pessoa relato
            tprm.IdConsultaFixo = idConsultaFixo;
            tprm.IdPessoa = idPessoa;
            tprm.IdTurma = idTurma;
            tprm.IdRelato = SessionController.IdRelato;
            
            GerenciadorTurmaPessoaRelato.GetInstance().Inserir(tprm);
            long idConsultaVariavel = GerenciadorConsultaVariavel.GetInstance().Inserir(cvm);

            if (relato.OrdemCronologica != 1)
            {
                ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().ObterConsultaAnterior(idPessoa, idTurma,
                    relato.IdPaciente, relato.OrdemCronologica);
                
                SessionController.ConsultaVariavel = consultaVariavelModel;

                EstiloVidaModel evm = SessionController.EstiloVida;
                evm.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorEstiloVida.GetInstance().Inserir(evm);

                ExamesFisicosModel efm = SessionController.ExamesFisicos;
                efm.IdConsultaVariavel = idConsultaVariavel;
                GerenciadorExamesFisicos.GetInstance().Inserir(efm);

                foreach (var a in GerenciadorExamesFisicos.GetInstance().ObterAlergias(consultaVariavelModel.IdConsultaVariavel)) {
                    GerenciadorExamesFisicos.GetInstance().InserirAlergia(efm, a.IdAlergia);
                }
                
                foreach (var mp in SessionController.ListaMedicamentosPrescritos) {
                    mp.IdConsultaVariavel = idConsultaVariavel;
                    GerenciadorMedicamentoPrescrito.GetInstance().Inserir(mp);
                }

                foreach (var ma in SessionController.ListaMedicamentosAnteriores) {
                    ma.IdConsultaVariavel = idConsultaVariavel;
                    GerenciadorMedicamentosAnteriores.GetInstance().Inserir(ma);
                }

                foreach (var mnp in SessionController.ListaMedicamentoNaoPrescrito) {
                    mnp.IdConsultaVariavel = idConsultaVariavel;
                    GerenciadorMedicamentoNaoPrescrito.GetInstance().Inserir(mnp);
                }

                foreach (var cp in SessionController.ListaConsultaParametro) {
                    cp.IdConsultaVariavel = idConsultaVariavel;
                    GerenciadorConsultaParametro.GetInstance().Inserir(cp);
                }
                
                foreach (var cvq in SessionController.ListaConsultaVariavelQueixa) {
                    cvq.IdConsultaVariavel = idConsultaVariavel;
                    GerenciadorConsultaVariavelQueixa.GetInstance().Inserir(cvq);
                }
                
                foreach (var qm in SessionController.ListaQueixaMedicamento) {
                    qm.IdConsultaVariavel = idConsultaVariavel;
                    GerenciadorQueixaMedicamento.GetInstance().Inserir(qm);
                }

                foreach (var ic in SessionController.ListaIntervencaoConsulta) {
                    ic.IdConsultaVariavel = idConsultaVariavel;
                    GerenciadorIntervencaoConsulta.GetInstance().Inserir(ic);
                }

                foreach (var c in SessionController.ListaCarta) {
                    c.IdConsultaVariavel = idConsultaVariavel;
                    GerenciadorCarta.GetInstance().Inserir(c);
                }
            }
            
            SessionController.IdRelato = 0;
            return RedirectToAction("Index", "RelatoClinico");
        }

        // GET: /RelatoClinico/
        public ViewResult Index()
        {
            ViewBag.codigo = -1;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            return View(gRelato.ObterTodos());
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = -1)
        {

            ViewBag.codigo = IdPaciente;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            if (IdPaciente != -1)
            {
                return View(gRelato.ObterRelatos(IdPaciente).ToList());
            }
            if (IdPaciente == -1)
            {
                return View(gRelato.ObterTodos());
            }
            return View();
        }

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
            if (id != -1)
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
            ViewBag.fotoId = -1;
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

            if (relatoModel.IdPaciente > 0)
            {
                //ViewBag.teste = "passou pelo -1" + relatoModel.IdPaciente;
                ViewBag.fotoId = relatoModel.IdPaciente;
                ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
                ViewBag.IdAreaAtuacao = new SelectList(GerenciadorAreaAtuacao.GetInstance().ObterTodos(), "IdAreaAtuacao", "AreaAtuacao");
                return View(relatoModel);
            }
            ViewBag.fotoId = -1;
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
                bool salvar = true;
                foreach (var ordem in gRelato.ObterRelatosExcecaoDoPassado(relatoModel.IdPaciente, relatoModel.IdRelato))
                {
                    if (ordem.OrdemCronologica == relatoModel.OrdemCronologica)
                    {
                        salvar = false;
                        break;
                    }
                };
                if (salvar)
                {
                    gRelato.Atualizar(relatoModel);
                    return RedirectToAction("Index");
                }
                else
                {
                    TempData["MensagemErro"] = "•Não foi possível editar o Relato Clínico, pois já existe um relato com a Ordem Cronológica especificada!";
                }
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