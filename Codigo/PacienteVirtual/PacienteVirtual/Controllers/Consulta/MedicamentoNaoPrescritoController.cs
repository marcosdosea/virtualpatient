using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class MedicamentoNaoPrescritoController : Controller
    {
        
        private GerenciadorMedicamentoNaoPrescrito gMedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance();
        //
        // GET: /MedicamentoNaoPrescrito/

        public ViewResult Index()
        {
            return View(gMedicamentoNaoPrescrito.Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

        //
        // POST: /MedicamentoNaoPrescrito/Create

        [HttpPost]
        public ActionResult Create(MedicamentoNaoPrescritoModel medicamentoNaoPrescrito)
        {
            if (ModelState.IsValid)
            {

                medicamentoNaoPrescrito.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                gMedicamentoNaoPrescrito.Inserir(medicamentoNaoPrescrito);
                SessionController.ListaMedicamentoNaoPrescrito = null;
            }
            SessionController.Abas1 = 7;
            return RedirectToAction("Edit", "Consulta");
        }

        // GET: /MedicamentosNaoPrescritos/Edit/5

        public ActionResult Edit(long idConsultaVariavel, int idMedicamento)
        {
            MedicamentoNaoPrescritoModel mnp = GerenciadorMedicamentoNaoPrescrito.GetInstance().ObterPorConsultaMedicamento(idConsultaVariavel, idMedicamento);
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos(), "IdMedicamento", "Nome", idMedicamento);
            SessionController.Abas1 = 7;
            return View(mnp);
        }

        //
        // POST: /MedicamentosNaoPrescritos/Edit/5

        [HttpPost]
        public ActionResult Edit(MedicamentoNaoPrescritoModel mnp)
        {
            if (ModelState.IsValid)
            {
                GerenciadorMedicamentoNaoPrescrito.GetInstance().Atualizar(mnp);
                SessionController.ListaMedicamentoNaoPrescrito = null;
                SessionController.Abas1 = 7;
                return RedirectToAction("Edit", "Consulta");
            }
            SessionController.Abas1 = 7;
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos(), "IdMedicamento", "Nome", mnp.IdMedicamento);
            return View(mnp);
        }

        //
        // POST: /MedicamentoNaoPrescrito/Delete/5
        public ActionResult Delete(long idConsultaVariavel, int idMedicamento)
        {
            gMedicamentoNaoPrescrito.Remover(idConsultaVariavel, idMedicamento);
            SessionController.ListaMedicamentoNaoPrescrito = null;
            SessionController.Abas1 = 7;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}