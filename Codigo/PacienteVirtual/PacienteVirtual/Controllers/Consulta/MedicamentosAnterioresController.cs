using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class MedicamentosAnterioresController : Controller
    {

        private GerenciadorMedicamentosAnteriores gMedicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance();
        //
        // GET: /MedicamentosAnteriores/

        public ViewResult Index()
        {
            return View(gMedicamentosAnteriores.Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

        //
        // POST: /MedicamentosAnteriores/Create

        [HttpPost]
        public ActionResult Create(MedicamentosAnterioresModel medicamentosAnterioresModel)
        {
            if (ModelState.IsValid)
            {

                medicamentosAnterioresModel.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                gMedicamentosAnteriores.Inserir(medicamentosAnterioresModel);
                SessionController.ListaMedicamentosAnteriores = null;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        //
        // POST: /MedicamentosAnteriores/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gMedicamentosAnteriores.Remover(id);
            SessionController.ListaMedicamentosAnteriores = null;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}