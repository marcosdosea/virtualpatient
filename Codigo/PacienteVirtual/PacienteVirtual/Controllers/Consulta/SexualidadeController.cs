using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class SexualidadeController : Controller
    {
        GerenciadorSexualidade gSexualidade = GerenciadorSexualidade.GetInstance();

        //
        // POST: /Sexualidade/Edit/5
        [HttpPost]
        public ActionResult Edit(SexualidadeModel sexualidade)
        {
            if (ModelState.IsValid)
            {
                gSexualidade.Atualizar(sexualidade);
                SessionController.Sexualidade = sexualidade;
            }
            return RedirectToAction("Edit", "Consulta");
        }

    }
}
