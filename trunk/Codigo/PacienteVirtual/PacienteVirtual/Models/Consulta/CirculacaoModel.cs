using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaEnchimentoCapilar { MenorIgual3 = 0, Maior3 = 1 }

    public class CirculacaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "pa", ResourceType = typeof(Mensagem))]
        public decimal PA { get; set; }

        [Display(Name = "p", ResourceType = typeof(Mensagem))]
        public decimal P { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "cateter_periferico", ResourceType = typeof(Mensagem))]
        public bool CateterPeriferico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "cateter_local", ResourceType = typeof(Mensagem))]
        public string CateterLocal { get; set; }

        [Display(Name = "cateter_data", ResourceType = typeof(Mensagem))]
        public DateTime CateterData { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "cateter_central", ResourceType = typeof(Mensagem))]
        public bool CateterCentral { get; set; }

        [Display(Name = "cateter_central_local", ResourceType = typeof(Mensagem))]
        public string CateterCentralLocal { get; set; }

        [Display(Name = "cateter_central_data", ResourceType = typeof(Mensagem))]
        public DateTime CateterCentralData { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "disseccao_venosa", ResourceType = typeof(Mensagem))]
        public bool DisseccaoVenosa { get; set; }

        [Display(Name = "disseccao_venosa_local", ResourceType = typeof(Mensagem))]
        public string DisseccaoVenosaLocal { get; set; }

        [Display(Name = "dissecacao_venosa_data", ResourceType = typeof(Mensagem))]
        public DateTime DissecacaoVenosaData { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sinais_flogisticos", ResourceType = typeof(Mensagem))]
        public bool SinaisFlogisticos { get; set; }

        [Display(Name = "sinais_flogisticos_quais_local", ResourceType = typeof(Mensagem))]
        public string SinaisFlogisticosQuaisLocal { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "rede_venosa_visivel", ResourceType = typeof(Mensagem))]
        public bool RedeVenosaVisivel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "rede_venosa_pulsos_palpaveis", ResourceType = typeof(Mensagem))]
        public bool RedeVenosaPulsosPalpaveis { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "rede_venosa_sem_acesso", ResourceType = typeof(Mensagem))]
        public bool RedeVenosaSemAcesso { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "flebite", ResourceType = typeof(Mensagem))]
        public bool Flebite { get; set; }

        [Display(Name = "flebite_localizar", ResourceType = typeof(Mensagem))]
        public string FlebiteLocalizar { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "infiltracao", ResourceType = typeof(Mensagem))]
        public bool Infiltracao { get; set; }

        [Display(Name = "infiltracao_localizar", ResourceType = typeof(Mensagem))]
        public string InfiltracaoLocalizar { get; set; }

        [Display(Name = "enchimento_capilar", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaEnchimentoCapilar))]
        public ListaEnchimentoCapilar EnchimentoCapilar { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "varizes", ResourceType = typeof(Mensagem))]
        public bool Varizes { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "edema", ResourceType = typeof(Mensagem))]
        public bool Edema { get; set; }

        [Display(Name = "edema_localizar", ResourceType = typeof(Mensagem))]
        public string EdemaLocalizar { get; set; }

    }
}