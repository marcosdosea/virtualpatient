using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class HistoricoModel
    {
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdHistorico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pessoa_codigo", ResourceType = typeof(Mensagem))]
        public int IdPessoa { get; set; }


        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "turma_codigo", ResourceType = typeof(Mensagem))]
        public int IdTurma { get; set; }


        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "paciente_codigo", ResourceType = typeof(Mensagem))]
        public int IdPaciente { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tutor_codigo", ResourceType = typeof(Mensagem))]
        public int IdTutor { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "relato_codigo", ResourceType = typeof(Mensagem))]
        public int IdRelato { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "data_envio", ResourceType = typeof(Mensagem))]
        [DataType(DataType.Date)]
        public DateTime DataEnvio { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "data_resposta", ResourceType = typeof(Mensagem))]
        [DataType(DataType.Date)]
        public DateTime DataResposta { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "estado", ResourceType = typeof(Mensagem))]
        public int Estado { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tutor_comentarios", ResourceType = typeof(Mensagem))]
        public string ComentarioTutor { get; set; }


    }
}