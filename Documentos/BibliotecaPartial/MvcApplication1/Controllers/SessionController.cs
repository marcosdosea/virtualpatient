using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using MvcApplication1.Models;

namespace MvcApplication1.Controllers
{
    public class SessionController
    {
        public static IList<AutorModel> GetAutores()
        {
            IList<AutorModel> autores = (IList<AutorModel>)HttpContext.Current.Session["_Autores"];
            if (autores == null)
            {
                autores = new List<AutorModel>();
                autores.Add(new AutorModel() { Codigo = 1, Nome = "Marcos" });
                HttpContext.Current.Session["_Autores"] = autores;
            }
            return autores;
        }

        public static IList<EditoraModel> GetEditoras()
        {
            IList<EditoraModel> editoras = (IList<EditoraModel>)HttpContext.Current.Session["_Editoras"];
            if (editoras == null)
            {
                editoras = new List<EditoraModel>();
                editoras.Add(new EditoraModel() { Codigo = 1, RazaoSocial = "Campus" });
                HttpContext.Current.Session["_Editoras"] = editoras;
            }
            return editoras;
        }

        public static void Update(IList<AutorModel> autores)
        {
            HttpContext.Current.Session["_Autores"] = autores;
        }

        public static void Update(IList<EditoraModel> editoras)
        {
            HttpContext.Current.Session["_Editoras"] = editoras;
        }


    }
}