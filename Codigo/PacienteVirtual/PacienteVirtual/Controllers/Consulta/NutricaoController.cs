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
        private GerenciadorNutricao gNutricao = GerenciadorNutricao.GetInstance();

        [HttpPost]
        public ActionResult Edit(NutricaoModel nutricao)
        {
            if (ModelState.IsValid)
            {
                gNutricao.Atualizar(nutricao);
                SessionController.Nutricao = nutricao;
            }
            return RedirectToAction("Edit", "Consulta");
        }
    }
}