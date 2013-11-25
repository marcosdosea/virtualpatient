using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class IntervencaoController : Controller
    {
        GerenciadorIntervencao gIntervencao = GerenciadorIntervencao.GetInstance();
        GerenciadorGrupoIntervencao gGrupoIntervencao = GerenciadorGrupoIntervencao.GetInstance();

        //
        // GET: /Intervencao/
        public ViewResult Index()
        {
            return View(gIntervencao.ObterTodos());
        }

        //
        // GET: /Intervencao/Details/5
        public ViewResult Details(int id)
        {
            return View(gIntervencao.Obter(id));
        }

        //
        // GET: /Intervencao/Create

        public ActionResult Create()
        {
            ViewBag.IdGrupoIntervencao = new SelectList(gGrupoIntervencao.ObterTodos(), "IdGrupoIntervencao", "DescricaoGrupoIntervencao");
            return View();
        }

        //
        // POST: /Intervencao/Create
        [HttpPost]
        public ActionResult Create(IntervencaoModel intervencaoModel)
        {
            if (ModelState.IsValid)
            {
                intervencaoModel.IdGrupoIntervencao = gIntervencao.Inserir(intervencaoModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdGrupoIntervencao = new SelectList(gGrupoIntervencao.ObterTodos(), "IdGrupoIntervencao", "DescricaoGrupoIntervencao", intervencaoModel.IdGrupoIntervencao);
            return View(intervencaoModel);
        }

        //
        // GET: /Intervencao/Edit/5
        public ActionResult Edit(int id)
        {
            IntervencaoModel intervencaoModel = gIntervencao.Obter(id);
            ViewBag.IdGrupoIntervencao = new SelectList(gGrupoIntervencao.ObterTodos(), "IdGrupoIntervencao", "DescricaoGrupoIntervencao", intervencaoModel.IdGrupoIntervencao);
            return View(intervencaoModel);
        }

        //
        // POST: /Intervencao/Edit/5

        [HttpPost]
        public ActionResult Edit(IntervencaoModel intervencaoModel)
        {
            if (ModelState.IsValid)
            {
                gIntervencao.Atualizar(intervencaoModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdGrupoIntervencao = new SelectList(gGrupoIntervencao.ObterTodos(), "IdGrupoIntervencao", "DescricaoGrupoIntervencao", intervencaoModel.IdGrupoIntervencao);
            return View(intervencaoModel);
        }

        //
        // GET: /Intervencao/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gIntervencao.Obter(id));
        }

        //
        // POST: /Intervencao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gIntervencao.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}