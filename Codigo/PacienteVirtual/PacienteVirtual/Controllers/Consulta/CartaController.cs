using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class CartaController : Controller
    {
        //
        // GET: /intervencaoConsulta/

        public ViewResult Index()
        {
            return View(GerenciadorCarta.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }


        //
        // POST: /intervencaoConsulta/Create

        [HttpPost]
        public ActionResult Create(CartaModel carta)
        {
            if (ModelState.IsValid)
            {
                carta.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                GerenciadorCarta.GetInstance().Inserir(carta);
                SessionController.ListaCarta = null;
            }
            SessionController.Abas2 = 2;
            return RedirectToAction("Edit2", "Consulta");
        }

        //
        // POST: /intervencaoConsulta/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idCarta)
        {
            GerenciadorCarta.GetInstance().Remover(idConsultaVariavel, idCarta);
            SessionController.ListaCarta = null;
            SessionController.Abas2 = 2;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}