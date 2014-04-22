using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class PessoaController : Controller
    {

        public ViewResult DefinirAdministrador()
        {
            return View(GerenciadorPessoa.GetInstance().ObterTodos());
        }


        public ActionResult DefinirAdmEnfermagem(int idPessoa)
        {
            TurmaPessoaModel turmaPessoa = new TurmaPessoaModel();
            turmaPessoa.IdPessoa = idPessoa;
            turmaPessoa.IdRole = Global.AdministradorEnfermagem;
            turmaPessoa.IdTurma = Global.TurmaAdminEnfermagem;
            turmaPessoa.Ativa = true;
            GerenciadorTurmaPessoa.GetInstance().Inserir(turmaPessoa);
            return RedirectToAction("Index", "Home");
        }


        public ActionResult DefinirAdmFarmacia(int idPessoa)
        {
            TurmaPessoaModel turmaPessoa = new TurmaPessoaModel();
            turmaPessoa.IdPessoa = idPessoa;
            turmaPessoa.IdRole = Global.AdministradorFarmacia;
            turmaPessoa.IdTurma = Global.TurmaAdminFarmacia;
            turmaPessoa.Ativa = true;
            GerenciadorTurmaPessoa.GetInstance().Inserir(turmaPessoa);
            return RedirectToAction("Index", "Home");
        }
        
        //
        // GET: /Pessoa/

        public ViewResult Index()
        {
            return View(GerenciadorPessoa.GetInstance().ObterTodos());
        }

        //
        // GET: /Pessoa/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorPessoa.GetInstance().Obter(id));
        }

        //
        // GET: /Pessoa/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Pessoa/Create

        [HttpPost]
        public ActionResult Create(PessoaModel pessoaModel)
        {
            if (ModelState.IsValid)
            {

                pessoaModel.IdPessoa = GerenciadorPessoa.GetInstance().Inserir(pessoaModel);

                return RedirectToAction("Index");
            }

            return View(pessoaModel);
        }

        //
        // GET: /Pessoa/Edit/5

        public ActionResult Edit(int id)
        {
            PessoaModel pessoaModel = GerenciadorPessoa.GetInstance().Obter(id);
            return View(pessoaModel);
        }

        //
        // POST: /Pessoa/Edit/5

        [HttpPost]
        public ActionResult Edit(PessoaModel pessoaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorPessoa.GetInstance().Atualizar(pessoaModel);
                return RedirectToAction("Index");
            }
            return View(pessoaModel);
        }

        //
        // GET: /Pessoa/Delete/5

        public ActionResult Delete(int id)
        {
            PessoaModel pessoaModel = GerenciadorPessoa.GetInstance().Obter(id);
            return View(pessoaModel);
        }

        //
        // POST: /Pessoa/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorPessoa.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}