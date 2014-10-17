using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class DiagnosticoFatorController : Controller
    {
        GerenciadorDiagnosticoFator gDiagnosticoFator = GerenciadorDiagnosticoFator.GetInstance();
        GerenciadorDiagnostico gDiagnostico = GerenciadorDiagnostico.GetInstance();

        //
        // GET: /DiagnosticoFator/

        public ViewResult Index()
        {
            SessionController.IdDiagnostico = Global.ValorInteiroNulo;
            return View(gDiagnosticoFator.ObterTodos());
        }

        //
        // GET: /DiagnosticoFator/Details/5

        public ViewResult Details(int id)
        {
            return View(gDiagnosticoFator.Obter(id));
        }

        //
        // GET: /DiagnosticoFator/Create

        public ActionResult Create()
        {
            if (SessionController.IdDiagnostico != Global.ValorInteiroNulo)
            {
                ViewBag.IdDiagnostico = new SelectList(gDiagnostico.ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico", SessionController.IdDiagnostico);
            }
            else
            {

                ViewBag.IdDiagnostico = new SelectList(gDiagnostico.ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico");
            }
             return View();
        }

        //
        // POST: /DiagnosticoFator/Create

        [HttpPost]
        public ActionResult Create(DiagnosticoFatorModel diagnosticoFator)
        {
            if (ModelState.IsValid)
            {
                gDiagnosticoFator.Inserir(diagnosticoFator);
                SessionController.IdDiagnostico = diagnosticoFator.IdDiagnostico;
                return RedirectToAction("Index");
            }
            ViewBag.IdDiagnostico = new SelectList(gDiagnostico.ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico",
                diagnosticoFator.IdDiagnostico);
            return View(diagnosticoFator);
        }

        //
        // GET: /DiagnosticoFator/Edit/5

        public ActionResult Edit(int id)
        {
            DiagnosticoFatorModel diagnosticoFator = gDiagnosticoFator.Obter(id);
            ViewBag.IdDiagnostico = new SelectList(gDiagnostico.ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico",
                diagnosticoFator.IdDiagnostico);
            return View(diagnosticoFator);
        }

        //
        // POST: /DiagnosticoFator/Edit/5

        [HttpPost]
        public ActionResult Edit(DiagnosticoFatorModel diagnosticoFator)
        {
            if (ModelState.IsValid)
            {
                gDiagnosticoFator.Atualizar(diagnosticoFator);
                return RedirectToAction("Index");
            }
            ViewBag.IdDiagnostico = new SelectList(gDiagnostico.ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico",
                diagnosticoFator.IdDiagnostico);
            return View(diagnosticoFator);
        }

        //
        // GET: /DiagnosticoFator/Delete/5

        public ActionResult Delete(int id)
        {
            DiagnosticoFatorModel diagnosticoFator = gDiagnosticoFator.Obter(id);
            return View(diagnosticoFator);
        }

        //
        // POST: /DiagnosticoFator/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gDiagnosticoFator.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}