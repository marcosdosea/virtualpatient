using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class ConsultaVariavelController : Controller
    {
        [HttpPost]
        public ActionResult Edit(ConsultaVariavelModel consultaVariavelModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
                SessionController.ConsultaVariavel = consultaVariavelModel;
            }
            switch (consultaVariavelModel.AbaAuxiliar)
            {
                case 2:
                    SessionController.Abas1 = Global.abaRazaoEncontro;
                    return RedirectToAction("Edit", "Consulta");
                case 9:
                    SessionController.Abas1 = Global.abaDadosCompImportantes;
                    return RedirectToAction("Edit2", "Consulta");
                case 10:
                    SessionController.Abas1 = Global.abaOutrosAchados;
                    return RedirectToAction("Edit2", "Consulta");
                case 13:
                    SessionController.Abas1 = Global.abaRazaoEncontro;
                    return RedirectToAction("Edit3", "Consulta");
                default:
                    SessionController.Abas1 = Global.abaRazaoEncontro;
                    return RedirectToAction("Edit", "Consulta");
            }
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
