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
        GerenciadorEscolaridade gEscolaridade = GerenciadorEscolaridade.GetInstance();
        GerenciadorPlanoSaude gPlanoSaude = GerenciadorPlanoSaude.GetInstance();
        GerenciadorOcupacao gOcupacao = GerenciadorOcupacao.GetInstance();

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

        public ActionResult Create(ConsultaFixoModel consultaFixo)
        {
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos(), "IdConsultaFixo", "IdConsultaFixo");
            ViewBag.IdEscolaridade = new SelectList(gEscolaridade.ObterTodos().ToList(), "IdEscolaridade", "Nivel");
            ViewBag.IdOcupacao = new SelectList(gOcupacao.ObterTodos().ToList(), "IdOcupacao", "Descricao");
            ViewBag.IdPlanoSaude = new SelectList(gPlanoSaude.ObterTodos().ToList(), "IdPlanoSaude", "Nome");
            //ViewBag.ig = consultaFixo.IdConsultaFixo;

            DemograficosAntropometricosModel d = new DemograficosAntropometricosModel();
            d.IdConsultaFixo = consultaFixo.IdConsultaFixo;
            return View(d); 
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
                return RedirectToAction("Index","ConsultaFixo");  
            }

            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");
            ViewBag.IdEscolaridade = new SelectList(gEscolaridade.ObterTodos().ToList(), "IdEscolaridade", "Nivel");
            ViewBag.IdOcupacao = new SelectList(gOcupacao.ObterTodos().ToList(), "IdOcupacao", "Descricao");
            ViewBag.IdPlanoSaude = new SelectList(gPlanoSaude.ObterTodos().ToList(), "IdPlanoSaude", "Nome");
            return View(demograficosAntropometricosModel);
        }
        
        //
        // GET: /DemograficosAntropomedicos/Edit/5
 
        public ActionResult Edit(long id)
        {
           // DemograficosAntropometricosE tb_demograficos_antropometricos = db.tb_demograficos_antropometricos.Single(t => t.IdConsultaFixo == id);
            DemograficosAntropometricosModel demoAntro = gDemoAntrop.Obter(id);
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", demoAntro.IdConsultaFixo);
            ViewBag.IdEscolaridade = new SelectList(gEscolaridade.ObterTodos().ToList(), "IdEscolaridade", "Nivel",demoAntro.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(gOcupacao.ObterTodos().ToList(), "IdOcupacao", "Descricao", demoAntro.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(gPlanoSaude.ObterTodos().ToList(), "IdPlanoSaude", "Nome", demoAntro.IdPlanoSaude);

            return View(demoAntro);
        }

        //
        // POST: /DemograficosAntropomedicos/Edit/5

        [HttpPost]
        public ActionResult Edit(DemograficosAntropometricosModel demoAntro)
        {
            if (ModelState.IsValid)
            {
                //db.tb_demograficos_antropometricos.Attach(tb_demograficos_antropometricos);
                //db.ObjectStateManager.ChangeObjectState(tb_demograficos_antropometricos, EntityState.Modified);
                //db.SaveChanges();
                gDemoAntrop.Atualizar(demoAntro);
                
                return RedirectToAction("Index");
            }
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", demoAntro.IdConsultaFixo);
            ViewBag.IdEscolaridade = new SelectList(gEscolaridade.ObterTodos().ToList(), "IdEscolaridade", "Nivel", demoAntro.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(gOcupacao.ObterTodos().ToList(), "IdOcupacao", "Descricao", demoAntro.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(gPlanoSaude.ObterTodos().ToList(), "IdPlanoSaude", "Nome", demoAntro.IdPlanoSaude);
           
            return View(demoAntro);
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