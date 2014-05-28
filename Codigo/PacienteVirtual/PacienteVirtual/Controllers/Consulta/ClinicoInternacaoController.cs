using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class ClinicoInternacaoController : Controller
    {
        private GerenciadorClinicoInternacao gClinicoInternacao = GerenciadorClinicoInternacao.GetInstance();

        [HttpPost]
        public ActionResult Edit(ClinicoInternacaoModel clinicoInternacao)
        {
            if (ModelState.IsValid)
            {
                gClinicoInternacao.Atualizar(clinicoInternacao);
                SessionController.ClinicoInternacao = clinicoInternacao;
            }
            SessionController.Abas1 = Global.abaClinicoInternacao;
            return RedirectToAction("Edit", "Consulta");
        }

        // GET
        public ViewResult ListaPatologiasAtuais()
        {
            return View(gClinicoInternacao.ObterPatologiasAtuais(SessionController.ConsultaFixo.IdConsultaFixo));
        }

        //
        // POST: /MedicamentoPrescrito/Create
        [HttpPost]
        public ActionResult AdicionarPatologiasAtuais(PatologiasAtuaisModel patologiasAtuais)
        {
            if (ModelState.IsValid)
            {
                patologiasAtuais.IdConsultaFixo = SessionController.ConsultaVariavel.IdConsultaFixo;
                gClinicoInternacao.InserirPatologiasAtuais(patologiasAtuais.IdConsultaFixo, patologiasAtuais.IdPatologia);
                SessionController.ListaPatologiasAtuais = null;
            }
            //SessionController.Abas1 = Global.abaMedPresc;
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult RemoverPatologiasAtuais(long idPatologia)
        {
            gClinicoInternacao.RemoverPatologiasAtuais(SessionController.ConsultaFixo.IdConsultaFixo, idPatologia);
            SessionController.ListaPatologiasAtuais = null;
            //SessionController.Abas2 = Global.abaDiarioPessoal;
            return RedirectToAction("Edit", "Consulta");
        }

        // GET
        public ViewResult ListaAntecedentesPatologicos()
        {
            return View(gClinicoInternacao.ObterAntecedentesPatologicos(SessionController.ConsultaFixo.IdConsultaFixo));
        }

        //
        // POST: /MedicamentoPrescrito/Create
        [HttpPost]
        public ActionResult AdicionarAntecedentesPatologicos(AntecedentesPatologicosModel antecedentesPatologicos)
        {
            if (ModelState.IsValid)
            {
                antecedentesPatologicos.IdConsultaFixo = SessionController.ConsultaVariavel.IdConsultaFixo;
                gClinicoInternacao.InserirAntecedentesPatologicos(antecedentesPatologicos.IdConsultaFixo, antecedentesPatologicos.IdPatologia);
                SessionController.ListaAntecedentesPatologicos = null;
            }
            //SessionController.Abas1 = Global.abaMedPresc;
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult RemoverAntecedentesPatologicos(long idPatologia)
        {
            gClinicoInternacao.RemoverAntecedentesPatologicos(SessionController.ConsultaFixo.IdConsultaFixo, idPatologia);
            SessionController.ListaAntecedentesPatologicos = null;
            //SessionController.Abas2 = Global.abaDiarioPessoal;
            return RedirectToAction("Edit", "Consulta");
        }

        // GET
        public ViewResult ListaAntecedentesFamiliares()
        {
            return View(gClinicoInternacao.ObterAntecedentesFamiliares(SessionController.ConsultaFixo.IdConsultaFixo));
        }

        //
        // POST: /MedicamentoPrescrito/Create
        [HttpPost]
        public ActionResult AdicionarAntecedentesFamiliares(AntecedentesFamiliaresModel antecedentesFamiliares)
        {
            if (ModelState.IsValid)
            {
                antecedentesFamiliares.IdConsultaFixo = SessionController.ConsultaVariavel.IdConsultaFixo;
                gClinicoInternacao.InserirAntecedentesFamiliares(antecedentesFamiliares.IdConsultaFixo, antecedentesFamiliares.IdPatologia);
                SessionController.ListaAntecedentesFamiliares = null;
            }
            //SessionController.Abas1 = Global.abaMedPresc;
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult RemoverAntecedentesFamiliares(long idPatologia)
        {
            gClinicoInternacao.RemoverAntecedentesFamiliares(SessionController.ConsultaFixo.IdConsultaFixo, idPatologia);
            SessionController.ListaAntecedentesFamiliares = null;
            //SessionController.Abas2 = Global.abaDiarioPessoal;
            return RedirectToAction("Edit", "Consulta");
        }

        // GET
        public ViewResult ListaClinicoInternacaoAlergias()
        {
            return View(gClinicoInternacao.ObterAlergias(SessionController.ConsultaFixo.IdConsultaFixo));
        }

        //
        // POST: /MedicamentoPrescrito/Create
        [HttpPost]
        public ActionResult AdicionarClinicoInternacaoAlergias(ClinicoInternacaoAlergiasModel clinicoInternacaoAlergia)
        {
            if (ModelState.IsValid)
            {
                gClinicoInternacao.InserirAlergias(SessionController.ConsultaFixo.IdConsultaFixo, clinicoInternacaoAlergia.IdAlergia);
                SessionController.ListaClinicoInternacaoAlergia = null;
            }
            //SessionController.Abas1 = Global.abaMedPresc;
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult RemoverClinicoInternacaoAlergias(int idAlergia)
        {
            gClinicoInternacao.RemoverAlergia(SessionController.ConsultaFixo.IdConsultaFixo, idAlergia);
            SessionController.ListaClinicoInternacaoAlergia = null;
            //SessionController.Abas2 = Global.abaDiarioPessoal;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
