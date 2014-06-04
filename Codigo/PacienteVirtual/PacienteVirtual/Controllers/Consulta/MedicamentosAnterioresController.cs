using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class MedicamentosAnterioresController : Controller
    {

        private GerenciadorMedicamentosAnteriores gMedicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance();
        //
        // GET: /MedicamentosAnteriores/

        public ViewResult Index()
        {
            return View(gMedicamentosAnteriores.Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

        //
        // POST: /MedicamentosAnteriores/Create

        [HttpPost]
        public ActionResult Create(MedicamentosAnterioresModel medicamentosAnterioresModel)
        {
            if (ModelState.IsValid)
            {
                medicamentosAnterioresModel.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                gMedicamentosAnteriores.Inserir(medicamentosAnterioresModel);
                SessionController.ListaMedicamentosAnteriores = null;
            }
            else
            {
                GerenciadorMedicamentosAnteriores.GetInstance().ValidarRespostasSelecionaveis(medicamentosAnterioresModel.IdMedicamento);
            }
            SessionController.Abas1 = Global.abaMedAnte;
            return RedirectToAction("Edit", "Consulta");
        }

        // GET: /MedicamentosAnteriores/Edit/5

        public ActionResult Edit(long idConsultaVariavel, int idMedicamento)
        {
            MedicamentosAnterioresModel ma = GerenciadorMedicamentosAnteriores.GetInstance().ObterPorConsultaMedicamento(idConsultaVariavel, idMedicamento);
            SessionController.Abas1 = Global.abaMedAnte;
            return View(ma);
        }

        //
        // POST: /MedicamentosNaoPrescritos/Edit/5

        [HttpPost]
        public ActionResult Edit(MedicamentosAnterioresModel ma)
        {
            SessionController.Abas1 = Global.abaMedAnte;
            if (ModelState.IsValid)
            {
                GerenciadorMedicamentosAnteriores.GetInstance().Atualizar(ma);
                SessionController.ListaMedicamentosAnteriores = null;
                return RedirectToAction("Edit", "Consulta");
            }
            return View(ma);
        }

        //
        // POST: /MedicamentosAnteriores/Delete/5

        public ActionResult Delete(long idConsultaVariavel, int idMedicamento)
        {
            gMedicamentosAnteriores.Remover(idConsultaVariavel, idMedicamento);
            SessionController.ListaMedicamentosAnteriores = null;
            SessionController.Abas1 = Global.abaMedAnte;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}