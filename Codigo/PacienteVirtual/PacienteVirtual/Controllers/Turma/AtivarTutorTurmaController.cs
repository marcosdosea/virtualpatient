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
            return View(GerenciadorTurmaPessoa.GetInstance().ObterAlunosTutoresTurmasAtivas());
        }

        // Ativar
        public ActionResult Ativar(int idTurma, int idPessoa)
        {
            TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(idTurma, idPessoa);
            tpm.IdRole = Global.Tutor;
            switch (tpm.IdRole)
            {
                case Global.Usuario:
                    tpm.NomeRole = Global.stringUsuarioRole;
                    break;
                case Global.Tutor:
                    tpm.NomeRole = Global.stringTutorRole;
                    break;
                case Global.Administrador:
                    tpm.NomeRole = Global.stringAdministradorRole;
                    break;
            }
            tpm.Ativa = true;
            GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
            return RedirectToAction("Index", idTurma);
        }

        // Desativar
        public ActionResult Desativar(int idTurma, int idPessoa)
        {
            TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(idTurma, idPessoa);
            tpm.IdRole = Global.Usuario;
            switch (tpm.IdRole)
            {
                case Global.Usuario:
                    tpm.NomeRole = Global.stringUsuarioRole;
                    break;
                case Global.Tutor:
                    tpm.NomeRole = Global.stringTutorRole;
                    break;
                case Global.Administrador:
                    tpm.NomeRole = Global.stringAdministradorRole;
                    break;
            }
            GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
            return RedirectToAction("Index", idTurma);

        }

    }
}
