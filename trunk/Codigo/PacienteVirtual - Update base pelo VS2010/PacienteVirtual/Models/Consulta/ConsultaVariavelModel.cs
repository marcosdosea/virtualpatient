using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class ConsultaVariavelModel
    {
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public int IdTurma { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public int IdPessoa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public int IdRelato { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public int IdRazaoEncontro { get; set; }

        public DateTime DataPreenchimento { get; set; }

        public string Lembretes { get; set; }

        public string ComentariosTutor { get; set; }

    }
}