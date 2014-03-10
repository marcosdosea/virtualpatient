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
                SessionController.IdGrupoIntervencao = Global.ValorInteiroNulo;
            }
            else
            {
                SessionController.IdGrupoIntervencao = intervencaoConsulta.IdGrupoIntervencao;
            }
            SessionController.Abas2 = Global.abaIntervencao;
            return RedirectToAction("Edit2", "Consulta");
        }


        public ActionResult Edit(long idConsultaVariavel, int idIntervencao)
        {
            IntervencaoConsultaModel icm = GerenciadorIntervencaoConsulta.GetInstance().ObterPorConsultaIntervencao(idConsultaVariavel, idIntervencao);
            SessionController.Abas2 = Global.abaIntervencao;
            return View(icm);
        }

        //
        // POST: /IntervencaoConsulta/Edit/5

        [HttpPost]
        public ActionResult Edit(IntervencaoConsultaModel icm)
        {
            SessionController.Abas2 = Global.abaIntervencao;
            if (ModelState.IsValid)
            {
                GerenciadorIntervencaoConsulta.GetInstance().Atualizar(icm);
                SessionController.ListaIntervencaoConsulta = null;
                return RedirectToAction("Edit2", "Consulta");
            }
            return View(icm);
        }

        //
        // POST: /intervencaoConsulta/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idIntervencao)
        {
            GerenciadorIntervencaoConsulta.GetInstance().Remover(idConsultaVariavel, idIntervencao);
            SessionController.ListaIntervencaoConsulta = null;
            SessionController.Abas2 = Global.abaIntervencao;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
