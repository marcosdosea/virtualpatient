using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers.Consulta
{ 
    public class NutricaoController : Controller
    {
        //
        // POST: /Higiene/Create

        [HttpPost]
        public ActionResult Edit(NutricaoModel nutricaoModel)
        {
            SessionController.Abas1 = Global.abaPsicobiologicas;
            SessionController.AbasDentro = Global.abaNutricao;
            GerenciadorNutricao.GetInstance().Atualizar(nutricaoModel);
            SessionController.Nutricao = nutricaoModel;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}