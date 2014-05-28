using System.Data;
using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class IntegridadeTecidualController : Controller
    {
        GerenciadorIntegridadeTecidual gIntegridadeTecidual = GerenciadorIntegridadeTecidual.GetInstance();

        //
        // POST: /IntegridadeTecidual/Edit/5
        [HttpPost]
        public ActionResult Edit(IntegridadeTecidualModel IntegridadeTecidual)
        {
            if (ModelState.IsValid)
            {
                gIntegridadeTecidual.Atualizar(IntegridadeTecidual);
                SessionController.IntegridadeTecidual = IntegridadeTecidual;
            }
            SessionController.Abas1 = Global.abaIntegridadeTecidual;
            return RedirectToAction("Edit", "Consulta");
        }
    }
}