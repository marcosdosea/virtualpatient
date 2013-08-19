using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplication1.Models;

namespace MvcApplication1.Controllers
{
    public class AutorController : Controller
    {
        //
        // GET: /Autor/

        public ActionResult Index()
        {
            return View();
        }

        
        public ActionResult ListAutor()
        {
            return PartialView(SessionController.GetAutores());
        }

        //
        // GET: /Autor/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Autor/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Autor/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Autor/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Autor/Edit/5

        [HttpPost]
        public ActionResult Edit(AutorModel autor)
        {
            // gravar autor no banco de dados
            var autores = SessionController.GetAutores();
            autores.Add(autor);
            SessionController.Update(autores);
            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Autor/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Autor/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
