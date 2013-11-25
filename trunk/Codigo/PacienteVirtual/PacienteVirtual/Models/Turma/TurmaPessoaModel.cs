using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class TurmaPessoaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdTurma { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public string NomeTurma { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdPessoa { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_pessoa", ResourceType = typeof(Mensagem))]
        public string NomePessoa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        //[Display(Name = "id_role", ResourceType = typeof(Mensagem))]
        public int IdRole { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        //[Display(Name = "nome_turma", ResourceType = typeof(Mensagem))]
        public string NomeRole { get; set; }
        
        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "ativa", ResourceType = typeof(Mensagem))]
        public bool Ativa { get; set; }

        // dados da tela selecionar turma
        [Display(Name = "instituicao", ResourceType = typeof(Mensagem))]
        public String Instituicao { get; set; }

        [Display(Name = "curso", ResourceType = typeof(Mensagem))]
        public String Curso { get; set; }

        [Display(Name = "disciplina", ResourceType = typeof(Mensagem))]
        public String Disciplina { get; set; }

        [Display(Name = "periodo", ResourceType = typeof(Mensagem))]
        public String Periodo { get; set; }
    }
}