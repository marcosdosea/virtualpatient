using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class AreaAtuacaoController : Controller
    {
        //
        // GET: /AreaAtuacao/

        public ViewResult Index()
        {
            return View(GerenciadorAreaAtuacao.GetInstance().ObterTodos());
        }

        //
        // GET: /AreaAtuacao/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorAreaAtuacao.GetInstance().Obter(id));
        }

        //
        // GET: /AreaAtuacao/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /AreaAtuacao/Create

        [HttpPost]
        public ActionResult Create(AreaAtuacaoModel areaAtuacaoModel)
        {
            if (ModelState.IsValid)
            {
                areaAtuacaoModel.IdAreaAtuacao = GerenciadorAreaAtuacao.GetInstance().Inserir(areaAtuacaoModel);
                return RedirectToAction("Index");
            }
            return View(areaAtuacaoModel);
        }

        //
        // GET: /AreaAtuacao/Edit/5

        public ActionResult Edit(int id)
        {
            AreaAtuacaoModel areaAtuacaoModel = GerenciadorAreaAtuacao.GetInstance().Obter(id);
            return View(areaAtuacaoModel);
        }

        //
        // POST: /AreaAtuacao/Edit/5

        [HttpPost]
        public ActionResult Edit(AreaAtuacaoModel areaAtuacaoModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorAreaAtuacao.GetInstance().Atualizar(areaAtuacaoModel);
                return RedirectToAction("Index");
            }
            return View(areaAtuacaoModel);
        }

        //
        // GET: /AreaAtuacao/Delete/5

        public ActionResult Delete(int id)
        {
            AreaAtuacaoModel areaAtuacaoModel = GerenciadorAreaAtuacao.GetInstance().Obter(id);
            return View(areaAtuacaoModel);
        }

        //
        // POST: /AreaAtuacao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorAreaAtuacao.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}