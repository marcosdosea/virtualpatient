using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ReligiaoController : Controller
    {
        //
        // GET: /Religiao/

        public ViewResult Index()
        {
            return View(GerenciadorReligiao.GetInstance().ObterTodos());
        }

        //
        // GET: /Religiao/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorReligiao.GetInstance().Obter(id));
        }

        //
        // GET: /Religiao/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Religiao/Create

        [HttpPost]
        public ActionResult Create(ReligiaoModel religiaoModel)
        {
            if (ModelState.IsValid)
            {
                religiaoModel.IdReligiao = GerenciadorReligiao.GetInstance().Inserir(religiaoModel);
                return RedirectToAction("Index");
            }
            return View(religiaoModel);
        }

        //
        // GET: /Religiao/Edit/5

        public ActionResult Edit(int id)
        {
            ReligiaoModel religiaoModel = GerenciadorReligiao.GetInstance().Obter(id);
            return View(religiaoModel);
        }

        //
        // POST: /Religiao/Edit/5

        [HttpPost]
        public ActionResult Edit(ReligiaoModel religiaoModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorReligiao.GetInstance().Atualizar(religiaoModel);
                return RedirectToAction("Index");
            }
            return View(religiaoModel);
        }

        //
        // GET: /Religiao/Delete/5

        public ActionResult Delete(int id)
        {
            ReligiaoModel religiaoModel = GerenciadorReligiao.GetInstance().Obter(id);
            return View(religiaoModel);
        }

        //
        // POST: /Religiao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorReligiao.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}