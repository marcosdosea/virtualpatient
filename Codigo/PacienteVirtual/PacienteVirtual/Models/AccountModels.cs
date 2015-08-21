using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using Resources;
using System;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class ChangePasswordModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [DataType(DataType.Password)]
        [Display(Name = "senha_atual", ResourceType = typeof(Mensagem))]
        public string OldPassword { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [StringLength(100, ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "senha_curta", MinimumLength = 3)]
        [DataType(DataType.Password)]
        [Display(Name = "nova_senha", ResourceType = typeof(Mensagem))]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "confirme_senha", ResourceType = typeof(Mensagem))]
        [Compare("NewPassword", ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "senha_confSenha_nao_coincidem")]
        public string ConfirmPassword { get; set; }
    }
    [Serializable]
    public class LogOnModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_usuario", ResourceType = typeof(Mensagem))]
        public string UserName { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [DataType(DataType.Password)]
        [Display(Name = "senha", ResourceType = typeof(Mensagem))]
        public string Password { get; set; }

        [Display(Name = "lembrar_me", ResourceType = typeof(Mensagem))]
        public bool RememberMe { get; set; }
    }
    [Serializable]
    public class RegisterModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_usuario", ResourceType = typeof(Mensagem))]
        public string UserName { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessageResourceType = typeof(Mensagem) ,ErrorMessageResourceName = "email_invalido")]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "endereco_email", ResourceType = typeof(Mensagem))]
        public string Email { get; set; }

        [Display(Name = "confirmar_email", ResourceType = typeof(Mensagem))]
        [Compare("Email", ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "email_nao_coincidem")]
        public string ConfirmaEmail { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [StringLength(100, ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "senha_curta", MinimumLength = 3)]
        [DataType(DataType.Password)]
        [Display(Name = "senha", ResourceType = typeof(Mensagem))]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "confirme_senha", ResourceType = typeof(Mensagem))]
        [Compare("Password", ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "senha_confSenha_nao_coincidem")]
        public string ConfirmPassword { get; set; }

        /// <summary>
        /// parte da pessoa
        /// </summary>

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_pessoa", ResourceType = typeof(Mensagem))]
        public string Nome { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "cpf", ResourceType = typeof(Mensagem))]
        public string Cpf { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "fone", ResourceType = typeof(Mensagem))]
        public string Fone { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "matricula", ResourceType = typeof(Mensagem))]
        public string Matricula { get; set; }

    }
    [Serializable]
    public class AlterarDadosUsuarioModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_usuario", ResourceType = typeof(Mensagem))]
        public string UserName { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "endereco_email", ResourceType = typeof(Mensagem))]
        public string Email { get; set; }


        /// <summary>
        /// parte da pessoa
        /// </summary>

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_pessoa", ResourceType = typeof(Mensagem))]
        public string Nome { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "cpf", ResourceType = typeof(Mensagem))]
        public string Cpf { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "fone", ResourceType = typeof(Mensagem))]
        public string Fone { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "matricula", ResourceType = typeof(Mensagem))]
        public string Matricula { get; set; }

    }
}
