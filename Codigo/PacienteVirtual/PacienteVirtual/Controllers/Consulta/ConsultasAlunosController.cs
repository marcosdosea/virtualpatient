using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers.Consulta
{
    public class ConsultasAlunosController : Controller
    {
        //
        // GET: /ConsultasAlunos/

        public ActionResult Index()
        {
            return View(GerenciadorTurmaPessoaRelato.GetInstance().ObterTodos());
        }

    }
}
