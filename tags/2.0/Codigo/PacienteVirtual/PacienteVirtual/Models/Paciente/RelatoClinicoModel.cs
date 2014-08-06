using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class RelatoClinicoModel
    {
        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdRelato { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo_paciente", ResourceType = typeof(Mensagem))]
        public int IdPaciente { get; set; }


        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_paciente", ResourceType = typeof(Mensagem))]
        public String NomePaciente { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "ordem_cronologica", ResourceType = typeof(Mensagem))]
        public int OrdemCronologica { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "relato_texto", ResourceType = typeof(Mensagem))]
        public String RelatoTextual { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "relato_video", ResourceType = typeof(Mensagem))]
        public string RelatoVideo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nivel_dificuldade", ResourceType = typeof(Mensagem))]
        public int NivelDificuldade { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdAreaAtuacao { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "area_atuacao", ResourceType = typeof(Mensagem))]
        public string AreaAtuacao { get; set; }

    }
}