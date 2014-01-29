using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class AtivarTutorTurmaController : Controller
    {
        //
        // GET: /AtivarMatriculasTurma/

        public ActionResult Index()
        {
            if (SessionController.DadosTurmaPessoa.IdRole == Global.Administrador)
            {
                ViewBag.SelecionaTurma = true;
                ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodosAtivos().ToList(), "IdTurma", "Codigo");
                return View(GerenciadorTurmaPessoa.GetInstance().ObterTodosExcecaoAdmTurmasAtivas());
            }
            else
            {
                ViewBag.SelecionaTurma = false;
                return View(GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaExcecaoAdm(SessionController.DadosTurmaPessoa.IdTurma));
            }
        }

        [HttpPost]
        public ActionResult Index(int IdTurma = -1)
        {
            ViewBag.codigo = IdTurma;
            ViewBag.SelecionaTurma = true;
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodosAtivos().ToList(), "IdTurma", "Codigo");
            if (IdTurma != -1)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaExcecaoAdm(IdTurma).ToList());
            }
            else
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterTodosExcecaoAdmTurmasAtivas());
            }
        }


        public ActionResult Ativar(int idTurma, int idPessoa)
        {
            TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(idTurma, idPessoa);
            tpm.IdRole = Global.Tutor;
            switch (tpm.IdRole)
            {
                case Global.Usuario:
                    tpm.NomeRole = "usuario";
                    break;
                case Global.Tutor:
                    tpm.NomeRole = "tutor";
                    break;
                case Global.Administrador:
                    tpm.NomeRole = "administrador";
                    break;
            }
            GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
            return RedirectToAction("Index", idTurma);
        }


        public ActionResult Desativar(int idTurma, int idPessoa)
        {
            TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(idTurma, idPessoa);
            tpm.IdRole = Global.Usuario;
            switch (tpm.IdRole)
            {
                case Global.Usuario:
                    tpm.NomeRole = "usuario";
                    break;
                case Global.Tutor:
                    tpm.NomeRole = "tutor";
                    break;
                case Global.Administrador:
                    tpm.NomeRole = "administrador";
                    break;
            }
            GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
            return RedirectToAction("Index", idTurma);

        }

    }
}
