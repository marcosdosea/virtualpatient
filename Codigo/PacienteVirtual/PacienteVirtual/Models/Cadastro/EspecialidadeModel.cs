using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models.Cadastro
{
    public class EspecialidadeModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdEspecialidade { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "especialidade", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string Especialidade { get; set; }
    }
}