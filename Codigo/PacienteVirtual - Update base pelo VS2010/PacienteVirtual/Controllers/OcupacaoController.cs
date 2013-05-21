using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models.Data;
using PacienteVirtual.Models.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class OcupacaoController : Controller
    {
        //
        // GET: /Ocupacao/

        public ViewResult Index()
        {
            return View(GerenciadorOcupacao.GetInstance().ObterTodos());
        }

        //
        // GET: /Ocupacao/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorOcupacao.GetInstance().Obter(id));
        }

        //
        // GET: /Ocupacao/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Ocupacao/Create

        [HttpPost]
        public ActionResult Create(OcupacaoModel ocupacaoModel)
        {
            if (ModelState.IsValid)
            {

                ocupacaoModel.IdOcupacao = GerenciadorOcupacao.GetInstance().Inserir(ocupacaoModel);

                return RedirectToAction("Index");
            }

            return View(ocupacaoModel);
        }

        //
        // GET: /Ocupacao/Edit/5

        public ActionResult Edit(int id)
        {
            OcupacaoModel ocupacaoModel = GerenciadorOcupacao.GetInstance().Obter(id);
            return View(ocupacaoModel);
        }

        //
        // POST: /Ocupacao/Edit/5

        [HttpPost]
        public ActionResult Edit(OcupacaoModel ocupacaoModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorOcupacao.GetInstance().Atualizar(ocupacaoModel);
                return RedirectToAction("Index");
            }
            return View(ocupacaoModel);
        }

        //
        // GET: /Ocupacao/Delete/5

        public ActionResult Delete(int id)
        {
            OcupacaoModel ocupacaoModel = GerenciadorOcupacao.GetInstance().Obter(id);
            return View(ocupacaoModel);
        }

        //
        // POST: /Ocupacao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorOcupacao.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}