using System.ComponentModel.DataAnnotations;
using Resources;
using System;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class DiagnosticoCaracteristicaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDiagnosticoCaracteristica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDiagnostico { get; set; }

        [Display(Name = "diagnostico", ResourceType = typeof(Mensagem))]
        [StringLength(200)]
        public string DescricaoDiagnostico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "descricao_caracteristica_diagnostico", ResourceType = typeof(Mensagem))]
        [StringLength(200)]
        public string DescricaoCaracteristicaDiagnostico { get; set; }
    }
}