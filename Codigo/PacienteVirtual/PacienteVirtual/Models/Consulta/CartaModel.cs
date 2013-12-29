﻿using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class CartaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "carta", ResourceType = typeof(Mensagem))]
        public int IdCarta { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_profissional", ResourceType = typeof(Mensagem))]
        public string NomeProfissional { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_paciente", ResourceType = typeof(Mensagem))]
        public string NomePaciente { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "data_nascimento", ResourceType = typeof(Mensagem))]
        [DataType(DataType.Date)]
        public DateTime DataNascimento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "telefone", ResourceType = typeof(Mensagem))]
        public string TelefonePaciente { get; set; }

        [Display(Name = "motivo_referencia_consulta", ResourceType = typeof(Mensagem))]
        public string MotivoReferenciaConsulta { get; set; }

        [Display(Name = "alternativas", ResourceType = typeof(Mensagem))]
        public string Alternativas { get; set; }

        [Display(Name = "farmaceutico", ResourceType = typeof(Mensagem))]
        public string Farmaceutico { get; set; }

        [Display(Name = "crfuf", ResourceType = typeof(Mensagem))]
        public string CRFUF { get; set; }

        [Display(Name = "telefone", ResourceType = typeof(Mensagem))]
        public string TelefoneFarmaceutico { get; set; }

        [Display(Name = "valor_referencia", ResourceType = typeof(Mensagem))]
        public string Referências { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "curso", ResourceType = typeof(Mensagem))]
        public int IdCurso { get; set; }

        [Display(Name = "curso", ResourceType = typeof(Mensagem))]
        public string NomeCurso { get; set; }
    }
}