using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class DemograficosAntropometricosModel
    {

        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome", ResourceType = typeof(Mensagem))]
        public string Nome { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [RegularExpression("M|F", ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_MouF")]
        [Display(Name = "genero", ResourceType = typeof(Mensagem))]
        public string Genero { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "data_nascimento", ResourceType = typeof(Mensagem))]
        [DataType(DataType.Date)]
        public DateTime DataNascimento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "medicos_atendem", ResourceType = typeof(Mensagem))]
        public string MedicosAtendem { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "moradia_familia", ResourceType = typeof(Mensagem))]
        public string MoradiaFamilia { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
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

    }



}