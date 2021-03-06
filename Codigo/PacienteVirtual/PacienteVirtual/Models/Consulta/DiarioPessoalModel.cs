﻿using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class DiarioPessoalModel
    {

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_dados_fixos_codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "medicamento_codigo", ResourceType = typeof(Mensagem))]
        public int IdMedicamento { get; set; }

        [Display(Name = "medicamento", ResourceType = typeof(Mensagem))]
        public String Medicamento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "periodo", ResourceType = typeof(Mensagem))]
        [StringLength(1)]
        public string Periodo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "horario", ResourceType = typeof(Mensagem))]
        [StringLength(20)]
        public string Horario { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "quantidade", ResourceType = typeof(Mensagem))]
        [StringLength(20)]
        public string Quantidade { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tipo_bebida", ResourceType = typeof(Mensagem))]
        public int IdBebida { get; set; }

        [Display(Name = "tipo_bebida", ResourceType = typeof(Mensagem))]
        public String NomeBebida { get; set; }

        [Display(Name = "dose", ResourceType = typeof(Mensagem))]
        [StringLength(20)]
        public string Dose { get; set; }

        [Display(Name = "horario_complemento", ResourceType = typeof(Mensagem))]
        [StringLength(60)]
        public string HorarioComplemento { get; set; }

        public string ErroDiarioPessoal { get; set; }
    }
}