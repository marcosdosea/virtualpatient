using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models.Consulta
{
    public class IntervencaoConsultaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdIntervencao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "intervencao", ResourceType = typeof(Mensagem))]
        public string DescricaoIntervencao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_grupo_intervencao", ResourceType = typeof(Mensagem))]
        public int IdGrupoIntervencao { get; set; }

        [Display(Name = "grupo_intervencao", ResourceType = typeof(Mensagem))]
        public string DescricaoGrupoIntervencao { get; set; }

        [Display(Name = "paciente", ResourceType = typeof(Mensagem))]
        public bool Paciente { get; set; }

        [Display(Name = "outro", ResourceType = typeof(Mensagem))]
        public bool Outro { get; set; }

        [Display(Name = "justificativa", ResourceType = typeof(Mensagem))]
        public string Justificativa { get; set; }
    }
}