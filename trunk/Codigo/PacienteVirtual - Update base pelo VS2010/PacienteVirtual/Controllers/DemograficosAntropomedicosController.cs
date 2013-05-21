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
    public class DemograficosAntropomedicosController : Controller
    {
        private pvEntities db = new pvEntities();

        GerenciadorDemograficosAntropometricos gDemoAntrop = GerenciadorDemograficosAntropometricos.GetInstance();
        GerenciadorConsultaFixo gConsultaFixo = GerenciadorConsultaFixo.GetInstance();
        //
        // GET: /DemograficosAntropomedicos/

        public ViewResult Index()
        {
            return View(gDemoAntrop.ObterTodos());
        }

        //
        // GET: /DemograficosAntropomedicos/Details/5

        public ViewResult Details(long id)
        {
            return View(gDemoAntrop.Obter(id));
        }

        //
        // GET: /DemograficosAntropomedicos/Create

        public ActionResult Create()
        {
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");
            ViewBag.IdEscolaridade = new SelectList(db.tb_escolaridade, "IdEscolaridade", "Nivel");
            ViewBag.IdOcupacao = new SelectList(db.tb_ocupacao, "IdOcupacao", "Descricao");
            ViewBag.IdPlanoSaude = new SelectList(db.tb_plano_saude, "IdPlanoSaude", "Nome");
            return View();
        } 

        //
        // POST: /DemograficosAntropomedicos/Create

        [HttpPost]
        public ActionResult Create(DemograficosAntropometricosModel demograficosAntropometricosModel)
        {
            if (ModelState.IsValid)
            {
                //db.tb_demograficos_antropometricos.AddObject(tb_demograficos_antropometricos);
                //db.SaveChanges();
               demograficosAntropometricosModel.IdConsultaFixo = gDemoAntrop.Inserir(demograficosAntropometricosModel);
                return RedirectToAction("Index");  
            }

            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");
            ViewBag.IdEscolaridade = new SelectList(db.tb_escolaridade, "IdEscolaridade", "Nivel", demograficosAntropometricosModel.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(db.tb_ocupacao, "IdOcupacao", "Descricao", demograficosAntropometricosModel.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(db.tb_plano_saude, "IdPlanoSaude", "Nome", demograficosAntropometricosModel.IdPlanoSaude);
            return View(demograficosAntropometricosModel);
        }
        
        //
        // GET: /DemograficosAntropomedicos/Edit/5
 
        public ActionResult Edit(long id)
        {
           // DemograficosAntropometricosE tb_demograficos_antropometricos = db.tb_demograficos_antropometricos.Single(t => t.IdConsultaFixo == id);
            DemograficosAntropometricosModel demoAntro = gDemoAntrop.Obter(id);
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");

            ViewBag.IdEscolaridade = new SelectList(db.tb_escolaridade, "IdEscolaridade", "Nivel", demoAntro.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(db.tb_ocupacao, "IdOcupacao", "Descricao", demoAntro.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(db.tb_plano_saude, "IdPlanoSaude", "Nome", demoAntro.IdPlanoSaude);
            return View(demoAntro);
        }

        //
        // POST: /DemograficosAntropomedicos/Edit/5

        [HttpPost]
        public ActionResult Edit(DemograficosAntropometricosModel demograficosAntropometricosModel)
        {
            if (ModelState.IsValid)
            {
                //db.tb_demograficos_antropometricos.Attach(tb_demograficos_antropometricos);
                //db.ObjectStateManager.ChangeObjectState(tb_demograficos_antropometricos, EntityState.Modified);
                //db.SaveChanges();
                gDemoAntrop.Atualizar(demograficosAntropometricosModel);
                
                return RedirectToAction("Index");
            }
            //ViewBag.IdConsultaFixo = new SelectList(db.tb_consulta_fixo, "IdConsultaFixo", "IdConsultaFixo", demograficosAntropometricosModel.IdConsultaFixo);
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");
            
            ViewBag.IdEscolaridade = new SelectList(db.tb_escolaridade, "IdEscolaridade", "Nivel", demograficosAntropometricosModel.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(db.tb_ocupacao, "IdOcupacao", "Descricao", demograficosAntropometricosModel.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(db.tb_plano_saude, "IdPlanoSaude", "Nome", demograficosAntropometricosModel.IdPlanoSaude);
            return View(demograficosAntropometricosModel);
        }

        //
        // GET: /DemograficosAntropomedicos/Delete/5
 
        public ActionResult Delete(long id)
        {
            //DemograficosAntropometricosE tb_demograficos_antropometricos = db.tb_demograficos_antropometricos.Single(t => t.IdConsultaFixo == id);
            return View(gDemoAntrop.Obter(id));
        }

        //
        // POST: /DemograficosAntropomedicos/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            //DemograficosAntropometricosE tb_demograficos_antropometricos = db.tb_demograficos_antropometricos.Single(t => t.IdConsultaFixo == id);
            //db.tb_demograficos_antropometricos.DeleteObject(tb_demograficos_antropometricos);
            //db.SaveChanges();
            gDemoAntrop.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}