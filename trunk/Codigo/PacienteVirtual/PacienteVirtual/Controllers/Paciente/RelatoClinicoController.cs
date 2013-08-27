using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class RelatoClinicoController : Controller
    {
        GerenciadorRelatoClinico gRelato = GerenciadorRelatoClinico.GetInstance();
        GerenciadorPaciente gPaciente = GerenciadorPaciente.GetInstance();


        // GET: /RelatoClinico/
        public ViewResult Index()
        {
            ViewBag.codigo = -1;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            return View(gRelato.ObterTodos());
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = -1)
        {

            ViewBag.codigo = IdPaciente;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            if (IdPaciente != -1)
            {
                    return View(gRelato.ObterRelatos(IdPaciente).ToList());
            } 
            if (IdPaciente == -1)
            {
                return View(gRelato.ObterTodos());
            }
            return View();
        }

        public ViewResult Listar(int id)
        {

            return View(gRelato.ObterRelatos(id));
        }

        //
        // GET: /RelatoClinico/Details/5
        public ViewResult Details(int id)
        {
            return View(gRelato.Obter(id));
        }

        public FileContentResult GetImage(int id)
        {
            if (id != -1)
            {
                var imageData = GerenciadorPaciente.GetInstance().Obter(id).Foto;
                if (imageData != null)
                    return File(imageData, "image/jpg");
            }
            byte[] byt = System.IO.File.ReadAllBytes(Server.MapPath("~/Content/themes/pv/img/default-avatar.png"));
            return File(byt, "image/jpg");
        }
        // GET: /RelatoClinico/Create

        public ActionResult Create()
        {
            ViewBag.fotoId = -1;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            return View();
        }

        //
        // POST: /RelatoClinico/Create
        [HttpPost]
        public ActionResult Create(RelatoClinicoModel relatoModel)
        {
            if (ModelState.IsValid)
            {
                bool salvar = true;
                foreach (var ordem in gRelato.ObterRelatos(relatoModel.IdPaciente))
                {
                    if (ordem.OrdemCronologica == relatoModel.OrdemCronologica)
                    {
                         salvar = false;
                         break;
                    }
                };
                if(salvar) {
                relatoModel.IdRelato = gRelato.Inserir(relatoModel);
                ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente",relatoModel.IdPaciente);
                return View("Index", gRelato.ObterRelatos(relatoModel.IdPaciente));
                }
            }

            if (relatoModel.IdPaciente > 0)
            {
                //ViewBag.teste = "passou pelo -1" + relatoModel.IdPaciente;
                ViewBag.fotoId = relatoModel.IdPaciente;
                ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");

                return View(relatoModel);
            }
            ViewBag.fotoId = -1;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            return View(relatoModel);
        }

        //
        // GET: /RelatoClinico/Edit/5
        public ActionResult Edit(int id)
        {
            RelatoClinicoModel relatoModel = gRelato.Obter(id);
            ViewBag.fotoId = relatoModel.IdPaciente;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
            return View(relatoModel);
        }

        //
        // POST: /RelatoClinico/Edit/5

        [HttpPost]
        public ActionResult Edit(RelatoClinicoModel relatoModel)
        {
            if (ModelState.IsValid)
            {
                bool salvar = true;
                foreach (var ordem in gRelato.ObterRelatos(relatoModel.IdPaciente))
                {
                    if (ordem.OrdemCronologica == relatoModel.OrdemCronologica)
                    {
                         salvar = false;
                         break;
                    }
                };
                if (salvar)
                {
                    gRelato.Atualizar(relatoModel);
                    return RedirectToAction("Index");
                }
            }
            ViewBag.fotoId = relatoModel.IdPaciente;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
            return View(relatoModel);
        }

        //
        // GET: /RelatoClinico/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gRelato.Obter(id));
        }

        //
        // POST: /RelatoClinico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gRelato.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}