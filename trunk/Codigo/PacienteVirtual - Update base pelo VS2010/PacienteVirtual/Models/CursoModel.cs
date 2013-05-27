using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class CursoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdCurso { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "curso", ResourceType = typeof(Mensagem))]
        public string NomeCurso { get; set; }


        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "instituicao", ResourceType = typeof(Mensagem))]
        public int IdInstituicao { get; set; }

        [Display(Name = "instituicao", ResourceType = typeof(Mensagem))]
        public string NomeInstituicao { get; set; }
    }
} 