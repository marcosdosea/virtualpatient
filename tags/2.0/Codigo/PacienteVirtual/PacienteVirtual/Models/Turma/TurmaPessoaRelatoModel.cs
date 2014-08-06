using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class TurmaPessoaRelatoModel
    {
        public const string AGUARDANDO_PREENCHIMENTO = "Aguardando Preenchimento";
        public const string EM_PREENCHIMENTO = "Em Preenchimento";
        public const string ENVIADO_PARA_CORRECAO = "Enviado para Correção";
        public const string EM_CORRECAO = "Em Correção";
        public const string FINALIZADO = "Finalizado";

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "turma_codigo", ResourceType = typeof(Mensagem))]
        public int IdTurma { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pessoa_codigo", ResourceType = typeof(Mensagem))]
        public int IdPessoa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "relato_codigo", ResourceType = typeof(Mensagem))]
        public int IdRelato { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_dados_fixos_codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaFixo { get; set; }

        [Display(Name = "ordem_cronologica", ResourceType = typeof(Mensagem))]
        public int OrdemCronologica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nivel_dificuldade", ResourceType = typeof(Mensagem))]
        public int NivelDificuldade { get; set; }

        [Required]
        public String NomePaciente { get; set; }
    }
}