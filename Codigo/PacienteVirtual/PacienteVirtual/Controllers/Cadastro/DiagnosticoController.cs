using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class DiagnosticoController : Controller
    {
        GerenciadorDiagnostico gDiagnostico = GerenciadorDiagnostico.GetInstance();
        GerenciadorClasseDiagnostico gClasseDiagnostico = GerenciadorClasseDiagnostico.GetInstance();

        //
        // GET: /Intervencao/
        public ViewResult Index()
        {
            return View(gDiagnostico.ObterTodos());
        }

        //
        // GET: /Intervencao/Details/5
        public ViewResult Details(int id)
        {
            return View(gDiagnostico.Obter(id));
        }

        //
        // GET: /Intervencao/Create

        public ActionResult Create()
        {
            ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterTodos(), "IdClasseDiagnostico", "DescricaoClasseDiagnostico");
            return View();
        }

        //
        // POST: /Intervencao/Create
        [HttpPost]
        public ActionResult Create(DiagnosticoModel diagnosticoModel)
        {
            if (ModelState.IsValid)
            {
                gDiagnostico.Inserir(diagnosticoModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterTodos(), "IdClasseDiagnostico", "DescricaoClasseDiagnostico", 
                diagnosticoModel.IdClasseDiagnostico);
            return View(diagnosticoModel);
        }


        public ActionResult Edit(int id)
        {
            DiagnosticoModel diagnostico = gDiagnostico.Obter(id);
            ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterTodos(), "IdClasseDiagnostico", "DescricaoClasseDiagnostico", 
                diagnostico.IdClasseDiagnostico);
            return View(diagnostico);
        }


        [HttpPost]
        public ActionResult Edit(DiagnosticoModel diagnostico)
        {
            if (ModelState.IsValid)
            {
                gDiagnostico.Atualizar(diagnostico);
                return RedirectToAction("Index");
            }
            ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterTodos(), "IdClasseDiagnostico", "DescricaoClasseDiagnostico");
            return View(diagnostico);
        }

        //
        // GET: /Intervencao/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gDiagnostico.Obter(id));
        }

        //
        // POST: /Intervencao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gDiagnostico.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}