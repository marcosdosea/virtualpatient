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

        /*
        // POST: /DiagnosticoConsulta/Edit
        public ActionResult Edit(long idConsultaVariavel, int idDiagnostico)
        {
            DiagnosticoConsultaModel diagnostico = GerenciadorDiagnosticoConsulta.GetInstance().ObterPorConsultaDiagnostico(idConsultaVariavel, idDiagnostico);
            DiagnosticoModel diagnoConsulta = GerenciadorDiagnostico.GetInstance().Obter(idDiagnostico);
            if (diagnoConsulta.Risco == true)
            {
                //Session Controller para o risco do diagnostico, guardando se é de risco ou não.
                SessionController.RiscoDiagnostico = true;
            }
            else
            {
                SessionController.RiscoDiagnostico = false;
            }
            return View(diagnostico);
        }

        // POST: /DiagnosticoConsulta/Edit/5

        [HttpPost]
        public ActionResult Edit(DiagnosticoConsultaModel diagnostico)
        {
            if (ModelState.IsValid)
            {
                GerenciadorDiagnosticoConsulta.GetInstance().Atualizar(diagnostico);
                SessionController.ListaDiagnostico = null;
                SessionController.RiscoDiagnostico = false;
                SessionController.DiagnosticoDetalhes = true;
                return RedirectToAction("Edit2", "Consulta");
            }
            SessionController.DiagnosticoDetalhes = true;
            return View(diagnostico);
        }
        */
 
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