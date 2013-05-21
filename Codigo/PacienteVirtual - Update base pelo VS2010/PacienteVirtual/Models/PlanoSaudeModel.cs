using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class PlanoSaudeModel
    {
        [Required]
        [Display(Name = "Código: ")]
        public int IdPlanoSaude { get; set; }

        [Required]
        [Display(Name = "Nome do Plano: ")]
        public String Nome { get; set; }
    }
}