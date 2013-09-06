using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio.Consulta;
using PacienteVirtual.Models.Consulta;

namespace PacienteVirtual.Controllers.Consulta
{ 
    public class ExamesFisicosController : Controller
    {
       
        //
        // POST: /ExamesFisicos/Create

        [HttpPost]
        public ActionResult Edit(ExamesFisicosModel examesFisicosModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorExamesFisicos.GetInstance().Atualizar(examesFisicosModel);
                SessionController.ExamesFisicos = examesFisicosModel;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}