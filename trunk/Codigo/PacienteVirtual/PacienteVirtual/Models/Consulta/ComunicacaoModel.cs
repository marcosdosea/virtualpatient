using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaTranstornosExpressaoVerbal 
    {
        NaoSeAplica = 0, Disfasia = 1, Disartria = 2, Dislalia = 3, Afonia = 4, ComunicaPorGesto = 5, ComunicaPorEscrita = 6
    }
    public enum ListaTipoComportamento { Calmo = 0, Ansioso = 1, Retraido = 2, ComMedo = 3, Agressico = 4 }
    
    public class ComunicacaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "verbaliza", ResourceType = typeof(Mensagem))]
        public bool Verbaliza { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "deprimido", ResourceType = typeof(Mensagem))]
        public bool Deprimido { get; set; }

        [Display(Name = "alteracoes_expressao_verbal", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaTranstornosExpressaoVerbal))]
        public ListaTranstornosExpressaoVerbal TranstornosExpressaoVerbal { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "discurso_incoerente", ResourceType = typeof(Mensagem))]
        public bool DiscursoIncoerente { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tv", ResourceType = typeof(Mensagem))]
        public bool Tv { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "radio", ResourceType = typeof(Mensagem))]
        public bool Radio { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "celular", ResourceType = typeof(Mensagem))]
        public bool Celular { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "leituras", ResourceType = typeof(Mensagem))]
        public bool Leituras { get; set; }

        [Display(Name = "especificar", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string Especificar { get; set; }

        [Display(Name = "tipo_comportamento", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaTipoComportamento))]
        public ListaTipoComportamento TipoComportamento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "interage_com_equipe_saude", ResourceType = typeof(Mensagem))]
        public bool InterageComEquipeSaude { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "recebe_visitas", ResourceType = typeof(Mensagem))]
        public bool RecebeVisitas { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "participa_atividades", ResourceType = typeof(Mensagem))]
        public bool ParticipaAtividades { get; set; }
    }
}