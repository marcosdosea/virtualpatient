﻿using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ExperienciaMedicamentosController : Controller
    {

        GerenciadorExperienciaMedicamentos gExpMedicamento = GerenciadorExperienciaMedicamentos.GetInstance();
        GerenciadorResposta gResposta = GerenciadorResposta.GetInstance();
        
        
        //
        // POST: /ExperienciaMedicamentos/Edit/5

        [HttpPost]
        public ActionResult Edit(ExperienciaMedicamentosModel expMedicamento)
        {
            if (ModelState.IsValid)
            {
                gExpMedicamento.Atualizar(expMedicamento);
            }
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}