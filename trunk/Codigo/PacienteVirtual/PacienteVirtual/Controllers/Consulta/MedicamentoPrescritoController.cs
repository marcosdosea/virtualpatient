using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class MedicamentoPrescritoController : Controller
    {
        private pvEntities db = new pvEntities();

        private GerenciadorMedicamentoPrescrito gMedicamentoPrescrito = GerenciadorMedicamentoPrescrito.GetInstance();
        //
        // GET: /MedicamentoPrescrito/

        public ViewResult Index()
        {
            return View(gMedicamentoPrescrito.ObterTodos());
        }

        //
        // GET: /MedicamentoPrescrito/Details/5

        public ViewResult Details(long id)
        {

            return View(gMedicamentoPrescrito.Obter(id));
        }

        //
        // GET: /MedicamentoPrescrito/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /MedicamentoPrescrito/Create

        [HttpPost]
        public ActionResult Create(MedicamentoPrescritoModel medicamentoPrescrito)
        {
            if (ModelState.IsValid)
            {

                medicamentoPrescrito.IdConsultaVariavel = gMedicamentoPrescrito.Inserir(medicamentoPrescrito);
                return RedirectToAction("Index");
            }

            return View(medicamentoPrescrito);
        }

        //
        // GET: /MedicamentoPrescrito/Edit/5

        public ActionResult Edit(long id)
        {
            return View(gMedicamentoPrescrito.Obter(id));
        }

        //
        // POST: /MedicamentoPrescrito/Edit/5

        [HttpPost]
        public ActionResult Edit(MedicamentoPrescritoModel medicamentoPrescrito)
        {
            if (ModelState.IsValid)
            {
                gMedicamentoPrescrito.Atualizar(medicamentoPrescrito);
                return RedirectToAction("Index");
            }
            return View(medicamentoPrescrito);
        }

        //
        // GET: /MedicamentoPrescrito/Delete/5

        public ActionResult Delete(long id)
        {
            return View(gMedicamentoPrescrito.Obter(id));
        }

        //
        // POST: /MedicamentoPrescrito/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gMedicamentoPrescrito.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}