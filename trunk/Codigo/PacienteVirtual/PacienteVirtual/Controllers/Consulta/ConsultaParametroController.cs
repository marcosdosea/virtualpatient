using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ConsultaParametroController : Controller
    {
        //
        // GET: /ConsultaParametro/

        public ViewResult Index()
        {
            return View(GerenciadorConsultaParametro.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }


        //
        // POST: /ConsultaParametro/Create

        [HttpPost]
        public ActionResult Create(ConsultaParametroModel consultaParametroModel)
        {
            if (ModelState.IsValid)
            {
                consultaParametroModel.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                GerenciadorConsultaParametro.GetInstance().Inserir(consultaParametroModel);
                SessionController.ListaConsultaParametro = null;
            }
            SessionController.Abas1 = Global.abaConsultaParametro;
            return RedirectToAction("Edit", "Consulta");
        }

        //
        // POST: /MedicamentoPrescrito/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idParametroClinico)
        {
            GerenciadorConsultaParametro.GetInstance().Remover(idConsultaVariavel, idParametroClinico);
            SessionController.ListaConsultaParametro = null;
            SessionController.Abas1 = Global.abaConsultaParametro;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}