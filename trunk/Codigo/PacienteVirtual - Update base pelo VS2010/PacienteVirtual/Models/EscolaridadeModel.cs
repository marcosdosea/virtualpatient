using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class EscolaridadeModel
    {
        [Required]
        [Display(Name = "Código: ")]
        public int IdEscolaridade { get; set; }

        [Required]
        [Display(Name = "Nível: ")]
        public String Nivel { get; set; }

    }
}