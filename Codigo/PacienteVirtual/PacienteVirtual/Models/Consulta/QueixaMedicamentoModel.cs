using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class QueixaMedicamentoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdQueixaMedicamento { get; set; }

        [Display(Name = "queixa", ResourceType = typeof(Mensagem))]
        public string Queixa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdMedicamento { get; set; }

        [Display(Name = "nome_medicamento", ResourceType = typeof(Mensagem))]
        public string NomeMedicamento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdSuspeitaPRM { get; set; }

        [Display(Name = "classificao_prm", ResourceType = typeof(Mensagem))]
        public string SuspeitaPRM { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "dose", ResourceType = typeof(Mensagem))]
        [StringLength(20)]
        public string Dose { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "desde", ResourceType = typeof(Mensagem))]
        [StringLength(40)]
        public string Desde { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "necessario", ResourceType = typeof(Mensagem))]
        public bool Necessario { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "seguro", ResourceType = typeof(Mensagem))]
        public bool Seguro { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "efetivo", ResourceType = typeof(Mensagem))]
        public bool Efetivo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "cumprimento", ResourceType = typeof(Mensagem))]
        public bool Cumprimento { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdAcaoQueixa1 { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdAcaoQueixa2 { get; set; }

        [Display(Name = "intervencao_1", ResourceType = typeof(Mensagem))]
        public string DescricaoAcaoQueixa1 { get; set; }

        [Display(Name = "intervencao_2", ResourceType = typeof(Mensagem))]
        public string DescricaoAcaoQueixa2 { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "resolvido", ResourceType = typeof(Mensagem))]
        public bool Resolvido { get; set; }

        public string ErroQueixaMed { get; set; }
    }
}