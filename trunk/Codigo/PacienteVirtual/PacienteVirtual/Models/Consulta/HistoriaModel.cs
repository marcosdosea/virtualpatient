using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class HistoriaModel
    {

        [Display(Name = "codigo", ResourceType = typeof(Mensagem))] 
        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "historia_medica_pregressa", ResourceType = typeof(Mensagem))]
        public string HistoriaMedicaPregressa { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "historia_familiar", ResourceType = typeof(Mensagem))] 
        public string HistoriaFamiliar { get; set; }
    }
}