using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class AtivarMatriculasTurmaController : Controller
    {
        //
        // GET: /AtivarMatriculasTurma/

        public ActionResult Index()
        {
            int idRole = SessionController.DadosTurmaPessoa.IdRole;
            if (idRole == Global.AdministradorEnfermagem || idRole == Global.AdministradorFarmacia)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterAlunosTurmasAtivas());
            }
            else
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterAlunosPorTurma(SessionController.DadosTurmaPessoa.IdTurma));
            }
        }

        public ActionResult Ativar(int idTurma, int idPessoa)
        {
            TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(idTurma, idPessoa);
            tpm.Ativa = true;
            tpm.IdRole = Global.Usuario;
            GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
            return RedirectToAction("Index");
        }


        public ActionResult Desativar(int idTurma, int idPessoa)
        {
            TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(idTurma, idPessoa);
            tpm.Ativa = false;
            tpm.IdRole = Global.Usuario;
            GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
            return RedirectToAction("Index");

        }

        /*
        private static bool ativadesativar = true;
        public ActionResult AtivarDesativarTodos()
        {
            List<TurmaPessoaModel> listaPessoa = null; // quando for usar tirar o null
            if (SessionController.IdTurmaAtribuirMatriculaTutor == -1)
            {
                //listaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterTodosExcecaoAdmTurmasAtivas().ToList();
            }
            else
            {
                //listaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaExcecaoAdm(SessionController.IdTurmaAtribuirMatriculaTutor).ToList();
            }
            if (ativadesativar)
            {
                foreach (TurmaPessoaModel pessoa in listaPessoa)
                {
                    pessoa.Ativa = true;
                    pessoa.IdRole = Global.Usuario;
                    GerenciadorTurmaPessoa.GetInstance().Atualizar(pessoa);
                }
                ativadesativar = false;
            }
            else
            {
                foreach (TurmaPessoaModel pessoa in listaPessoa)
                {
                    pessoa.Ativa = false;
                    pessoa.IdRole = Global.Usuario;
                    GerenciadorTurmaPessoa.GetInstance().Atualizar(pessoa);
                }
                ativadesativar = true;
            }

            return RedirectToAction("Index");
        }
        */
    }
}
