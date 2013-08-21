﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class ParametroClinicoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdParametroClinico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "parametro_clinico", ResourceType = typeof(Mensagem))]
        public String ParametroClinico { get; set; }
    }
}