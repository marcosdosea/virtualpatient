using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using PacienteVirtual.Negocio.Cadastro;
using PacienteVirtual.Models.Cadastro;

namespace PacienteVirtual.Controllers
{ 
    public class GrupoIntervencaoController : Controller
    {
        //
        // GET: /GrupoIntervencao/

        public ViewResult Index()
        {
            return View(GerenciadorGrupoIntervencao.GetInstance().ObterTodos());
        }

        //
        // GET: /GrupoIntervencao/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorGrupoIntervencao.GetInstance().Obter(id));
        }

        //
        // GET: /GrupoIntervencao/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /GrupoIntervencao/Create

        [HttpPost]
        public ActionResult Create(GrupoIntervencaoModel grupoIntervencaoModel)
        {
            if (ModelState.IsValid)
            {
                grupoIntervencaoModel.IdGrupoIntervencao = GerenciadorGrupoIntervencao.GetInstance().Inserir(grupoIntervencaoModel);
                return RedirectToAction("Index");
            }

            return View(grupoIntervencaoModel);
        }

        //
        // GET: /GrupoIntervencao/Edit/5

        public ActionResult Edit(int id)
        {
            GrupoIntervencaoModel grupoIntervencaoModel = GerenciadorGrupoIntervencao.GetInstance().Obter(id);
            return View(grupoIntervencaoModel);
        }

        //
        // POST: /GrupoIntervencao/Edit/5

        [HttpPost]
        public ActionResult Edit(GrupoIntervencaoModel grupoIntervencaoModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorGrupoIntervencao.GetInstance().Atualizar(grupoIntervencaoModel);
                return RedirectToAction("Index");
            }
            return View(grupoIntervencaoModel);
        }

        //
        // GET: /GrupoIntervencao/Delete/5

        public ActionResult Delete(int id)
        {
            GrupoIntervencaoModel grupoIntervencaoModel = GerenciadorGrupoIntervencao.GetInstance().Obter(id);
            return View(grupoIntervencaoModel);
        }

        //
        // POST: /GrupoIntervencao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            string nivelEscolaridade = GerenciadorGrupoIntervencao.GetInstance().Obter(id).DescricaoGrupoIntervencao;
            GerenciadorGrupoIntervencao.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}