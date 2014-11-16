using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class SensorialController : Controller
    {
        GerenciadorSensorial gSensorial = GerenciadorSensorial.GetInstance();

        //
        // POST: /Sensorial/Edit/5
        [HttpPost]
        public ActionResult Edit(SensorialModel sensorial)
        {
            SessionController.Abas1 = Global.abaPsicobiologicas;
            SessionController.AbasDentro = Global.abaSensorial;
            if (ModelState.IsValid)
            {
                gSensorial.Atualizar(sensorial);
                SessionController.Sensorial = sensorial;
            }
            return RedirectToAction("Edit", "Consulta");
        }

    }
}
