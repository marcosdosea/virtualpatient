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
            SessionController.Abas1 = Global.abaClinicoInternacao;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            if (ModelState.IsValid)
            {
                gClinicoInternacao.Atualizar(clinicoInternacao);
                SessionController.ClinicoInternacao = clinicoInternacao;
            }
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
            SessionController.Abas1 = Global.abaClinicoInternacao;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            if (ModelState.IsValid)
            {
                patologiasAtuais.IdConsultaFixo = SessionController.ConsultaVariavel.IdConsultaFixo;
                gClinicoInternacao.InserirPatologiasAtuais(patologiasAtuais.IdConsultaFixo, patologiasAtuais.IdPatologia);
                SessionController.ListaPatologiasAtuais = null;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult RemoverPatologiasAtuais(long idPatologia)
        {
            SessionController.Abas1 = Global.abaClinicoInternacao;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            gClinicoInternacao.RemoverPatologiasAtuais(SessionController.ConsultaFixo.IdConsultaFixo, idPatologia);
            SessionController.ListaPatologiasAtuais = null;
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
            SessionController.Abas1 = Global.abaClinicoInternacao;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            if (ModelState.IsValid)
            {
                antecedentesPatologicos.IdConsultaFixo = SessionController.ConsultaVariavel.IdConsultaFixo;
                gClinicoInternacao.InserirAntecedentesPatologicos(antecedentesPatologicos.IdConsultaFixo, antecedentesPatologicos.IdPatologia);
                SessionController.ListaAntecedentesPatologicos = null;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult RemoverAntecedentesPatologicos(long idPatologia)
        {
            SessionController.Abas1 = Global.abaClinicoInternacao;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            gClinicoInternacao.RemoverAntecedentesPatologicos(SessionController.ConsultaFixo.IdConsultaFixo, idPatologia);
            SessionController.ListaAntecedentesPatologicos = null;
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
            SessionController.Abas1 = Global.abaClinicoInternacao;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            if (ModelState.IsValid)
            {
                antecedentesFamiliares.IdConsultaFixo = SessionController.ConsultaVariavel.IdConsultaFixo;
                gClinicoInternacao.InserirAntecedentesFamiliares(antecedentesFamiliares.IdConsultaFixo, antecedentesFamiliares.IdPatologia);
                SessionController.ListaAntecedentesFamiliares = null;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult RemoverAntecedentesFamiliares(long idPatologia)
        {

            SessionController.Abas1 = Global.abaClinicoInternacao;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            gClinicoInternacao.RemoverAntecedentesFamiliares(SessionController.ConsultaFixo.IdConsultaFixo, idPatologia);
            SessionController.ListaAntecedentesFamiliares = null;
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
            SessionController.Abas1 = Global.abaClinicoInternacao;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            if (ModelState.IsValid)
            {
                gClinicoInternacao.InserirAlergias(SessionController.ConsultaFixo.IdConsultaFixo, clinicoInternacaoAlergia.IdAlergia);
                SessionController.ListaClinicoInternacaoAlergia = null;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult RemoverClinicoInternacaoAlergias(int idAlergia)
        {
            SessionController.Abas1 = Global.abaClinicoInternacao;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            gClinicoInternacao.RemoverAlergia(SessionController.ConsultaFixo.IdConsultaFixo, idAlergia);
            SessionController.ListaClinicoInternacaoAlergia = null;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
