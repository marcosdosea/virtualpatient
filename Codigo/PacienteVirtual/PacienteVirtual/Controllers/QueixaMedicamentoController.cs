﻿using System;
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
            if (ModelState.IsValid)
            {
                GerenciadorQueixaMedicamento.GetInstance().Inserir(queixaMedicamento);
                SessionController.ListaMedicamentosPrescritos = null;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        //
        // POST: /MedicamentoPrescrito/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idMedicamento)
        {
            //gMedicamentoPrescrito.Remover(idConsultaVariavel, idMedicamento);
            SessionController.ListaMedicamentosPrescritos = null;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}