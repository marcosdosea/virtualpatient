using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class EstadoCivilController : Controller
    {
        //
        // GET: /EstadoCivil/

        public ViewResult Index()
        {
            return View(GerenciadorEstadoCivil.GetInstance().ObterTodos());
        }

        //
        // GET: /EstadoCivil/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorEstadoCivil.GetInstance().Obter(id));
        }

        //
        // GET: /EstadoCivil/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /EstadoCivil/Create

        [HttpPost]
        public ActionResult Create(EstadoCivilModel estadoCivilModel)
        {
            if (ModelState.IsValid)
            {
                estadoCivilModel.IdEstadoCivil = GerenciadorEstadoCivil.GetInstance().Inserir(estadoCivilModel);
                return RedirectToAction("Index");
            }
            return View(estadoCivilModel);
        }

        //
        // GET: /EstadoCivil/Edit/5

        public ActionResult Edit(int id)
        {
            EstadoCivilModel estadoCivilModel = GerenciadorEstadoCivil.GetInstance().Obter(id);
            return View(estadoCivilModel);
        }

        //
        // POST: /EstadoCivil/Edit/5

        [HttpPost]
        public ActionResult Edit(EstadoCivilModel estadoCivilModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorEstadoCivil.GetInstance().Atualizar(estadoCivilModel);
                return RedirectToAction("Index");
            }
            return View(estadoCivilModel);
        }

        //
        // GET: /EstadoCivil/Delete/5

        public ActionResult Delete(int id)
        {
            EstadoCivilModel estadoCivilModel = GerenciadorEstadoCivil.GetInstance().Obter(id);
            return View(estadoCivilModel);
        }

        //
        // POST: /EstadoCivil/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorEstadoCivil.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}