using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using PacienteVirtual.Negocio.Turma;

namespace PacienteVirtual.Controllers
{
    public class RelatoClinicoController : Controller
    {
        GerenciadorRelatoClinico gRelato = GerenciadorRelatoClinico.GetInstance();
        GerenciadorPaciente gPaciente = GerenciadorPaciente.GetInstance();


        //
        // GET: /RelatoClinico/Atribuir/5
        public ViewResult Atribuir(int idRelato, int idPaciente)
        {
            SessionController.IdRelato = idRelato;
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodos().ToList(), "IdTurma", "Codigo");
            return View(GerenciadorTurmaPessoa.GetInstance().ObterTodosAtivados());
        }

        //
        // GET: /RelatoClinico/AtribuirRelato/5
        public ActionResult AtribuirRelato(int idTurma, int idPessoa)
        {
            ConsultaFixoModel cfm = new ConsultaFixoModel();
            GerenciadorConsultaFixo.GetInstance().Inserir(cfm);
            ConsultaVariavelModel cvm = new ConsultaVariavelModel();
            TurmaPessoaRelatoModel tprm = new TurmaPessoaRelatoModel();
            cfm = GerenciadorConsultaFixo.GetInstance().TotalConsultasFixas();
            // dados consulta variavel
            cvm.IdConsultaFixo = cfm.IdConsultaFixo;
            cvm.IdEstadoConsulta = 1;
            cvm.IdPessoa = idPessoa;
            cvm.IdTurma = idTurma;
            cvm.IdRelato = SessionController.IdRelato;
            // dados turma pessoa relato
            tprm.IdConsultaFixo = cfm.IdConsultaFixo;
            tprm.IdPessoa = idPessoa;
            tprm.IdTurma = idTurma;
            tprm.IdRelato = SessionController.IdRelato;
            GerenciadorTurmaPessoaRelato.GetInstance().Inserir(tprm);   
            GerenciadorConsultaVariavel.GetInstance().Inserir(cvm);
            SessionController.IdRelato = 0;
            return RedirectToAction("Index", "RelatoClinico");
        }


        [HttpPost]
        public ActionResult Atribuir(int IdTurma = -1)
        {
            ViewBag.codigo = IdTurma;
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodos().ToList(), "IdTurma", "Codigo");
            if (IdTurma != -1)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaAtivados(IdTurma).ToList());
            }
            return View(GerenciadorTurmaPessoa.GetInstance().ObterTodosAtivados());
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

                return View(relatoModel);
            }
            ViewBag.fotoId = -1;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            return View(relatoModel);
        }

        //
        // GET: /RelatoClinico/Edit/5
        public ActionResult Edit(int id)
        {
            RelatoClinicoModel relatoModel = gRelato.Obter(id);
            ViewBag.fotoId = relatoModel.IdPaciente;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
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