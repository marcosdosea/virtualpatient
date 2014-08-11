using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class DiagnosticoModel
    {
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDiagnostico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "diagnostico", ResourceType = typeof(Mensagem))]
        public string Diagnostico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdClasseDiagnostico { get; set; }

        [Display(Name = "descricao_classe_diagnostico", ResourceType = typeof(Mensagem))]
        public String DescricaoClasseDiagnostico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "risco", ResourceType = typeof(Mensagem))]
        public bool Risco { get; set; }
    }
}