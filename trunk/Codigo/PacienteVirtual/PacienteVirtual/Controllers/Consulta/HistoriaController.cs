﻿using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class HistoriaController : Controller
    {
        private pvEntities db = new pvEntities();

        GerenciadorHistoria gHistoria = GerenciadorHistoria.GetInstance();
        GerenciadorConsultaFixo gConsultaFixo = GerenciadorConsultaFixo.GetInstance();

        //
        // POST: /Historica/Edit/5

        [HttpPost]
        public ActionResult Edit(HistoriaModel historiaModel)
        {
            if (ModelState.IsValid)
            {
                gHistoria.Atualizar(historiaModel);
                SessionController.Historia = historiaModel;
                
            }
            SessionController.Abas1 = 1;
            SessionController.Abas2 = 0;
            return RedirectToAction("Edit", "Consulta");
        }

    }
}