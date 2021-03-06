﻿using System.ComponentModel.DataAnnotations;
using Resources;
using System;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class ExperienciaMedicamentosModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "espera_tratamento_resposta_codigo", ResourceType = typeof(Mensagem))]
        public int IdRespostaEsperaTratamento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "preocupacoes_resposta_codigo", ResourceType = typeof(Mensagem))]
        public int IdRespostaPreocupacoes { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "grau_entendimento_reposta_codigo", ResourceType = typeof(Mensagem))]
        public int IdRespostaGrauEntendimento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "cultural_resposta_codigo", ResourceType = typeof(Mensagem))]
        public int IdRespostaCultural { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "comportamento_resposta_codigo", ResourceType = typeof(Mensagem))]
        public int IdRespostaComportamento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "incorporado_plano_resposta_codigo", ResourceType = typeof(Mensagem))]
        public int IdRespostaIncorporadoPlano { get; set; }


        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "espera_tratamento_atencao", ResourceType = typeof(Mensagem))]
        public bool AtencaoEsperaTratamento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "preocupacoes_atencao", ResourceType = typeof(Mensagem))]
        public bool AtencaoPreocupacoes { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "grau_entendimento_atencao", ResourceType = typeof(Mensagem))]
        public bool AtencaoGrauEntendimento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "cultural_atencao", ResourceType = typeof(Mensagem))]
        public bool AtencaoCultural { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "comportamento_atencao", ResourceType = typeof(Mensagem))]
        public bool AtencaoComportamento { get; set; }

    }
}