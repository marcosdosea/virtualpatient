using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class PessoaModel
    {
        [Required]
        [Display(Name = "Código: ")]
        public int IdPessoa { get; set; }

        [Required]
        [Display(Name = "Nome: ")]
        public String Nome { get; set; }
    }
}