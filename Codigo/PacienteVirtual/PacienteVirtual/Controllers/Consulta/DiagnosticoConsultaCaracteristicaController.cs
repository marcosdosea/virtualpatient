using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class DiagnosticoConsultaCaracteristicaController : Controller
    {
        [HttpPost]
        public ActionResult Adicionar(DiagnosticoConsultaCaracteristicaModel diagnosticoCC)
        {
            if (ModelState.IsValid)
            {
                GerenciadorDiagnosticoConsultaCaracteristica.GetInstance().Inserir(diagnosticoCC);
                SessionController.ListaDiagnosticoConsultaCaracteristica = null;
            }
            return RedirectToAction("Edit2", "Consulta");
        }

        public ViewResult Index()
        {
            return View(GerenciadorDiagnosticoConsultaCaracteristica.GetInstance().ObterTodosPorDiagnosticoConsulta(
                SessionController.ConsultaVariavel.IdConsultaVariavel, SessionController.IdDiagnostico));
        }

        // Delete
        public ActionResult Delete(int idDiagnostico, int idDiagnosticoCaracteristica)
        {
            DiagnosticoConsultaCaracteristicaModel diagnosticoCC = new DiagnosticoConsultaCaracteristicaModel();
            diagnosticoCC.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
            diagnosticoCC.IdDiagnostico = idDiagnostico;
            diagnosticoCC.IdDiagnosticoCaracteristica = idDiagnosticoCaracteristica;
            GerenciadorDiagnosticoConsultaCaracteristica.GetInstance().Remover(diagnosticoCC);
            SessionController.ListaDiagnosticoConsultaCaracteristica = null;
            return RedirectToAction("Edit2", "Consulta");
        }
    }
}
