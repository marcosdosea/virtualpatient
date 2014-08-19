using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class DiagnosticoConsultaFatorModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDiagnostico { get; set; }

        [Display(Name = "diagnostico", ResourceType = typeof(Mensagem))]
        public string Diagnostico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDiagnosticoFator { get; set; }

        [Display(Name = "descricao_fator_diagnostico", ResourceType = typeof(Mensagem))]
        public string DescricaoFatorDiagnostico { get; set; }
    }
}