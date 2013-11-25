using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class MedicamentoNaoPrescritoModel
    {

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "medicamento_codigo", ResourceType = typeof(Mensagem))]
        public Int32 IdMedicamento { get; set; }

        [Display(Name = "medicamento", ResourceType = typeof(Mensagem))]
        public string MedicamentoNome { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "fitoterapico", ResourceType = typeof(Mensagem))]
        public bool Fitoterapico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "dosagem", ResourceType = typeof(Mensagem))]
        public string Dosagem { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "posologia", ResourceType = typeof(Mensagem))]
        public string Posologia { get; set; }

    }
}