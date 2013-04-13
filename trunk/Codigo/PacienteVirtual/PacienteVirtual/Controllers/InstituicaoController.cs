using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Models.Negocio;

namespace PacienteVirtual.Controllers
{
    public class InstituicaoController : Controller
    {

        //
        // GET: /Instituicao/

        public ViewResult Index()
        {
            return View(GerenciadorInstituicao.GetInstance().ObterTodos());
        }

        //
        // GET: /Instituicao/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorInstituicao.GetInstance().Obter(id));
        }

        //
        // GET: /Instituicao/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Instituicao/Create

        [HttpPost]
        public ActionResult Create(InstituicaoModel instituicaoModel)
        {
            if (ModelState.IsValid)
            {
                instituicaoModel.IdInstituicao = GerenciadorInstituicao.GetInstance().Inserir(instituicaoModel);
                return RedirectToAction("Index");
            }

            return View(instituicaoModel);
        }

        //
        // GET: /Instituicao/Edit/5

        public ActionResult Edit(int id)
        {
            InstituicaoModel instituicaoModel = GerenciadorInstituicao.GetInstance().Obter(id);
            return View(instituicaoModel);
        }

        //
        // POST: /Instituicao/Edit/5

        [HttpPost]
        public ActionResult Edit(InstituicaoModel instituicaoModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorInstituicao.GetInstance().Atualizar(instituicaoModel);
                return RedirectToAction("Index");
            }
            return View(instituicaoModel);
        }

        //
        // GET: /Instituicao/Delete/5

        public ActionResult Delete(int id)
        {
            InstituicaoModel instituicaoModel = GerenciadorInstituicao.GetInstance().Obter(id);
            return View(instituicaoModel);
        }

        //
        // POST: /Instituicao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorInstituicao.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}