using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ClasseDiagnosticoController : Controller
    {

        GerenciadorDominioDiagnostico gDominioDiagnostico = GerenciadorDominioDiagnostico.GetInstance();
        GerenciadorClasseDiagnostico gClasseDiagnostico = GerenciadorClasseDiagnostico.GetInstance();

        //
        // GET: /ClasseDiagnostico/

        public ViewResult Index()
        {
            return View(gClasseDiagnostico.ObterTodos());
        }

        //
        // GET: /ClasseDiagnostico/Details/5

        public ViewResult Details(int id)
        {
            return View(gClasseDiagnostico.Obter(id));
        }

        //
        // GET: /ClasseDiagnostico/Create

        public ActionResult Create()
        {
            ViewBag.IdDominioDiagnostico = new SelectList(gDominioDiagnostico.ObterTodos(), "IdDominioDiagnostico", "DescricaoDominioDiagnostico");
            return View();
        }

        //
        // POST: /ClasseDiagnostico/Create

        [HttpPost]
        public ActionResult Create(ClasseDiagnosticoModel classeDiagnostico)
        {
            if (ModelState.IsValid)
            {
                gClasseDiagnostico.Inserir(classeDiagnostico);
                return RedirectToAction("Index");
            }
            ViewBag.IdDominioDiagnostico = new SelectList(gDominioDiagnostico.ObterTodos(), "IdDominioDiagnostico", "DescricaoDominioDiagnostico", 
                classeDiagnostico.IdDominioDiagnostico);
            return View(classeDiagnostico);
        }

        //
        // GET: /ClasseDiagnostico/Edit/5

        public ActionResult Edit(int id)
        {
            ClasseDiagnosticoModel classeDiagnostico = gClasseDiagnostico.Obter(id);
            ViewBag.IdDominioDiagnostico = new SelectList(gDominioDiagnostico.ObterTodos(), "IdDominioDiagnostico", "DescricaoDominioDiagnostico",
                classeDiagnostico.IdDominioDiagnostico);
            return View(classeDiagnostico);
        }

        //
        // POST: /ClasseDiagnostico/Edit/5

        [HttpPost]
        public ActionResult Edit(ClasseDiagnosticoModel classeDiagnostico)
        {
            if (ModelState.IsValid)
            {
                gClasseDiagnostico.Atualizar(classeDiagnostico);
                return RedirectToAction("Index");
            }
            ViewBag.IdDominioDiagnostico = new SelectList(gDominioDiagnostico.ObterTodos(), "IdDominioDiagnostico", "DescricaoDominioDiagnostico",
                classeDiagnostico.IdDominioDiagnostico);
            return View(classeDiagnostico);
        }

        //
        // GET: /ClasseDiagnostico/Delete/5

        public ActionResult Delete(int id)
        {
            ClasseDiagnosticoModel classeDiagnostico = gClasseDiagnostico.Obter(id);
            return View(classeDiagnostico);
        }

        //
        // POST: /ClasseDiagnostico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gClasseDiagnostico.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}