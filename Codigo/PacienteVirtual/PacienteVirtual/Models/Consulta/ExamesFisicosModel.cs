﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models.Consulta
{
    public class ExamesFisicosModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "peso", ResourceType = typeof(Mensagem))]
        public float Peso { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "altura", ResourceType = typeof(Mensagem))]
        public float Altura { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pressao_diastolica", ResourceType = typeof(Mensagem))]
        public float PressaoDiastolica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pressao_sistolica", ResourceType = typeof(Mensagem))]
        public float PressaoSistolica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "glicemia", ResourceType = typeof(Mensagem))]
        public float Glicemia { get; set; }
    }
}