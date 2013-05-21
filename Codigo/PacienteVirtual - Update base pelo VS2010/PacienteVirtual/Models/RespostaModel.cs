using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class RespostaModel
    {
        [Required]
        [Display(Name = "Código da resposta: ")]
        public int IdResposta { get; set; }

        [Required]
        [Display(Name = "Resposta: ")]
        public String Resposta { get; set; }

        [Required]
        [Display(Name = "Código da pergunta: ")]
        public int IdPergunta { get; set; }

        [Display(Name = "Pergunta: ")]
        public String Pergunta { get; set; }

    }
}