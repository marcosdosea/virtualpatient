using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class DiagnosticoCaracteristicaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDiagnosticoCaracteristica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDiagnostico { get; set; }

        [Display(Name = "diagnostico", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string Diagnostico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "descricao_caracteristica_diagnostico", ResourceType = typeof(Mensagem))]
        [StringLength(200)]
        public string DescricaoCaracteristicaDiagnostico { get; set; }
    }
}