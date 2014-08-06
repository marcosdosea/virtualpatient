using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
    public class HomeModel
    {
        public IList<AutorModel> Autores { get; set; }
        public IList<EditoraModel> Editoras { get; set; }
        public AutorModel Autor { get; set; }
        public EditoraModel Editora { get; set; }
    }
}