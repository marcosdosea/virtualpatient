using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class EstiloVidaController : Controller
    {
        
        //
        // POST: /EstiloVida/Edit/5

        [HttpPost]
        public ActionResult Edit(EstiloVidaModel estiloVidaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorEstiloVida.GetInstance().Atualizar(estiloVidaModel);
                SessionController.EstiloVida = estiloVidaModel;
            }
            SessionController.Abas1 = 4;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}