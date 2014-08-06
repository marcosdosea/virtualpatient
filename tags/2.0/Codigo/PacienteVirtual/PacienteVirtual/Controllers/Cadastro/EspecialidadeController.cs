using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models.Cadastro;

namespace PacienteVirtual.Controllers.Cadastro
{ 
    public class EspecialidadeController : Controller
    {
        //
        // GET: /Alergia/

        public ViewResult Index()
        {
            return View(GerenciadorEspecialidade.GetInstance().ObterTodos());
        }

        //
        // GET: /Alergia/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorEspecialidade.GetInstance().Obter(id));
        }

        //
        // GET: /Alergia/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Alergia/Create

        [HttpPost]
        public ActionResult Create(EspecialidadeModel especialidadeModel)
        {
            if (ModelState.IsValid)
            {
                especialidadeModel.IdEspecialidade = GerenciadorEspecialidade.GetInstance().Inserir(especialidadeModel);
                return RedirectToAction("Index");
            }

            return View(especialidadeModel);
        }

        //
        // GET: /Alergia/Edit/5

        public ActionResult Edit(int id)
        {
            EspecialidadeModel especialidadeModel = GerenciadorEspecialidade.GetInstance().Obter(id);
            return View(especialidadeModel);
        }

        //
        // POST: /Alergia/Edit/5

        [HttpPost]
        public ActionResult Edit(EspecialidadeModel especialidadeModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorEspecialidade.GetInstance().Atualizar(especialidadeModel);
                return RedirectToAction("Index");
            }
            return View(especialidadeModel);
        }

        //
        // GET: /Alergia/Delete/5

        public ActionResult Delete(int id)
        {
            EspecialidadeModel especialidadeModel = GerenciadorEspecialidade.GetInstance().Obter(id);
            return View(especialidadeModel);
        }

        //
        // POST: /Alergia/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorEspecialidade.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}