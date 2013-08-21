using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class AlergiaController : Controller
    {
        //
        // GET: /Alergia/

        public ViewResult Index()
        {
            return View(GerenciadorAlergia.GetInstance().ObterTodos());
        }

        //
        // GET: /Alergia/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorAlergia.GetInstance().Obter(id));
        }

        //
        // GET: /Alergia/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Alergia/Create

        [HttpPost]
        public ActionResult Create(AlergiaModel alergiaModel)
        {
            if (ModelState.IsValid)
            {
                alergiaModel.IdAlergia = GerenciadorAlergia.GetInstance().Inserir(alergiaModel);
                return RedirectToAction("Index");
            }

            return View(alergiaModel);
        }

        //
        // GET: /Alergia/Edit/5

        public ActionResult Edit(int id)
        {
            AlergiaModel alergiaModel = GerenciadorAlergia.GetInstance().Obter(id);
            return View(alergiaModel);
        }

        //
        // POST: /Alergia/Edit/5

        [HttpPost]
        public ActionResult Edit(AlergiaModel alergiaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorAlergia.GetInstance().Atualizar(alergiaModel);
                return RedirectToAction("Index");
            }
            return View(alergiaModel);
        }

        //
        // GET: /Alergia/Delete/5

        public ActionResult Delete(int id)
        {
            AlergiaModel alergiaModel = GerenciadorAlergia.GetInstance().Obter(id);
            return View(alergiaModel);
        }

        //
        // POST: /Alergia/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorAlergia.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}