﻿using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class ClasseDiagnosticoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdClasseDiagnostico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDominioDiagnostico { get; set; }

        [Display(Name = "descricao_dominio_diagnostico", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string DescricaoDominioDiagnostico { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "descricao_classe_diagnostico", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string DescricaoClasseDiagnostico { get; set; }

    }
}