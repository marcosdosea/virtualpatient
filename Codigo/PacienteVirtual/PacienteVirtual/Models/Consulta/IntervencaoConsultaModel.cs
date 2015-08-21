using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class IntervencaoConsultaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdIntervencao { get; set; }

        [Display(Name = "intervencao", ResourceType = typeof(Mensagem))]
        public string DescricaoIntervencao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_grupo_intervencao", ResourceType = typeof(Mensagem))]
        public int IdGrupoIntervencao { get; set; }

        [Display(Name = "descricao_intervencao", ResourceType = typeof(Mensagem))]
        public String DescricaoGrupoIntervencao { get; set; }

        [Display(Name = "paciente", ResourceType = typeof(Mensagem))]
        public bool Paciente { get; set; }

        [Display(Name = "outro", ResourceType = typeof(Mensagem))]
        public bool Outro { get; set; }

        [Display(Name = "justificativa", ResourceType = typeof(Mensagem))]
        [StringLength(500)]
        public string Justificativa { get; set; }

        public string ErroIntervencao { get; set; }
    }
}