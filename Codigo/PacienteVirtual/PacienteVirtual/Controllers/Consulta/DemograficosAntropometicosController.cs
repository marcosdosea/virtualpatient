using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class DemograficosAntropometicosController : Controller
    {
        private pvEntities db = new pvEntities();

        GerenciadorDemograficosAntropometricos gDemoAntrop = GerenciadorDemograficosAntropometricos.GetInstance();
        
        //
        // POST: /DemograficosAntropomedicos/Edit/5

        [HttpPost]
        public ActionResult Edit(DemograficosAntropometricosModel demoAntro)
        {
            if (ModelState.IsValid)
            {
                gDemoAntrop.Atualizar(demoAntro);
                SessionController.DemograficosAntropometricos = demoAntro;
            }
            SessionController.Abas1 = Global.abaDemoAntrop;
            return RedirectToAction("Edit", "Consulta");
        }

        
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}