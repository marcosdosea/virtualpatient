using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{ 
    public class AcaoQueixaController : Controller
    {
        //
        // GET: /AcaoQueixa/

        public ViewResult Index()
        {
            return View(GerenciadorAcaoQueixa.GetInstance().ObterTodos());
        }

        //
        // GET: /AcaoQueixa/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorAcaoQueixa.GetInstance().Obter(id));
        }

        //
        // GET: /AcaoQueixa/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /AcaoQueixa/Create

        [HttpPost]
        public ActionResult Create(AcaoQueixaModel acaoQueixa)
        {
            if (ModelState.IsValid)
            {
                GerenciadorAcaoQueixa.GetInstance().Inserir(acaoQueixa);
                return RedirectToAction("Index");
            }

            return View(acaoQueixa);
        }

        //
        // GET: /AcaoQueixa/Edit/5

        public ActionResult Edit(int id)
        {
            AcaoQueixaModel acaoQueixa = GerenciadorAcaoQueixa.GetInstance().Obter(id);
            return View(acaoQueixa);
        }

        //
        // POST: /AcaoQueixa/Edit/5

        [HttpPost]
        public ActionResult Edit(AcaoQueixaModel acaoQueixa)
        {
            if (ModelState.IsValid)
            {
                GerenciadorAcaoQueixa.GetInstance().Atualizar(acaoQueixa);
                return RedirectToAction("Index");
            }
            return View(acaoQueixa);
        }

        //
        // GET: /AcaoQueixa/Delete/5

        public ActionResult Delete(int id)
        {
            AcaoQueixaModel acaoQueixa = GerenciadorAcaoQueixa.GetInstance().Obter(id);
            return View(acaoQueixa);
        }

        //
        // POST: /AcaoQueixa/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorAcaoQueixa.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}