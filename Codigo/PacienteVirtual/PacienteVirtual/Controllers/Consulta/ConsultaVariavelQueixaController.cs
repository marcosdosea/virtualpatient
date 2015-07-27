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
        public ActionResult Create(ConsultaVariavelQueixaModel cvq)
        {
            if (cvq.IdSistema > Global.ValorInteiroNulo && cvq.IdQueixa > Global.ValorInteiroNulo)
            {
                cvq.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                cvq.IdObjetivoTerapeutico = 8;
                cvq.IdSituacaoQueixa = Global.ValorInicial;
                cvq.Tipo = Global.CharVazia;
                cvq.Desde = Global.stringVazia;
                cvq.Prioridade = Global.ValorInteiroNulo;
                GerenciadorConsultaVariavelQueixa.GetInstance().Inserir(cvq);
                SessionController.Sistema = Global.ValorInteiroNulo;
                SessionController.ListaConsultaVariavelQueixa = null;
            }
            else
            {
                SessionController.Sistema = cvq.IdSistema;
            }
            SessionController.Abas1 = Global.abaRevisaoSistema;
            return RedirectToAction("Edit", "Consulta");
        }

        //
        // POST: /ConsultaVariavelQueixa/Delete/5

        //[HttpPost, ActionName("Delete")]
        public ActionResult Delete(long idConsultaVariavel, int idQueixa)
        {
            GerenciadorConsultaVariavelQueixa.GetInstance().Remover(idConsultaVariavel, idQueixa);
            SessionController.ListaConsultaVariavelQueixa = null;
            SessionController.Abas1 = Global.abaRevisaoSistema;
            return RedirectToAction("Edit", "Consulta");
        }

        // GET: /ConsultaVariavelQueixa/Edit/5

        public ActionResult Edit(long idConsultaVariavel, int idQueixa)
        {
            ConsultaVariavelQueixaModel cvq = GerenciadorConsultaVariavelQueixa.GetInstance().ObterPorConcultaQueixa(idConsultaVariavel, idQueixa);
            ViewBag.IdObjetivoTerapeutico = new SelectList(GerenciadorObjetivoTerapeutico.GetInstance().ObterTodos(), "IdObjetivoTerapeutico", "DescricaoObjetivoTerapeutico");
            ViewBag.IdSituacaoQueixa = new SelectList(GerenciadorSituacaoQueixa.GetInstance().ObterTodos(), "IdSituacaoQueixa", "DescricaoSituacao");
            SessionController.Abas2 = Global.abaClassificacaoPRM;
            return View(cvq);
        }

        //
        // POST: /ConsultaVariavelQueixa/Edit/5

        [HttpPost]
        public ActionResult Edit(ConsultaVariavelQueixaModel cvq)
        {
            SessionController.Abas2 = Global.abaClassificacaoPRM;
            if (ModelState.IsValid)
            {
                GerenciadorConsultaVariavelQueixa.GetInstance().Atualizar(cvq);
                SessionController.ListaConsultaVariavelQueixa = null;
                return RedirectToAction("Edit2", "Consulta");
            }
            ViewBag.IdObjetivoTerapeutico = new SelectList(GerenciadorObjetivoTerapeutico.GetInstance().ObterTodos(), "IdObjetivoTerapeutico", "DescricaoObjetivoTerapeutico");
            ViewBag.IdSituacaoQueixa = new SelectList(GerenciadorSituacaoQueixa.GetInstance().ObterTodos(), "IdSituacaoQueixa", "DescricaoSituacao");
            return View(cvq);
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}