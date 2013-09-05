﻿using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class MedicamentoNaoPrescritoController : Controller
    {
        
        private GerenciadorMedicamentoNaoPrescrito gMedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance();
        //
        // GET: /MedicamentoNaoPrescrito/

        public ViewResult Index()
        {
            return View(gMedicamentoNaoPrescrito.Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

        //
        // POST: /MedicamentoNaoPrescrito/Create

        [HttpPost]
        public ActionResult Create(MedicamentoNaoPrescritoModel medicamentoNaoPrescrito)
        {
            if (ModelState.IsValid)
            {

                medicamentoNaoPrescrito.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                gMedicamentoNaoPrescrito.Inserir(medicamentoNaoPrescrito);
                SessionController.ListaMedicamentoNaoPrescrito = null;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        //
        // POST: /MedicamentoNaoPrescrito/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gMedicamentoNaoPrescrito.Remover(id);
            SessionController.ListaMedicamentoNaoPrescrito = null;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}