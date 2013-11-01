using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers.Consulta
{
    public class ConsultaVariavelController : Controller
    {
        [HttpPost]
        public ActionResult Edit(ConsultaVariavelModel consultaVariavelModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
                SessionController.ConsultaVariavel = consultaVariavelModel;
            }
            SessionController.Abas2 = 7;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
