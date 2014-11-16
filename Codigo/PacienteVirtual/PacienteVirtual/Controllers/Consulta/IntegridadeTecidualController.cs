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
            SessionController.Abas1 = Global.abaPsicobiologicas;
            SessionController.AbasDentro = Global.abaIntegridadeTecidual;
            if (ModelState.IsValid)
            {
                gIntegridadeTecidual.Atualizar(IntegridadeTecidual);
                SessionController.IntegridadeTecidual = IntegridadeTecidual;
            }
            return RedirectToAction("Edit", "Consulta");
        }
    }
}