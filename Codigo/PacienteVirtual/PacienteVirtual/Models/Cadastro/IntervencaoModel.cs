using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class IntervencaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdIntervencao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "descricao_intervencao", ResourceType = typeof(Mensagem))]
        public string DescricaoIntervencao { get; set; }


        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_grupo_intervencao", ResourceType = typeof(Mensagem))]
        public int IdGrupoIntervencao { get; set; }

        [Display(Name = "nome_grupo_intervencao", ResourceType = typeof(Mensagem))]
        public String DescricaoGrupoIntervencao { get; set; }
    }
}