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
            SessionController.Abas2 = 3;
            return RedirectToAction("Edit2", "Consulta");
        }

        public ActionResult Edit(long idConsultaVariavel, int idCarta)
        {
            CartaModel carta = GerenciadorCarta.GetInstance().ObterPorIdConsultaEIdCarta(idConsultaVariavel, idCarta);
            ViewBag.IdEspecialidade = new SelectList(GerenciadorEspecialidade.GetInstance().ObterTodos(), "IdEspecialidade", "Especialidade");
            SessionController.Abas2 = 3;
            return View(carta);
        }

        // POST: /Escolaridade/Edit/5

        [HttpPost]
        public ActionResult Edit(CartaModel carta)
        {
            if (ModelState.IsValid)
            {
                GerenciadorCarta.GetInstance().Atualizar(carta);
                SessionController.ListaCarta = null;
                SessionController.Abas2 = 3;
                return RedirectToAction("Edit2", "Consulta");
            }
            SessionController.Abas2 = 3;
            return View(carta);
        }

        //
        // POST: /intervencaoConsulta/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idCarta)
        {
            GerenciadorCarta.GetInstance().Remover(idConsultaVariavel, idCarta);
            SessionController.ListaCarta = null;
            SessionController.Abas2 = 3;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}