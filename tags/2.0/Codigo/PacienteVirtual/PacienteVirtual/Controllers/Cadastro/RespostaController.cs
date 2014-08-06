using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class RespostaController : Controller
    {
        GerenciadorResposta gResposta = GerenciadorResposta.GetInstance();
        GerenciadorPergunta gPergunta = GerenciadorPergunta.GetInstance();

        //
        // GET: /Re/sposta
        public ViewResult Index()
        {
            return View(gResposta.ObterTodos());
        }

        //
        // GET: /Resposta/Details/5
        public ViewResult Details(int id)
        {
            return View(gResposta.Obter(id));
        }

        //
        // GET: /Respota/Create

        public ActionResult Create()
        {
            ViewBag.IdPergunta = new SelectList(gPergunta.ObterTodos().ToList(), "IdPergunta", "Pergunta");
            return View();
        }

        //
        // POST: /Resposta/Create
        [HttpPost]
        public ActionResult Create(RespostaModel respostaModel)
        {
            if (ModelState.IsValid)
            {
                respostaModel.IdResposta = gResposta.Inserir(respostaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdPergunta = new SelectList(gPergunta.ObterTodos().ToList(), "IdPergunta", "Pergunta", respostaModel.IdPergunta);
            return View(respostaModel);
        }

        //
        // GET: /Resposta/Edit/5
        public ActionResult Edit(int id)
        {
            RespostaModel respostaModel = gResposta.Obter(id);
            ViewBag.IdPergunta = new SelectList(gPergunta.ObterTodos().ToList(), "IdPergunta", "Pergunta", respostaModel.IdPergunta);
            return View(respostaModel);
        }

        //
        // POST: /Resposta/Edit/5

        [HttpPost]
        public ActionResult Edit(RespostaModel respostaModel)
        {
            if (ModelState.IsValid)
            {
                gResposta.Atualizar(respostaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdPergunta = new SelectList(gPergunta.ObterTodos().ToList(), "IdPergunta", "Pergunta", respostaModel.IdPergunta);
            return View(respostaModel);
        }

        //
        // GET: /Resposta/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gResposta.Obter(id));
        }

        //
        // POST: /Resposta/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gResposta.Remover(id);
            return RedirectToAction("Index");

        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}