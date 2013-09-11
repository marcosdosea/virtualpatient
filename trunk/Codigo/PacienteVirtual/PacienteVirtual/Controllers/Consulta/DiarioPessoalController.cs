using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class DiarioPessoalController : Controller
    {
   
        private GerenciadorDiarioPessoal gDiarioPessoal = GerenciadorDiarioPessoal.GetInstance();

        //
        // GET: /DiarioPessoal/

        public ViewResult Index()
        {
            return View(gDiarioPessoal.Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

       
        //
        // POST: /DiarioPessoal/Create
        [HttpPost]
        public ActionResult Create(DiarioPessoalModel diarioPessoal)
        {
            if (ModelState.IsValid)
            {
                gDiarioPessoal.Inserir(diarioPessoal);
                List<DiarioPessoalModel> listaDiarioPessoal = new List<DiarioPessoalModel>(SessionController.ListaDiarioPessoal);
                listaDiarioPessoal.Add(diarioPessoal);
                SessionController.ListaDiarioPessoal = null;
                return RedirectToAction("Edit", "Consulta");
            }
            return PartialView(diarioPessoal);
        }

        //
        // POST: /DiarioPessoal/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaFixo, int idMedicamento)
        {
            gDiarioPessoal.Remover(idConsultaFixo, idMedicamento);
            SessionController.ListaDiarioPessoal = null;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}