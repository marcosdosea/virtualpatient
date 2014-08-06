using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class ExamesFisicosModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "peso", ResourceType = typeof(Mensagem))]
        public float Peso { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "altura", ResourceType = typeof(Mensagem))]
        public float Altura { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pressao_diastolica", ResourceType = typeof(Mensagem))]
        public float PressaoDiastolica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pressao_sistolica", ResourceType = typeof(Mensagem))]
        public float PressaoSistolica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "glicemia", ResourceType = typeof(Mensagem))]
        public float Glicemia { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "indice_massa_corporea", ResourceType = typeof(Mensagem))]
        public float IndiceMassaCorporea { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "circunferencia_abdominal", ResourceType = typeof(Mensagem))]
        public float CircunferenciaAbdominal { get; set; }
    }
}