using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class DiagnosticoConsultaFatorController : Controller
    {
        [HttpPost]
        public ActionResult Adicionar(DiagnosticoConsultaFatorModel diagnosticoCF)
        {
            if (ModelState.IsValid)
            {
                GerenciadorDiagnosticoConsultaFator.GetInstance().Inserir(diagnosticoCF);
                SessionController.ListaDiagnosticoConsultaFator = null;
            }
            return RedirectToAction("Edit2", "Consulta");
        }

        public ViewResult Index()
        {
            return View(GerenciadorDiagnosticoConsultaFator.GetInstance().ObterTodosPorDiagnosticoConsulta(
                SessionController.ConsultaVariavel.IdConsultaVariavel, SessionController.IdDiagnostico));
        }

        // Delete
        public ActionResult Delete(int idDiagnostico, int idDiagnosticoFator)
        {
            DiagnosticoConsultaFatorModel diagnosticoCF = new DiagnosticoConsultaFatorModel();
            diagnosticoCF.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
            diagnosticoCF.IdDiagnostico = idDiagnostico;
            diagnosticoCF.IdDiagnosticoFator = idDiagnosticoFator;
            GerenciadorDiagnosticoConsultaFator.GetInstance().Remover(diagnosticoCF);
            SessionController.ListaDiagnosticoConsultaFator = null;
            return RedirectToAction("Edit2", "Consulta");
        }
    }
}
