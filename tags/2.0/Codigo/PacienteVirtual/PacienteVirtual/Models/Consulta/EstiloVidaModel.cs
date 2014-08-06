using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class EstiloVidaModel
    {

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }

        [Display(Name = "tabaco_consumo", ResourceType = typeof(Mensagem))]
        public bool TabacoConsumo { get; set; }

        [Display(Name = "tabaco_uso", ResourceType = typeof(Mensagem))]
        public short TabacoUso { get; set; }

        [Display(Name = "tabaco_parou", ResourceType = typeof(Mensagem))]
        public string TabacoParou { get; set; }

        [Display(Name = "cafe_consumo", ResourceType = typeof(Mensagem))]
        public bool CafeConsumo { get; set; }

        [Display(Name = "cafe_uso", ResourceType = typeof(Mensagem))]
        public short CafeUso { get; set; }

        [Display(Name = "cafe_parou", ResourceType = typeof(Mensagem))]
        public string CafeParou { get; set; }

        [Display(Name = "alcool_consumo", ResourceType = typeof(Mensagem))]
        public bool AlcoolConsumo { get; set; }

        [Display(Name = "alcool_uso", ResourceType = typeof(Mensagem))]
        public short AlcoolUso { get; set; }

        [Display(Name = "alcool_tipo_bebida", ResourceType = typeof(Mensagem))]
        public string AlcoolTipoBebida { get; set; }

        [Display(Name = "alcool_parou", ResourceType = typeof(Mensagem))]
        public string AlcoolParou { get; set; }

    }
}