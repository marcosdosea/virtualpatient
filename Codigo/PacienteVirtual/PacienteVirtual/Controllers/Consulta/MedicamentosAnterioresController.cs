using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class MedicamentosAnterioresController : Controller
    {
        private pvEntities db = new pvEntities();

        private GerenciadorMedicamentosAnteriores gMedicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance();
        //
        // GET: /MedicamentosAnteriores/

        public ViewResult Index()
        {
            return View(gMedicamentosAnteriores.ObterTodos());
        }

        //
        // GET: /MedicamentosAnteriores/Details/5

        public ViewResult Details(long id)
        {

            return View(gMedicamentosAnteriores.Obter(id));
        }

        //
        // GET: /MedicamentosAnteriores/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /MedicamentosAnteriores/Create

        [HttpPost]
        public ActionResult Create(MedicamentosAnterioresModel medicamentosAnterioresModel)
        {
            if (ModelState.IsValid)
            {

                medicamentosAnterioresModel.IdConsultaVariavel = gMedicamentosAnteriores.Inserir(medicamentosAnterioresModel);
                return RedirectToAction("Index");
            }

            return View(medicamentosAnterioresModel);
        }

        //
        // GET: /MedicamentosAnteriores/Edit/5

        public ActionResult Edit(long id)
        {
            return View(gMedicamentosAnteriores.Obter(id));
        }

        //
        // POST: /MedicamentosAnteriores/Edit/5

        [HttpPost]
        public ActionResult Edit(MedicamentosAnterioresModel medicamentosAnterioresModel)
        {
            if (ModelState.IsValid)
            {
                gMedicamentosAnteriores.Atualizar(medicamentosAnterioresModel);
                return RedirectToAction("Index");
            }
            return View(medicamentosAnterioresModel);
        }

        //
        // GET: /MedicamentosAnteriores/Delete/5

        public ActionResult Delete(long id)
        {
            return View(gMedicamentosAnteriores.Obter(id));
        }

        //
        // POST: /MedicamentosAnteriores/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gMedicamentosAnteriores.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}