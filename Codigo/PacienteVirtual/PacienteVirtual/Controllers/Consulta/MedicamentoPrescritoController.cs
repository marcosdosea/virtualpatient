using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using System.Collections.Generic;

namespace PacienteVirtual.Controllers
{                 
    public class MedicamentoPrescritoController : Controller
    {
        
        private GerenciadorMedicamentoPrescrito gMedicamentoPrescrito = GerenciadorMedicamentoPrescrito.GetInstance();
        
        //
        // GET: /MedicamentoPrescrito/

        public ViewResult Index()
        {
            return View(gMedicamentoPrescrito.Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

        
        //
        // POST: /MedicamentoPrescrito/Create

        [HttpPost]
        public ActionResult Create(MedicamentoPrescritoModel medicamentoPrescrito)
        {
            if (ModelState.IsValid)
            {
                medicamentoPrescrito.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel; 
                gMedicamentoPrescrito.Inserir(medicamentoPrescrito);
                SessionController.ListaMedicamentosPrescritos = null;
            }
            SessionController.Abas2 = 3;
            return RedirectToAction("Edit", "Consulta");
        }

        //
        // POST: /MedicamentoPrescrito/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idMedicamento)
        {
            gMedicamentoPrescrito.Remover(idConsultaVariavel, idMedicamento);
            SessionController.ListaMedicamentosPrescritos = null;
            SessionController.Abas2 = 3;
            return RedirectToAction("Edit", "Consulta");
        }
      
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}