﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class PercepcaoExpectativasModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "quanto_doenca", ResourceType = typeof(Mensagem))]
        [StringLength(300)]
        public string quantoDoenca { get; set; }

        [Display(Name = "duvidas_questionamentos", ResourceType = typeof(Mensagem))]
        [StringLength(300)]
        public string duvidasQuestionamentos { get; set; }
    }
}