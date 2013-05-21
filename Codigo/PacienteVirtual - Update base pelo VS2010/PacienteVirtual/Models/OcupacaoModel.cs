using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class OcupacaoModel
    {
        [Required]
        [Display(Name = "Código: ")]
        public int IdOcupacao { get; set; }

        [Required]
        [Display(Name = "Descrição: ")]
        public String Descricao { get; set; }
    }
}