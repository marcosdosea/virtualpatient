using System.ComponentModel.DataAnnotations;
using Resources;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Data.Entity;

namespace PacienteVirtual.Models
{
    public enum ListaRitmo { Regular = 0, Irregular = 1 }

    public enum ListaSimetriaToracica { Simetrico = 0, AssimetricoUnilateral = 1, AssimetricoBilateral = 2}

    public class OxigenacaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "frequencia_respiratoria", ResourceType = typeof(Mensagem))]
        public int FequenciaResporatoria { get; set; }

        [Display(Name = "ritmo", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaRitmo))]
        public ListaRitmo Ritmo { get; set; } 

        [Display(Name = "dispineia", ResourceType = typeof(Mensagem))]
        public bool Dispineia { get; set; }

        [Display(Name = "taquipneia", ResourceType = typeof(Mensagem))]
        public bool Taquipneia { get; set; }

        [Display(Name = "bradipneia", ResourceType = typeof(Mensagem))]
        public bool Bradipneia { get; set; }

        [Display(Name = "kussmaul", ResourceType = typeof(Mensagem))]
        public bool Kussmaul { get; set; }

        [Display(Name = "cheyneStokes", ResourceType = typeof(Mensagem))]
        public bool CheyneStokes { get; set; }

        [Display(Name = "epistaxe", ResourceType = typeof(Mensagem))]
        public bool Epistaxe { get; set; }

        [Display(Name = "obstrucaoNasal", ResourceType = typeof(Mensagem))]
        public bool ObstrucaoNasal { get; set; }

        [Display(Name = "coriza", ResourceType = typeof(Mensagem))]
        public bool Coriza { get; set; }

        [Display(Name = "desvioDeSepto", ResourceType = typeof(Mensagem))]
        public bool DesvioDeSepto { get; set; }

        [Display(Name = "palidez", ResourceType = typeof(Mensagem))]
        public bool Palidez { get; set; }

        [Display(Name = "labioCianotico", ResourceType = typeof(Mensagem))]
        public bool LabioCianotico { get; set; }

        [Display(Name = "simetriaToracica", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaSimetriaToracica))]
        public ListaSimetriaToracica SimetriaToracica { get; set; } //{ Simetrico = "Simetrico", AssimetricoUnilateral = "Assimetrico Unilateral", AssimetricoBilateral = "Assimetrico Bilateral" }

        [Display(Name = "barril", ResourceType = typeof(Mensagem))]
        public bool Barril { get; set; }

        [Display(Name = "peitoDePombo", ResourceType = typeof(Mensagem))]
        public bool PeitoDePombo { get; set; }

        [Display(Name = "funil", ResourceType = typeof(Mensagem))]
        public bool Funil { get; set; }

        [Display(Name = "lordose", ResourceType = typeof(Mensagem))]
        public bool Lordose { get; set; }

        [Display(Name = "cifose", ResourceType = typeof(Mensagem))]
        public bool Cifose { get; set; }

        [Display(Name = "escoliose", ResourceType = typeof(Mensagem))]
        public bool Escoliose { get; set; }

        [Display(Name = "tiragemIntercostal", ResourceType = typeof(Mensagem))]
        public bool TiragemIntercostal { get; set; }
    }
}