using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ParametroClinicoController : Controller
    {
        //
        // GET: /ParamentoClinico/

        public ViewResult Index()
        {
            return View(GerenciadorParametroClinico.GetInstance().ObterTodos());
        }

        //
        // GET: /ParamentoClinico/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorParametroClinico.GetInstance().Obter(id));
        }

        //
        // GET: /ParamentoClinico/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ParamentoClinico/Create

        [HttpPost]
        public ActionResult Create(ParametroClinicoModel parametroClinicoModel)
        {
            if (ModelState.IsValid)
            {
                parametroClinicoModel.IdParametroClinico = GerenciadorParametroClinico.GetInstance().Inserir(parametroClinicoModel);
                return RedirectToAction("Index");
            }

            return View(parametroClinicoModel);
        }

        //
        // GET: /ParamentoClinico/Edit/5

        public ActionResult Edit(int id)
        {
            ParametroClinicoModel parametroClinicoModel = GerenciadorParametroClinico.GetInstance().Obter(id);
            return View(parametroClinicoModel);
        }

        //
        // POST: /ParamentoClinico/Edit/5

        [HttpPost]
        public ActionResult Edit(ParametroClinicoModel parametroClinicoModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorParametroClinico.GetInstance().Atualizar(parametroClinicoModel);
                return RedirectToAction("Index");
            }
            return View(parametroClinicoModel);
        }

        //
        // GET: /ParamentoClinico/Delete/5

        public ActionResult Delete(int id)
        {
            ParametroClinicoModel parametroClinicoModel = GerenciadorParametroClinico.GetInstance().Obter(id);
            return View(parametroClinicoModel);
        }

        //
        // POST: /ParamentoClinico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorParametroClinico.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}