using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ObjetivoTerapeuticoController : Controller
    {
        //
        // GET: /ObjetivoTerapeutico/

        public ViewResult Index()
        {
            return View(GerenciadorObjetivoTerapeutico.GetInstance().ObterTodos());
        }

        //
        // GET: /ObjetivoTerapeutico/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorObjetivoTerapeutico.GetInstance().Obter(id));
        }

        //
        // GET: /ObjetivoTerapeutico/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ObjetivoTerapeutico/Create

        [HttpPost]
        public ActionResult Create(ObjetivoTerapeuticoModel objetivoTerapeutico)
        {
            if (ModelState.IsValid)
            {
                GerenciadorObjetivoTerapeutico.GetInstance().Inserir(objetivoTerapeutico);
                return RedirectToAction("Index");
            }

            return View(objetivoTerapeutico);
        }

        //
        // GET: /ObjetivoTerapeutico/Edit/5

        public ActionResult Edit(int id)
        {
            ObjetivoTerapeuticoModel objetivoTerapeutico = GerenciadorObjetivoTerapeutico.GetInstance().Obter(id);
            return View(objetivoTerapeutico);
        }

        //
        // POST: /ObjetivoTerapeutico/Edit/5

        [HttpPost]
        public ActionResult Edit(ObjetivoTerapeuticoModel objetivoTerapeutico)
        {
            if (ModelState.IsValid)
            {
                GerenciadorObjetivoTerapeutico.GetInstance().Atualizar(objetivoTerapeutico);
                return RedirectToAction("Index");
            }
            return View(objetivoTerapeutico);
        }

        //
        // GET: /ObjetivoTerapeutico/Delete/5

        public ActionResult Delete(int id)
        {
            ObjetivoTerapeuticoModel objetivoTerapeutico = GerenciadorObjetivoTerapeutico.GetInstance().Obter(id);
            return View(objetivoTerapeutico);
        }

        //
        // POST: /ObjetivoTerapeutico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorObjetivoTerapeutico.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}