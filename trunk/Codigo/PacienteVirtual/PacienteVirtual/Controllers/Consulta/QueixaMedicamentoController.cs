using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio.Consulta;
using PacienteVirtual.Models.Consulta;

namespace PacienteVirtual.Controllers
{
    public class QueixaMedicamentoController : Controller
    {

        public ViewResult Index()
        {
            return View(GerenciadorQueixaMedicamento.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }


        //
        // POST: /MedicamentoPrescrito/Create

        [HttpPost]
        public ActionResult Create(QueixaMedicamentoModel queixaMedicamento)
        {
            if (ModelState.IsValid && queixaMedicamento.IdQueixa > 0)
            {
                GerenciadorQueixaMedicamento.GetInstance().Inserir(queixaMedicamento);
                SessionController.ListaQueixaMedicamento = null;
            }
            return RedirectToAction("Edit2", "Consulta");
        }

        //
        // POST: /MedicamentoPrescrito/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idMedicamento, int idQueixa)
        {
            GerenciadorQueixaMedicamento.GetInstance().Remover(idConsultaVariavel, idMedicamento, idQueixa);
            SessionController.ListaQueixaMedicamento = null;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
