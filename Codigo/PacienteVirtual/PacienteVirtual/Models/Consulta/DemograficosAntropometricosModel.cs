using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class DemograficosAntropometricosModel
    {

        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string Nome { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [RegularExpression("M|F", ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_MouF")]
        [Display(Name = "genero", ResourceType = typeof(Mensagem))]
        [StringLength(1)]
        public string Genero { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "data_nascimento", ResourceType = typeof(Mensagem))]
        [DataType(DataType.Date)]
        public DateTime DataNascimento { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "medicos_atendem", ResourceType = typeof(Mensagem))]
        [StringLength(255)]
        public string MedicosAtendem { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "moradia_familia", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string MoradiaFamilia { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "onde_adquire_medicamentos", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string OndeAdquireMedicamentos { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "escolaridade", ResourceType = typeof(Mensagem))]
        public int IdEscolaridade { get; set; }

        [Display(Name = "escolaridade", ResourceType = typeof(Mensagem))]
        public string EscolaridadeNivel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "ocupacao", ResourceType = typeof(Mensagem))]
        public int IdOcupacao { get; set; }

        [Display(Name = "ocupacao", ResourceType = typeof(Mensagem))]
        public string OcupacaoDescricao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "plano_saude", ResourceType = typeof(Mensagem))]
        public int IdPlanoSaude { get; set; }

        [Display(Name = "plano_saude", ResourceType = typeof(Mensagem))]
        public string PlanoSaudeNome { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "estado_civil", ResourceType = typeof(Mensagem))]
        public int IdEstadoCivil { get; set; }

        [Display(Name = "estado_civil", ResourceType = typeof(Mensagem))]
        public string EstadoCivil { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "naturalidade", ResourceType = typeof(Mensagem))]
        public int IdNaturalidade { get; set; }

        [Display(Name = "naturalidade", ResourceType = typeof(Mensagem))]
        public string Naturalidade { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "religiao", ResourceType = typeof(Mensagem))]
        public int IdReligiao { get; set; }

        [Display(Name = "religiao", ResourceType = typeof(Mensagem))]
        public string Religiao { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "rg", ResourceType = typeof(Mensagem))]
        [StringLength(20)]
        public String RG { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "procedencia", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public String Procedencia { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "endereco", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public String Endereco { get; set; }
    }

}