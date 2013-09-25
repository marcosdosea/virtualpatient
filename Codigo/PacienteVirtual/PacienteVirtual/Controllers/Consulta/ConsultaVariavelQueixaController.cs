using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class ConsultaVariavelQueixaController : Controller
    {
        //
        // GET: /MedicamentoPrescrito/

        public ViewResult Index()
        {
            return View(GerenciadorConsultaVariavelQueixa.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

        //
        // POST: /MedicamentoPrescrito/Create

        [HttpPost]
        public ActionResult Create(ConsultaVariavelQueixaModel consultaVariavelQueixa)
        {
            if (ModelState.IsValid)
            {
                consultaVariavelQueixa.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                GerenciadorConsultaVariavelQueixa.GetInstance().Inserir(consultaVariavelQueixa);
                SessionController.Sistema = 0;
                SessionController.ListaConsultaVariavelQueixa = null;
            }
            else
            {
                SessionController.Sistema = consultaVariavelQueixa.IdSistema;
            }
            return RedirectToAction("Edit2", "Consulta");
        }

        //
        // POST: /ConsultaVariavelQueixa/Delete/5

        //[HttpPost, ActionName("Delete")]
        public ActionResult Delete(long idConsultaVariavel, int idQueixa)
        {
            GerenciadorConsultaVariavelQueixa.GetInstance().Remover(idConsultaVariavel, idQueixa);
            SessionController.ListaConsultaVariavelQueixa = null;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}