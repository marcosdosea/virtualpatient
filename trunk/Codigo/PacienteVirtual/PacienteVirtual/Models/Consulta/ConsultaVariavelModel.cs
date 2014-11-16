using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class ConsultaVariavelModel
    {
        public int IdCurso { get; set; }

        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public int IdTurma { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public int IdPessoa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public int IdRelato { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public int IdRazaoEncontro { get; set; }

        [Display(Name = "descricao_razao", ResourceType = typeof(Mensagem))]
        public string DescricaoRazao { get; set; }

        public int IdEstadoConsulta { get; set; }
        
        public string DescricaoEstadoConsulta { get; set; }

        public string NomePaciente { get; set; }

        public int IdPaciente { get; set; }

        public int OrdemCronologica { get; set; }

        public int NivelDificuldade { get; set; }

        public DateTime DataPreenchimento { get; set; }

        public string ResumoPlanoCuidados { get; set; }

        public string ComentariosTutor { get; set; }

        public string NomePessoa { get; set; }

        public string NomeTurma { get; set; }

        public decimal NotaAluno { get; set; }

        public int AbaAuxiliar { get; set; }

        //Enfermagem
        [Display(Name = "descricao", ResourceType = typeof(Mensagem))]
        public string DescricaoOutrosAchados { get; set; }

        [Display(Name = "descricao", ResourceType = typeof(Mensagem))]
        public string DescricaoDadosComplementares { get; set; }

        [Display(Name = "informacoes_fornecidas", ResourceType = typeof(Mensagem))]
        public string InfoFornecidas { get; set; }
    }
}