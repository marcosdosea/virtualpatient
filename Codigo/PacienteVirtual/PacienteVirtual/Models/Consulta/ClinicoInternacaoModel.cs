using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class ClinicoInternacaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "clinica", ResourceType = typeof(Mensagem))]
        public string Clinica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "leito", ResourceType = typeof(Mensagem))]
        public string Leito { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "data_admissao", ResourceType = typeof(Mensagem))]
        [DataType(DataType.Date)]
        public DateTime DataAdmissao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "diagnostico_medico", ResourceType = typeof(Mensagem))]
        public string DiagnosticoMedico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "motivo_internacao", ResourceType = typeof(Mensagem))]
        public string MotivoInternacao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "uso_marca_passo", ResourceType = typeof(Mensagem))]
        public bool UsoMarcaPasso { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "uso_outros", ResourceType = typeof(Mensagem))]
        public bool UsoOutros { get; set; }

        [Display(Name = "uso_outros_descricao", ResourceType = typeof(Mensagem))]
        public string UsoOutrosDescricao { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "uso_nao_aplica", ResourceType = typeof(Mensagem))]
        public bool UsoNaoSeAplica { get; set; }
    }
}