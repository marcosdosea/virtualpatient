using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class CursoModel
    {
        [Required]
        [Display(Name = "Código: ")]
        public int IdCurso { get; set; }

        [Required]
        [Display(Name = "Curso: ")]
        public string NomeCurso { get; set; }


        [Required]
        [Display(Name = "Código da Instituição: ")]
        public int IdInstituicao { get; set; }

        [Display(Name = "Nome da Instituição: ")]
        public string NomeInstituicao { get; set; }
    }
} 