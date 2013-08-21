using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{ 
    public class RespostaController : Controller
    {
        GerenciadorResposta gResposta = GerenciadorResposta.GetInstance();
        GerenciadorPergunta gPergunta = GerenciadorPergunta.GetInstance();

        //
        // GET: /Curso/
        public ViewResult Index()
        {
            return View(gResposta.ObterTodos());
        }

        //
        // GET: /Curso/Details/5
        public ViewResult Details(int id)
        {
            return View(gResposta.Obter(id));
        }

        //
        // GET: /Curso/Create

        public ActionResult Create()
        {
            ViewBag.IdPergunta = new SelectList(gPergunta.ObterTodos().ToList(), "IdPergunta", "Pergunta");
            return View();
        }

        //
        // POST: /Curso/Create
        [HttpPost]
        public ActionResult Create(RespostaModel respostaModel)
        {
            if (ModelState.IsValid)
            {
                respostaModel.IdResposta = gResposta.Inserir(respostaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdPergunta = new SelectList(gPergunta.ObterTodos().ToList(), "IdPergunta", "Pergunta", respostaModel.IdPergunta);
            return View(respostaModel);
        }

        //
        // GET: /Curso/Edit/5
        public ActionResult Edit(int id)
        {
            RespostaModel respostaModel = gResposta.Obter(id);
            ViewBag.IdPergunta = new SelectList(gPergunta.ObterTodos().ToList(), "IdPergunta", "Pergunta", respostaModel.IdPergunta);
            return View(respostaModel);
        }

        //
        // POST: /Curso/Edit/5

        [HttpPost]
        public ActionResult Edit(RespostaModel respostaModel)
        {
            if (ModelState.IsValid)
            {
                gResposta.Atualizar(respostaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdPergunta = new SelectList(gPergunta.ObterTodos().ToList(), "IdPergunta", "Pergunta", respostaModel.IdPergunta);
            return View(respostaModel);
        }

        //
        // GET: /Curso/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gResposta.Obter(id));
        }

        //
        // POST: /Curso/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gResposta.Remover(id);
            return RedirectToAction("Index");

        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}