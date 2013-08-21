using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ConsultaFixoController : Controller
    {

        GerenciadorConsultaFixo gConsultaFixo = GerenciadorConsultaFixo.GetInstance();
        //
        // GET: /ConsultaFixo/

        public ViewResult Index()
        {
            return View(gConsultaFixo.ObterTodos());
        }

        //
        // GET: /ConsultaFixo/Details/5

        public ViewResult Details(long id)
        {

            return View(gConsultaFixo.Obter(id));
        }

        //
        // GET: /ConsultaFixo/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /ConsultaFixo/Create

        [HttpPost]
        public ActionResult Create(ConsultaFixoModel consultafixoModel)
        {
            if (ModelState.IsValid)
            {
                consultafixoModel.IdConsultaFixo = gConsultaFixo.Inserir(consultafixoModel);
                return RedirectToAction("Create", "DemograficosAntropomedicos", consultafixoModel);  
            }

            return View(consultafixoModel);
        }
        
        //
        // GET: /ConsultaFixo/Edit/5
 
        public ActionResult Edit(long id)
        {
            return View(gConsultaFixo.Obter(id));
        }

        //
        // POST: /ConsultaFixo/Edit/5

        [HttpPost]
        public ActionResult Edit(ConsultaFixoModel consultafixoModel)
        {
            if (ModelState.IsValid)
            {
                gConsultaFixo.Atualizar(consultafixoModel);
       
                return RedirectToAction("Index");
            }
            return View(consultafixoModel);
        }

        //
        // GET: /ConsultaFixo/Delete/5
 
        public ActionResult Delete(long id)
        {
            return View(gConsultaFixo.Obter(id));
        }

        //
        // POST: /ConsultaFixo/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gConsultaFixo.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}