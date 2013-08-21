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
    public class PerguntaController : Controller
    {
        //
        // GET: /Pergunta/

        public ViewResult Index()
        {
            return View(GerenciadorPergunta.GetInstance().ObterTodos());
        }

        //
        // GET: /Pergunta/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorPergunta.GetInstance().Obter(id));
        }

        //
        // GET: /Pergunta/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Pergunta/Create

        [HttpPost]
        public ActionResult Create(PerguntaModel perguntaModel)
        {
            if (ModelState.IsValid)
            {

                perguntaModel.IdPergunta = GerenciadorPergunta.GetInstance().Inserir(perguntaModel);

                return RedirectToAction("Index");
            }

            return View(perguntaModel);
        }

        //
        // GET: /Pergunta/Edit/5

        public ActionResult Edit(int id)
        {
            PerguntaModel perguntaModel = GerenciadorPergunta.GetInstance().Obter(id);
            return View(perguntaModel);
        }

        //
        // POST: /Pergunta/Edit/5

        [HttpPost]
        public ActionResult Edit(PerguntaModel perguntaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorPergunta.GetInstance().Atualizar(perguntaModel);
                return RedirectToAction("Index");
            }
            return View(perguntaModel);
        }

        //
        // GET: /Pergunta/Delete/5

        public ActionResult Delete(int id)
        {
            PerguntaModel perguntaModel = GerenciadorPergunta.GetInstance().Obter(id);
            return View(perguntaModel);
        }

        //
        // POST: /Pergunta/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorPergunta.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}