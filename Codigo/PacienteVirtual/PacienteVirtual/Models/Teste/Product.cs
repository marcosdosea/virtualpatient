using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class Product
    {
        public int SubCategoryId { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
    }
}