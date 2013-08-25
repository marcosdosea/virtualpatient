using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using Resources;

namespace PacienteVirtual.Models
{

    public class ChangePasswordModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class LogOnModel
    {
        [Required]
        [Display(Name = "nome_usuario", ResourceType = typeof(Mensagem))]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "senha", ResourceType = typeof(Mensagem))]
        public string Password { get; set; }

        [Display(Name = "lembrar_me", ResourceType = typeof(Mensagem))]
        public bool RememberMe { get; set; }
    }

    public class RegisterModel
    {
        [Required]
        [Display(Name = "nome_usuario", ResourceType = typeof(Mensagem))]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "endereco_email", ResourceType = typeof(Mensagem))]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "senha", ResourceType = typeof(Mensagem))]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "confirme_senha", ResourceType = typeof(Mensagem))]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
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
}
