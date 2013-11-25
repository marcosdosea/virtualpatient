using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class CursoController : Controller
    {
        GerenciadorCurso gCurso = GerenciadorCurso.GetInstance();

        //
        // GET: /Curso/
        public ViewResult Index()
        {
           return View(gCurso.ObterTodos());
        }

        //
        // GET: /Curso/Details/5
        public ViewResult Details(int id)
        {
            return View(gCurso.Obter(id));
        }

        //
        // GET: /Curso/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Curso/Create
        [HttpPost]
        public ActionResult Create(CursoModel cursoModel)
        {
            if (ModelState.IsValid)
            {
                cursoModel.IdCurso = gCurso.Inserir(cursoModel);
                return RedirectToAction("Index");
            }
            return View(cursoModel);
        }
        
        //
        // GET: /Curso/Edit/5
        public ActionResult Edit(int id)
        {
            CursoModel cursoModel = gCurso.Obter(id);
            return View(cursoModel);
        }

        //
        // POST: /Curso/Edit/5

        [HttpPost]
        public ActionResult Edit(CursoModel cursoModel)
        {
            if (ModelState.IsValid)
            {
                gCurso.Atualizar(cursoModel);
                return RedirectToAction("Index");
            }
            return View(cursoModel);
        }

        //
        // GET: /Curso/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gCurso.Obter(id));
        }

        //
        // POST: /Curso/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gCurso.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}