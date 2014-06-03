﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class OutrasNecessidadesController : Controller
    {
        GerenciadorOutrasNecessidades gOutrasNecessidades = GerenciadorOutrasNecessidades.GetInstance();

        //
        // POST: /OutrasNecessidades/Edit/5
        [HttpPost]
        public ActionResult Edit(OutrasNecessidadesModel outrasNecessidades)
        {
            if (ModelState.IsValid)
            {
                gOutrasNecessidades.Atualizar(outrasNecessidades);
                SessionController.OutrasNecessidades = outrasNecessidades;
            }
            SessionController.Abas1 = Global.abaOutrasNecessidades;
            return RedirectToAction("Edit", "Consulta");
        }

    }
}