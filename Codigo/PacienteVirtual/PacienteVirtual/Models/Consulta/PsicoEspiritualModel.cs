using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class PsicoEspiritualModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "crenca_religiosa", ResourceType = typeof(Mensagem))]
        public string CrencaReligiosa { get; set; }

        [Display(Name = "busca_assistencia_espiritual", ResourceType = typeof(Mensagem))]
        public bool BuscaAssistenciaEspiritual { get; set; }

        [Display(Name = "especifica_assistencia_espiritual", ResourceType = typeof(Mensagem))]
        public string EspecificaAssistenciaEspiritual { get; set; }

        [Display(Name = "disturbios_sono", ResourceType = typeof(Mensagem))]
        public bool DisturbiosSono { get; set; }

        [Display(Name = "ansiedade", ResourceType = typeof(Mensagem))]
        public bool Ansiedade { get; set; }

        [Display(Name = "baixo_auto_estima", ResourceType = typeof(Mensagem))]
        public bool BaixoAutoEstima { get; set; }

        [Display(Name = "estresse", ResourceType = typeof(Mensagem))]
        public bool Estresse { get; set; }

        [Display(Name = "preocupacao_morte", ResourceType = typeof(Mensagem))]
        public bool PreocupacaoMorte { get; set; }

        [Display(Name = "choro", ResourceType = typeof(Mensagem))]
        public bool Choro { get; set; }

        [Display(Name = "raiva", ResourceType = typeof(Mensagem))]
        public bool Raiva { get; set; }

        [Display(Name = "negacao", ResourceType = typeof(Mensagem))]
        public bool Negacao { get; set; }

        [Display(Name = "apatico", ResourceType = typeof(Mensagem))]
        public bool Apatico { get; set; }

        [Display(Name = "humor_deprimido", ResourceType = typeof(Mensagem))]
        public bool HumorDeprimido { get; set; }
    }
}