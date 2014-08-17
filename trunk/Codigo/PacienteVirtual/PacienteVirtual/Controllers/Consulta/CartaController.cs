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
            carta.Referências = GerenciadorSeguranca.GetInstance().ReplaceCaracteresMaiorMenor(carta.Referências);
            if (ModelState.IsValid)
            {
                carta.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                GerenciadorCarta.GetInstance().Inserir(carta);
                SessionController.ListaCarta = null;
            }
            else
            {
                GerenciadorCarta.GetInstance().ValidarRespostasSelecionaveis(carta.IdEspecialidade);
            }
            SessionController.Abas2 = Global.abaCarta;
            return RedirectToAction("Edit2", "Consulta");
        }

        // POST: /Carta/Edit
        public ActionResult Edit(long idConsultaVariavel, int idCarta)
        {
            CartaModel carta = GerenciadorCarta.GetInstance().ObterPorIdConsultaEIdCarta(idConsultaVariavel, idCarta);
            ViewBag.IdEspecialidade = new SelectList(GerenciadorEspecialidade.GetInstance().ObterTodos(), "IdEspecialidade", "Especialidade");
            SessionController.Abas2 = Global.abaCarta;
            return View(carta);
        }

        // POST: /Carta/Edit/5

        [HttpPost]
        public ActionResult Edit(CartaModel carta)
        {
            SessionController.Abas2 = Global.abaCarta;
            if (ModelState.IsValid)
            {
                GerenciadorCarta.GetInstance().Atualizar(carta);
                SessionController.ListaCarta = null;
                return RedirectToAction("Edit2", "Consulta");
            }
            return View(carta);
        }

        //
        // POST: /Carta/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idCarta)
        {
            GerenciadorCarta.GetInstance().Remover(idConsultaVariavel, idCarta);
            SessionController.ListaCarta = null;
            SessionController.Abas2 = Global.abaCarta;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}