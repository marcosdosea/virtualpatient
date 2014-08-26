﻿using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class DiagnosticoConsultaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDiagnostico { get; set; }

        [Display(Name = "diagnostico", ResourceType = typeof(Mensagem))]
        public string DescricaoDiagnostico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdClasseDiagnostico { get; set; }

        [Display(Name = "descricao_classe_diagnostico", ResourceType = typeof(Mensagem))]
        public string DescricaoClasseDiagnostico { get; set; }

        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdDominioDiagnostico { get; set; }

        [Display(Name = "descricao_dominio_diagnostico", ResourceType = typeof(Mensagem))]
        public string DescricaoDominioDiagnostico { get; set; }

        [Display(Name = "resultado_esperado", ResourceType = typeof(Mensagem))]
        public string ResultadoEsperado { get; set; }
    }
}