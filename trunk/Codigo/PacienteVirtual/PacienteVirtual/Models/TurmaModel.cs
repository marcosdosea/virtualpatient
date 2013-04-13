using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class TurmaModel
    {
        [Required]
        [Display(Name = "IdTurma: ")]
        public int IdTurma { get; set; }

        [Required]
        [Display(Name = "Código: ")]
        public string Codigo { get; set; }

        [Required]
        [Display(Name = "Período: ")]
        public string Periodo { get; set; }

        [Required]
        [Display(Name = "IdDsiciplina: ")]
        public int IdDisciplina { get; set; }

        [Required]
        [Display(Name = "IdInstituicao: ")]
        public int IdInstituicao { get; set; }

        [Required]
        [Display(Name = "Nome da Instituição: ")]
        public string NomeInstituicao { get; set; }

        [Required]
        [Display(Name = "Nome da Disciplina: ")]
        public string NomeDisciplina { get; set; }


    }
}