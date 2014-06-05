using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class PercepcaoExpectativasController : Controller
    {
        GerenciadorPercepcaoExpectativas gPercepcaoExpectativas = GerenciadorPercepcaoExpectativas.GetInstance();

        //
        // POST: /PercepcaoExpectativas/Edit/5
        [HttpPost]
        public ActionResult Edit(PercepcaoExpectativasModel percepcaoExpectativas)
        {
            if (ModelState.IsValid)
            {
                gPercepcaoExpectativas.Atualizar(percepcaoExpectativas);
                SessionController.PercepcaoExpectativas = percepcaoExpectativas;
            }
            //SessionController.Abas1 = Global.abaComunicacao;
            return RedirectToAction("Edit", "Consulta");
        }


    }
}
