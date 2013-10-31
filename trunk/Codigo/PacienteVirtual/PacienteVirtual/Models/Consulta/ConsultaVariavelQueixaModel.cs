﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class ConsultaVariavelQueixaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdQueixa { get; set; }

        [Display(Name = "descricao_queixa", ResourceType = typeof(Mensagem))]
        public string DescricaoQueixa { get; set; }

        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdSistema { get; set; }

        [Display(Name = "nome_sistema", ResourceType = typeof(Mensagem))]
        public string NomeSistema { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tipo", ResourceType = typeof(Mensagem))]
        public String Tipo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "desde", ResourceType = typeof(Mensagem))]
        public string Desde { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "prioridade", ResourceType = typeof(Mensagem))]
        public int Prioridade { get; set; }
     }
}