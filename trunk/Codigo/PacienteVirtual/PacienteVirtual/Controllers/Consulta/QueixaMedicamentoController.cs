using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class QueixaMedicamentoController : Controller
    {

        public ViewResult Index()
        {
            return View(GerenciadorQueixaMedicamento.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }


        //
        // POST: /MedicamentoPrescrito/Create

        [HttpPost]
        public ActionResult Create(QueixaMedicamentoModel queixaMedicamento)
        {
            if (ModelState.IsValid)
            {
                GerenciadorQueixaMedicamento.GetInstance().Inserir(queixaMedicamento);
                SessionController.ListaQueixaMedicamento = null;
            }
            SessionController.Abas2 = 1;
            return RedirectToAction("Edit2", "Consulta");
        }

        public ActionResult Edit(long idConsultaVariavel, int idMedicamento, int idQueixa)
        {
            QueixaMedicamentoModel qmm = GerenciadorQueixaMedicamento.GetInstance().ObterPorConsultaQueixaMedicamento(idConsultaVariavel, idMedicamento, idQueixa);
            SessionController.Abas2 = 1;
            ViewBag.IdSuspeitaPrm = new SelectList(GerenciadorSuspeitaPrm.GetInstance().ObterTodos(), "IdSuspeitaPrm", "Descricao", qmm.IdSuspeitaPRM);
            ViewBag.IdAcaoQueixa1 = new SelectList(GerenciadorAcaoQueixa.GetInstance().ObterTodos(), "IdAcaoQueixa", "DescricaoAcao", qmm.IdAcaoQueixa1);
            ViewBag.IdAcaoQueixa2 = new SelectList(GerenciadorAcaoQueixa.GetInstance().ObterTodos(), "IdAcaoQueixa", "DescricaoAcao", qmm.IdAcaoQueixa2);
            return View(qmm);
        }

        //
        // POST: /QueixaMedicamento/Edit/5

        [HttpPost]
        public ActionResult Edit(QueixaMedicamentoModel qmm)
        {
            SessionController.Abas2 = 1;
            if (ModelState.IsValid)
            {
                GerenciadorQueixaMedicamento.GetInstance().Atualizar(qmm);
                SessionController.ListaQueixaMedicamento = null;
                return RedirectToAction("Edit2", "Consulta");
            }
            ViewBag.IdSuspeitaPrm = new SelectList(GerenciadorSuspeitaPrm.GetInstance().ObterTodos(), "IdSuspeitaPrm", "Descricao", qmm.IdSuspeitaPRM);
            ViewBag.IdAcaoQueixa1 = new SelectList(GerenciadorAcaoQueixa.GetInstance().ObterTodos(), "IdAcaoQueixa", "DescricaoAcao", qmm.IdAcaoQueixa1);
            ViewBag.IdAcaoQueixa2 = new SelectList(GerenciadorAcaoQueixa.GetInstance().ObterTodos(), "IdAcaoQueixa", "DescricaoAcao", qmm.IdAcaoQueixa2);
            return View(qmm);
        }

        //
        // POST: /MedicamentoPrescrito/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idMedicamento, int idQueixa)
        {
            GerenciadorQueixaMedicamento.GetInstance().Remover(idConsultaVariavel, idMedicamento, idQueixa);
            SessionController.ListaQueixaMedicamento = null;
            SessionController.Abas2 = 1;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
