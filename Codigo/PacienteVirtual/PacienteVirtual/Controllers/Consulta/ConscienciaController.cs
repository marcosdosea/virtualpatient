using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class ConscienciaController : Controller
    {
        GerenciadorConsciencia gConsciencia = GerenciadorConsciencia.GetInstance();

        //
        // POST: /Consciencia/Edit/5
        [HttpPost]
        public ActionResult Edit(ConscienciaModel consciencia)
        {
            if (ModelState.IsValid)
            {
                gConsciencia.Atualizar(consciencia);
                SessionController.Consciencia = consciencia;
            }
            return RedirectToAction("Edit", "Consulta");
        }

    }
}
