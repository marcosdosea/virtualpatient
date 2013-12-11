using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class IntervencaoConsultaController : Controller
    {
        
        //
        // GET: /intervencaoConsulta/

        public ViewResult Index()
        {
            return View(GerenciadorIntervencaoConsulta.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }


        //
        // POST: /intervencaoConsulta/Create

        [HttpPost]
        public ActionResult Create(IntervencaoConsultaModel intervencaoConsulta)
        {
            if (ModelState.IsValid)
            {
                intervencaoConsulta.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                GerenciadorIntervencaoConsulta.GetInstance().Inserir(intervencaoConsulta);
                SessionController.ListaIntervencaoConsulta = null;
                SessionController.IdGrupoIntervencao = 0;
            }
            else
            {
                SessionController.IdGrupoIntervencao = intervencaoConsulta.IdGrupoIntervencao;
            }

            return RedirectToAction("Edit2", "Consulta");
        }

        //
        // POST: /intervencaoConsulta/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idIntervencao)
        {
            GerenciadorIntervencaoConsulta.GetInstance().Remover(idConsultaVariavel, idIntervencao);
            SessionController.ListaIntervencaoConsulta = null;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
