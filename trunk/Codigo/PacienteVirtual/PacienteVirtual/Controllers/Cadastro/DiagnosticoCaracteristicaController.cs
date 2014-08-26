using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class DiagnosticoCaracteristicaController : Controller
    {
        GerenciadorDiagnosticoCaracteristica gDiagnosticoCaracteristica = GerenciadorDiagnosticoCaracteristica.GetInstance();
        GerenciadorDiagnostico gDiagnostico = GerenciadorDiagnostico.GetInstance();

        //
        // GET: /DiagnosticoCaracteristica/

        public ViewResult Index()
        {
            return View(gDiagnosticoCaracteristica.ObterTodos());
        }

        //
        // GET: /DiagnosticoCaracteristica/Details/5

        public ViewResult Details(int id)
        {
            return View(gDiagnosticoCaracteristica.Obter(id));
        }

        //
        // GET: /DiagnosticoCaracteristica/Create

        public ActionResult Create()
        {
            ViewBag.IdDiagnostico = new SelectList(gDiagnostico.ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico");
            return View();
        }

        //
        // POST: /DiagnosticoCaracteristica/Create

        [HttpPost]
        public ActionResult Create(DiagnosticoCaracteristicaModel diagnosticoCaracteristica)
        {
            if (ModelState.IsValid)
            {
                gDiagnosticoCaracteristica.Inserir(diagnosticoCaracteristica);
                return RedirectToAction("Index");
            }
            ViewBag.IdDiagnostico = new SelectList(gDiagnostico.ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico",
                diagnosticoCaracteristica.IdDiagnostico);
            return View(diagnosticoCaracteristica);
        }

        //
        // GET: /DiagnosticoCaracteristica/Edit/5

        public ActionResult Edit(int id)
        {
            DiagnosticoCaracteristicaModel diagnosticoCaracteristica = gDiagnosticoCaracteristica.Obter(id);
            ViewBag.IdDiagnostico = new SelectList(gDiagnostico.ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico",
                diagnosticoCaracteristica.IdDiagnostico);
            return View(diagnosticoCaracteristica);
        }

        //
        // POST: /DiagnosticoCaracteristica/Edit/5

        [HttpPost]
        public ActionResult Edit(DiagnosticoCaracteristicaModel diagnosticoCaracteristica)
        {
            if (ModelState.IsValid)
            {
                gDiagnosticoCaracteristica.Atualizar(diagnosticoCaracteristica);
                return RedirectToAction("Index");
            }
            ViewBag.IdDiagnostico = new SelectList(gDiagnostico.ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico",
                diagnosticoCaracteristica.IdDiagnostico);
            return View(diagnosticoCaracteristica);
        }

        //
        // GET: /DiagnosticoCaracteristica/Delete/5

        public ActionResult Delete(int id)
        {
            DiagnosticoCaracteristicaModel diagnosticoCaracteristica = gDiagnosticoCaracteristica.Obter(id);
            return View(diagnosticoCaracteristica);
        }

        //
        // POST: /DiagnosticoCaracteristica/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gDiagnosticoCaracteristica.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}