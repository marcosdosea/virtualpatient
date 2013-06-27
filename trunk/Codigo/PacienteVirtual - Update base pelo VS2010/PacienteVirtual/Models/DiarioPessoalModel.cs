﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class DiarioPessoalModel
    {

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_dados_fixos_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "medicamento_codigo", ResourceType = typeof(Mensagem))]
        public Int32 IdMedicamento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "periodo", ResourceType = typeof(Mensagem))]
        public string Periodo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "horario", ResourceType = typeof(Mensagem))]
        public string Horario { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "quantidade", ResourceType = typeof(Mensagem))]
        public string Quantidade { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tipo_bebida", ResourceType = typeof(Mensagem))]
        public string TipoBebida { get; set; }
    }
}