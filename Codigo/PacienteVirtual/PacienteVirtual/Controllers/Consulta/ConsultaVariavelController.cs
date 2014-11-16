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
            switch (consultaVariavelModel.AbaAuxiliar)
            {
                case 2:
                    SessionController.Abas1 = Global.abaRazaoEncontro;
                    break;
                case 9:
                    SessionController.Abas1 = Global.abaDadosCompImportantes;
                    break;
                case 10:
                    SessionController.Abas1 = Global.abaOutrosAchados;
                    break;
                default:
                    SessionController.Abas1 = Global.abaRazaoEncontro;
                    break;
            }
            if (ModelState.IsValid)
            {
                GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
                SessionController.ConsultaVariavel = consultaVariavelModel;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
