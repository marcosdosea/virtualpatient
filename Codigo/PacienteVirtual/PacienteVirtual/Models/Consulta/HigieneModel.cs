using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class HigieneModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "satisfatoria", ResourceType = typeof(Mensagem))]
        public bool Satisfatoria { get; set; }

        [Display(Name = "higiene_intima", ResourceType = typeof(Mensagem))]
        public bool NecessitaHigieneIntima { get; set; }

        [Display(Name = "banho_leito", ResourceType = typeof(Mensagem))]
        public bool NecessitaBanhoLeito { get; set; }

        [Display(Name = "pediculose", ResourceType = typeof(Mensagem))]
        public bool CabelosPediculose { get; set; }

        [Display(Name = "seborreia", ResourceType = typeof(Mensagem))]
        public bool CabelosSeborreia { get; set; }

        [Display(Name = "alopecia", ResourceType = typeof(Mensagem))]
        public bool CabelosAlopecia { get; set; }

        [Display(Name = "quebradicos", ResourceType = typeof(Mensagem))]
        public bool CabelosQuebradicos { get; set; }

        [Display(Name = "ressecamento", ResourceType = typeof(Mensagem))]
        public bool OralRessecamento { get; set; }

        [Display(Name = "halitose", ResourceType = typeof(Mensagem))]
        public bool OralHalitose { get; set; }

        [Display(Name = "lingua_saburrosa", ResourceType = typeof(Mensagem))]
        public bool OralLinguaSaburrosa { get; set; }

        [Display(Name = "carie", ResourceType = typeof(Mensagem))]
        public bool OralCarie { get; set; }

        [Display(Name = "ulceracao", ResourceType = typeof(Mensagem))]
        public bool OralUlceracao { get; set; }
    }
}