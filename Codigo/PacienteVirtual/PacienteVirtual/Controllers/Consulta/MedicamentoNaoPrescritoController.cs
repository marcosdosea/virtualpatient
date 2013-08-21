using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class MedicamentoNaoPrescritoController : Controller
    {
        private pvEntities db = new pvEntities();

        private GerenciadorMedicamentoNaoPrescrito gMedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance();
        //
        // GET: /MedicamentoNaoPrescrito/

        public ViewResult Index()
        {
            return View(gMedicamentoNaoPrescrito.ObterTodos());
        }

        //
        // GET: /MedicamentoNaoPrescrito/Details/5

        public ViewResult Details(long id)
        {

            return View(gMedicamentoNaoPrescrito.Obter(id));
        }

        //
        // GET: /MedicamentoNaoPrescrito/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /MedicamentoNaoPrescrito/Create

        [HttpPost]
        public ActionResult Create(MedicamentoNaoPrescritoModel medicamentoNaoPrescrito)
        {
            if (ModelState.IsValid)
            {

                medicamentoNaoPrescrito.IdConsultaVariavel = gMedicamentoNaoPrescrito.Inserir(medicamentoNaoPrescrito);
                return RedirectToAction("Index");
            }

            return View(medicamentoNaoPrescrito);
        }

        //
        // GET: /MedicamentoNaoPrescrito/Edit/5

        public ActionResult Edit(long id)
        {
            return View(gMedicamentoNaoPrescrito.Obter(id));
        }

        //
        // POST: /MedicamentoNaoPrescrito/Edit/5

        [HttpPost]
        public ActionResult Edit(MedicamentoNaoPrescritoModel medicamentoNaoPrescrito)
        {
            if (ModelState.IsValid)
            {
                gMedicamentoNaoPrescrito.Atualizar(medicamentoNaoPrescrito);
                return RedirectToAction("Index");
            }
            return View(medicamentoNaoPrescrito);
        }

        //
        // GET: /MedicamentoNaoPrescrito/Delete/5

        public ActionResult Delete(long id)
        {
            return View(gMedicamentoNaoPrescrito.Obter(id));
        }

        //
        // POST: /MedicamentoNaoPrescrito/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gMedicamentoNaoPrescrito.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}