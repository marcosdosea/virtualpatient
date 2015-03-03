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
            if (GerenciadorParametroClinico.GetInstance().ValidarRespostasSelecionaveis(consultaParametroModel.IdParametroClinico))
            {
                consultaParametroModel.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                GerenciadorConsultaParametro.GetInstance().Inserir(consultaParametroModel);
                SessionController.ListaConsultaParametro = null;
            }
            SessionController.Abas1 = Global.abaConsultaParametro;
            return RedirectToAction("Edit", "Consulta");
        }

        // GET: /ConsultaVariavelQueixa/Edit/5

        public ActionResult Edit(long idConsultaVariavel, int idConsultaPar)
        {
            ConsultaParametroModel consultaParametro = GerenciadorConsultaParametro.GetInstance().ObterPorConsultaParametro(idConsultaVariavel, idConsultaPar);
            SessionController.Abas1 = Global.abaConsultaParametro;
            return View(consultaParametro);
        }

        //
        // POST: /ConsultaVariavelQueixa/Edit/5

        [HttpPost]
        public ActionResult Edit(ConsultaParametroModel cp)
        {
            SessionController.Abas1 = Global.abaConsultaParametro;
            if (ModelState.IsValid)
            {
                GerenciadorConsultaParametro.GetInstance().Atualizar(cp);
                SessionController.ListaConsultaParametro = null;
                return RedirectToAction("Edit", "Consulta");
            }
            return View(cp);
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