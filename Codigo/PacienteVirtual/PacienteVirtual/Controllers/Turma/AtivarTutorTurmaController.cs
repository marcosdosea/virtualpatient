﻿using System.Linq;
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

        [HttpPost]
        public ActionResult Index(int IdTurma = Global.NaoSelecionado)
        {
            ViewBag.codigo = IdTurma;
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodosAtivos().ToList(), "IdTurma", "Codigo");
            if (IdTurma != Global.NaoSelecionado)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterAlunosTutoresPorTurma(IdTurma).ToList());
            }
            else
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterAlunosTutoresTurmasAtivas());
            }
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
