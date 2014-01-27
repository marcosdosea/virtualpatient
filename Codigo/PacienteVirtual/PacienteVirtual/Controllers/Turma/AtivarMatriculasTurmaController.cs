﻿using System.Collections.Generic;
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
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodos().ToList(), "IdTurma", "Codigo");
            return View(GerenciadorTurmaPessoa.GetInstance().ObterTodosExcecaoAdm());
        }

        [HttpPost]
        public ActionResult Index(int IdTurma = -1)
        {

            ViewBag.codigo = IdTurma;
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodos().ToList(), "IdTurma", "Codigo");
            if (IdTurma != -1)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaExcecaoAdm(IdTurma).ToList());
            }
            if (IdTurma == -1)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterTodosExcecaoAdm());
            }
            return View();
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

        private static bool ativadesativar = true;
        [HttpPost]
        public ActionResult AtivarDesativarTodos(int IdTurma = -1)
        {
            List<TurmaPessoaModel> listaPessoa;
            if (IdTurma == -1)
            {
                listaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterTodosExcecaoAdm().ToList();
            }
            else
            {
                listaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaExcecaoAdm(IdTurma).ToList();
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
    }
}
