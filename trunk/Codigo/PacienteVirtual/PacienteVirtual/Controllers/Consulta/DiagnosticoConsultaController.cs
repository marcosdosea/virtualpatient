using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class DiagnosticoConsultaController : Controller
    {

        private GerenciadorDiagnostico gDiagnostico = GerenciadorDiagnostico.GetInstance();

        //
        // POST: /DiagnosticoConsulta/Create

        [HttpPost]
        public ActionResult Create(DiagnosticoConsultaModel diagnostico)
        {
            if (ModelState.IsValid && gDiagnostico.VerificaSeClassePerteceADominio(diagnostico.IdDominioDiagnostico,
                diagnostico.IdClasseDiagnostico) && gDiagnostico.VerificaSeDiagnosticoPerteceAClasse(diagnostico.IdClasseDiagnostico,
                diagnostico.IdDiagnostico))
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


        public ActionResult SelecionarConsultaDiagnostico(long idConsultaVariavel, int idDiagnostico, int idDominio, int idClasse)
        {
            GerenciadorDiagnosticoConsulta.GetInstance().AtualizaConsultaDiagnosticoSelecionada(idConsultaVariavel, idDiagnostico, 
                idDominio, idClasse);
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