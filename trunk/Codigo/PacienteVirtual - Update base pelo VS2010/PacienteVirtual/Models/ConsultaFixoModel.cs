using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using PacienteVirtual.App_GlobalResources;



namespace PacienteVirtual.Models
{
    public class ConsultaFixoModel
    {

        [Display(Name = "Código")]
        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "turma_codigo", ResourceType = typeof(Mensagem))]
        public int IdTurma { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pessoa_codigo", ResourceType = typeof(Mensagem))]
        public int IdPessoa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "estado_preenchimento", ResourceType = typeof(Mensagem))]
        public string EstadoPreenchimento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "eh_gabarito", ResourceType = typeof(Mensagem))] 
        public bool EhGabarito { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "data_atualizacao", ResourceType = typeof(Mensagem))] 
        public DateTime DataAtualizacao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tutor_comentarios", ResourceType = typeof(Mensagem))] 
        public string ComentariosTutor { get; set; }

        public string PessoaNome { get; set; }


    }
}