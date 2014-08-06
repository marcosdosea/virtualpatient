using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class QueixaController : Controller
    {
        GerenciadorQueixa gQueixa = GerenciadorQueixa.GetInstance();
        GerenciadorSistema gSistema = GerenciadorSistema.GetInstance();

        //
        // GET: /Queixa/
        public ViewResult Index()
        {
            return View(gQueixa.ObterTodos());
        }

        //
        // GET: /Queixa/Details/5
        public ViewResult Details(int id)
        {
            return View(gQueixa.Obter(id));
        }

        //
        // GET: /Queixa/Create

        public ActionResult Create()
        {
            ViewBag.IdSistema = new SelectList(gSistema.ObterTodos().ToList(), "IdSistema", "NomeSistema");
            return View();
        }

        //
        // POST: /Queixa/Create
        [HttpPost]
        public ActionResult Create(QueixaModel queixaModel)
        {
            if (ModelState.IsValid)
            {
                queixaModel.IdQueixa = gQueixa.Inserir(queixaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdSistema = new SelectList(gSistema.ObterTodos().ToList(), "IdSistema", "NomeSistema", queixaModel.IdSistema);
            return View(queixaModel);
        }

        //
        // GET: /Queixa/Edit/5
        public ActionResult Edit(int id)
        {
            QueixaModel queixaModel = gQueixa.Obter(id);
            ViewBag.IdSistema = new SelectList(gSistema.ObterTodos().ToList(), "IdSistema", "NomeSistema", queixaModel.IdSistema);
            return View(queixaModel);
        }

        //
        // POST: /Queixa/Edit/5

        [HttpPost]
        public ActionResult Edit(QueixaModel queixaModel)
        {
            if (ModelState.IsValid)
            {
                gQueixa.Atualizar(queixaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdSistema = new SelectList(gSistema.ObterTodos().ToList(), "IdSistema", "NomeSistema", queixaModel.IdSistema);
            return View(queixaModel);
        }

        //
        // GET: /Queixa/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gQueixa.Obter(id));
        }

        //
        // POST: /Queixa/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gQueixa.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}