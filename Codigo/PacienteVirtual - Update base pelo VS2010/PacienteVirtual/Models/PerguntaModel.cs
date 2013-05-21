using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class PerguntaModel
    {
        [Required]
        [Display(Name = "Código: ")]
        public int IdPergunta { get; set; }

        [Required]
        [Display(Name = "Código: ")]
        public String Pergunta { get; set; }

    }
}