using System;
using System.ComponentModel.DataAnnotations;
using Resources;
using PacienteVirtual.Validator;

namespace PacienteVirtual.Models
{
    public class DemograficosAntropometricosModel
    {

        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome", ResourceType = typeof(Mensagem))]
        //[GabaritoDemograficoAntropometrico]
        public string Nome { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [RegularExpression("M|F", ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_MouF")]
        [Display(Name = "genero", ResourceType = typeof(Mensagem))]
        //[GabaritoDemograficoAntropometrico]
        public string Genero { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "data_nascimento", ResourceType = typeof(Mensagem))]
        [DataType(DataType.Date)]
        public DateTime DataNascimento { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "medicos_atendem", ResourceType = typeof(Mensagem))]
        public string MedicosAtendem { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "moradia_familia", ResourceType = typeof(Mensagem))]
        public string MoradiaFamilia { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "onde_adquire_medicamentos", ResourceType = typeof(Mensagem))]
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
        public String RG { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "procedencia", ResourceType = typeof(Mensagem))]
        public String Procedencia { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "endereco", ResourceType = typeof(Mensagem))]
        public String Endereco { get; set; }
    }

}