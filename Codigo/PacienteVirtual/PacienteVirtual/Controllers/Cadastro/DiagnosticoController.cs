using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class DiagnosticoController : Controller
    {
        GerenciadorDiagnostico gDiagnostico = GerenciadorDiagnostico.GetInstance();
        GerenciadorClasseDiagnostico gClasseDiagnostico = GerenciadorClasseDiagnostico.GetInstance();
        GerenciadorDominioDiagnostico gDominioDiagnostico = GerenciadorDominioDiagnostico.GetInstance();

        //
        // GET: /Diagnostico/
        public ViewResult Index()
        {
            return View(gDiagnostico.ObterTodos());
        }

        //
        // GET: /Diagnostico/Details/5
        public ViewResult Details(int id)
        {
            return View(gDiagnostico.Obter(id));
        }

        //
        // GET: /Diagnostico/Create

        public ActionResult Create()
        {
            ViewBag.IdDominioDiagnostico = new SelectList(gDominioDiagnostico.ObterTodos(), "IdDominioDiagnostico", "DescricaoDominioDiagnostico");
            ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterPorDominio(Global.ValorInteiroNulo), "IdClasseDiagnostico",
                "DescricaoClasseDiagnostico");
            return View();
        }

        //
        // POST: /Diagnostico/Create
        [HttpPost]
        public ActionResult Create(DiagnosticoModel diagnosticoModel)
        {
            ViewBag.IdDominioDiagnostico = new SelectList(gDominioDiagnostico.ObterTodos(), "IdDominioDiagnostico", "DescricaoDominioDiagnostico",
                diagnosticoModel.IdDominioDiagnostico);
            if (ModelState.IsValid && gDiagnostico.VerificaSeClassePerteceADominio(diagnosticoModel.IdDominioDiagnostico,
                diagnosticoModel.IdClasseDiagnostico))
            {
                gDiagnostico.Inserir(diagnosticoModel);
                return RedirectToAction("Index");
            }
            if (diagnosticoModel.IdDominioDiagnostico > Global.ValorInteiroNulo)
            {
                ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterPorDominio(diagnosticoModel.IdDominioDiagnostico),
                    "IdClasseDiagnostico", "DescricaoClasseDiagnostico", diagnosticoModel.IdClasseDiagnostico);
            }
            else
            {
                ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterTodos(), "IdClasseDiagnostico",
                    "DescricaoClasseDiagnostico", diagnosticoModel.IdClasseDiagnostico);
            }
            return View(diagnosticoModel);
        }

        //
        // GET: /Diagnostico/Edit/5
        public ActionResult Edit(int id)
        {
            DiagnosticoModel diagnostico = gDiagnostico.Obter(id);
            ViewBag.IdDominioDiagnostico = new SelectList(gDominioDiagnostico.ObterTodos(), "IdDominioDiagnostico", "DescricaoDominioDiagnostico",
                diagnostico.IdDominioDiagnostico);
            ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterTodos(), "IdClasseDiagnostico", "DescricaoClasseDiagnostico",
                diagnostico.IdClasseDiagnostico);
            return View(diagnostico);
        }

        //
        // POST: /Diagnostico/Edit/5

        [HttpPost]
        public ActionResult Edit(DiagnosticoModel diagnostico)
        {
            ViewBag.IdDominioDiagnostico = new SelectList(gDominioDiagnostico.ObterTodos(), "IdDominioDiagnostico", "DescricaoDominioDiagnostico",
                diagnostico.IdDominioDiagnostico);
            if (ModelState.IsValid && gDiagnostico.VerificaSeClassePerteceADominio(diagnostico.IdDominioDiagnostico,
                diagnostico.IdClasseDiagnostico))
            {
                gDiagnostico.Atualizar(diagnostico);
                return RedirectToAction("Index");
            }
            if (diagnostico.IdDominioDiagnostico > Global.ValorInteiroNulo)
            {
                ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterPorDominio(diagnostico.IdDominioDiagnostico),
                    "IdClasseDiagnostico", "DescricaoClasseDiagnostico", diagnostico.IdClasseDiagnostico);
            }
            else
            {
                ViewBag.IdClasseDiagnostico = new SelectList(gClasseDiagnostico.ObterTodos(), "IdClasseDiagnostico",
                    "DescricaoClasseDiagnostico", diagnostico.IdClasseDiagnostico);
            }
            return View(diagnostico);
        }

        //
        // GET: /Diagnostico/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gDiagnostico.Obter(id));
        }

        //
        // POST: /Diagnostico/Delete/5

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