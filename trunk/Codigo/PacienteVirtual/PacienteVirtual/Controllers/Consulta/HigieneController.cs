using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class HigieneController : Controller
    {
        //
        // POST: /Higiene/Create

        [HttpPost]
        public ActionResult Edit(HigieneModel higieneModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorHigiene.GetInstance().Atualizar(higieneModel);
                SessionController.Higiene = higieneModel;
            }
            SessionController.Abas1 = Global.abaHigiene;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
