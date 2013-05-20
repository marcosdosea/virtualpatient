using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class InstituicaoModel
    {
        [Required]
        [Display(Name = "Código: ")]
        public int IdInstituicao { get; set; }

        [Required]
        [Display(Name = "Instituição: ")]
        public string NomeInstituicao { get; set; }

        [Required]
        [Display(Name = "Sigla: ")]
        public string Sigla { get; set; }

    }
}