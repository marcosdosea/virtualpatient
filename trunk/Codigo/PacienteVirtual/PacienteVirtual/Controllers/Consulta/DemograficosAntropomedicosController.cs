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
            return View(gDemoAntrop.Obter(id));
        }

        //
        // POST: /DemograficosAntropomedicos/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gDemoAntrop.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}