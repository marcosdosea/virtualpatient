using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class TurmaPessoaRelatoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "turma_codigo", ResourceType = typeof(Mensagem))]
        public Int32 IdTurma { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pessoa_codigo", ResourceType = typeof(Mensagem))]
        public Int32 IdPessoa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "relato_codigo", ResourceType = typeof(Mensagem))]
        public Int32 IdRelato { get; set; }
    }
}