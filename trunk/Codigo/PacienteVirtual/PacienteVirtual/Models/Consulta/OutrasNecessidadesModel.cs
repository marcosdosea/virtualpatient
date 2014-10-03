using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaGrauDependencia { Independente = 0, ParcialmenteDependente = 1, DependentePara = 2 }

    public class OutrasNecessidadesModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "grau_dependencia", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaGrauDependencia))]
        public ListaGrauDependencia GrauDependencia { get; set; }

        [Display(Name = "descricao_grau_dependencia", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string DescricaoGrauDependencia { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "estilista", ResourceType = typeof(Mensagem))]
        public bool Estilista { get; set; }

        [Display(Name = "descricao_estilista", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string DescricaoEstilista { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tabagista", ResourceType = typeof(Mensagem))]
        public bool Tabagista { get; set; }

        [Display(Name = "descricao_tabagista", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string DescricaoTabagista { get; set; }

        [Display(Name = "descrever_tipo_tempo_qtde", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string DescreverTipoTempoQtde { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "uso_drogas_ilicitas", ResourceType = typeof(Mensagem))]
        public bool UsoDrogasIlicitas { get; set; }

        [Display(Name = "tipo_drogas", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string TipoDrogas { get; set; }

        [Display(Name = "frequencia_drogas", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string FrequenciaDrogas { get; set; }

        [Display(Name = "tempo_drogas", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string TempoDrogas { get; set; }

        [Display(Name = "quantidade_drogas", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string QuantidadeDrogas { get; set; }

    }
}