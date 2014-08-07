using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class DominioDiagnosticoController : Controller
    {
        //
        // GET: /DominioDiagnostico/

        public ViewResult Index()
        {
            return View(GerenciadorDominioDiagnostico.GetInstance().ObterTodos());
        }

        //
        // GET: /DominioDiagnostico/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorDominioDiagnostico.GetInstance().Obter(id));
        }

        //
        // GET: /DominioDiagnostico/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /DominioDiagnostico/Create

        [HttpPost]
        public ActionResult Create(DominioDiagnosticoModel dominioDiagnostico)
        {
            if (ModelState.IsValid)
            {
                dominioDiagnostico.IdDominioDiagnostico = GerenciadorDominioDiagnostico.GetInstance().Inserir(dominioDiagnostico);
                return RedirectToAction("Index");
            }
            return View(dominioDiagnostico);
        }

        //
        // GET: /DominioDiagnostico/Edit/5

        public ActionResult Edit(int id)
        {
            DominioDiagnosticoModel dominioDiagnostico = GerenciadorDominioDiagnostico.GetInstance().Obter(id);
            return View(dominioDiagnostico);
        }

        //
        // POST: /DominioDiagnostico/Edit/5

        [HttpPost]
        public ActionResult Edit(DominioDiagnosticoModel dominioDiagnostico)
        {
            if (ModelState.IsValid)
            {
                GerenciadorDominioDiagnostico.GetInstance().Atualizar(dominioDiagnostico);
                return RedirectToAction("Index");
            }
            return View(dominioDiagnostico);
        }

        //
        // GET: /DominioDiagnostico/Delete/5

        public ActionResult Delete(int id)
        {
            DominioDiagnosticoModel dominioDiagnostico = GerenciadorDominioDiagnostico.GetInstance().Obter(id);
            return View(dominioDiagnostico);
        }

        //
        // POST: /DominioDiagnostico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorDominioDiagnostico.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
