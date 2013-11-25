using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers.Turma
{
    public class AtivarTutorTurmaController : Controller
    {
        //
        // GET: /AtivarMatriculasTurma/

        public ActionResult Index()
        {
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodos().ToList(), "IdTurma", "Codigo");
            return View(GerenciadorTurmaPessoa.GetInstance().ObterTodosAtivados());
        }

        [HttpPost]
        public ActionResult Index(int IdTurma = -1)
        {

            ViewBag.codigo = IdTurma;
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodos().ToList(), "IdTurma", "Codigo");
            if (IdTurma != -1)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaAtivados(IdTurma).ToList());
            }
            if (IdTurma == -1)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterTodosAtivados());
            }
            return View();
        }


        public ActionResult Ativar(int idTurma, int idPessoa)
        {
            TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(idTurma, idPessoa);
            tpm.IdRole = Global.Tutor;
            GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
            return RedirectToAction("Index", idTurma);
        }


        public ActionResult Desativar(int idTurma, int idPessoa)
        {
            TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(idTurma, idPessoa);
            tpm.IdRole = Global.Usuario;
            GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
            return RedirectToAction("Index", idTurma);

        }

    }
}
