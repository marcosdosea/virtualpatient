using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class DiagnosticoConsultaController : Controller
    {
        
        public ViewResult Index()
        {
            return View(GerenciadorDiagnosticoConsulta.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

        //
        // POST: /DiagnosticoConsulta/Create

        [HttpPost]
        public ActionResult Create(DiagnosticoConsultaModel diagnostico)
        {
            if (ModelState.IsValid)
            {
                diagnostico.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                GerenciadorDiagnosticoConsulta.GetInstance().Inserir(diagnostico);
                SessionController.ListaDiagnostico = null;
                SessionController.IdClasseDiagnostico = Global.ValorInteiroNulo;
                SessionController.IdDominioDiagnostico = Global.ValorInteiroNulo;
                SessionController.IdDiagnostico = Global.ValorInteiroNulo;
            }
            else
            {
                SessionController.IdDominioDiagnostico = diagnostico.IdDominioDiagnostico;
                SessionController.IdClasseDiagnostico = diagnostico.IdClasseDiagnostico;
                SessionController.IdDiagnostico = diagnostico.IdDiagnostico;
            }
            return RedirectToAction("Edit2", "Consulta");
        }


        public ActionResult SelecionarConsultaDiagnostico(long idConsultaVariavel, int idDiagnostico)
        {
            SessionController.IdDiagnosticoConsulta = idDiagnostico;
            SessionController.DiagnosticoConsulta = GerenciadorDiagnosticoConsulta.GetInstance().ObterPorConsultaDiagnostico(
                idConsultaVariavel, idDiagnostico);
            SessionController.ListaDiagnosticoConsultaCaracteristica = null;
            SessionController.ListaDiagnosticoConsultaFator = null;
            SessionController.ListaPrescricaoEnfermagem = null;
            if (SessionController.DiagnosticoConsulta.Risco == true)
            {
                SessionController.RiscoDiagnostico = true;
            }
            else
            {
                SessionController.RiscoDiagnostico = false;
            }
            return RedirectToAction("Edit2", "Consulta");
        }


        [HttpPost]
        public ActionResult ResultadosEsperados(DiagnosticoConsultaModel diagnosticoConsulta)
        {
            if (ModelState.IsValid)
            {
                GerenciadorDiagnosticoConsulta.GetInstance().Atualizar(diagnosticoConsulta);
                SessionController.DiagnosticoConsulta = diagnosticoConsulta;
                return RedirectToAction("Edit2", "Consulta");
            }
            return View(diagnosticoConsulta);
        }
 
        //
        // POST: /DiagnosticoConsulta/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idDiagnostico)
        {
            GerenciadorDiagnosticoConsulta.GetInstance().Remover(idConsultaVariavel, idDiagnostico);
            SessionController.ListaDiagnostico = null;
            return RedirectToAction("Edit2", "Consulta");
        }
 
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}