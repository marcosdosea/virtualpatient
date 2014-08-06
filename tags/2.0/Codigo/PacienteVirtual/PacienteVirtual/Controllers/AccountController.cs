using System;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class AccountController : Controller
    {
        private pvEntities db = new pvEntities();

        //
        // GET: /Account/LogOn

        public ActionResult LogOn()
        {
            return View();
        }

        //
        // POST: /Account/LogOn

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (Membership.ValidateUser(model.UserName, model.Password))
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                    if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                        && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        PessoaModel pessoa = GerenciadorPessoa.GetInstance().ObterPorUserName(model.UserName);
                        SessionController.Pessoa = pessoa;
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        PessoaModel pessoa = GerenciadorPessoa.GetInstance().ObterPorUserName(model.UserName);
                        SessionController.Pessoa = pessoa;
                        switch (GerenciadorTurmaPessoa.GetInstance().ObterRolePorPessoa(pessoa.IdPessoa))
                        {
                            case Global.Usuario:
                                SessionController.Roles = Global.stringUsuarioRole;
                                break;
                            case Global.Tutor:
                                SessionController.Roles = Global.stringTutorRole;
                                break;
                            case Global.Administrador:
                                SessionController.Roles = Global.stringAdministradorRole;
                                break;
                            case Global.AdministradorEnfermagem:
                                SessionController.Roles = Global.stringAdministradorEnfermagem;
                                break;
                            case Global.AdministradorFarmacia:
                                SessionController.Roles = Global.stringAdministradorFarmacia;
                                break;
                            default:
                                SessionController.Roles = Global.stringUsuarioRole;
                                return RedirectToAction("Index", "SolicitarMatriculaTurma");
                        }
                        return RedirectToAction("Index", "SelecionarTurma");
                    }

                }
                else
                {
                    ModelState.AddModelError("", Resources.Mensagem.usuario_senha_incorretos);
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/LogOff

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            SessionController.Pessoa = null;
            SessionController.DadosTurmaPessoa = null;
            SessionController.Roles = null;
            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Account/Register


        public ActionResult Register()
        {
            ViewBag.Erro = "";
            return View();
        }

        //
        // POST: /Account/Register

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                //Retirando Máscara do CPF para inserir no banco
                model.Cpf = model.Cpf.Replace(".", "");
                model.Cpf = model.Cpf.Replace("-", "");

                if (Global.validarCPF(model.Cpf))
                {

                    PessoaModel pessoaModel = new PessoaModel();
                    pessoaModel = GerenciadorPessoa.GetInstance().ObterPorCPF(model.Cpf);
                    if (pessoaModel != null)
                    {
                        model.Cpf = "";
                        ModelState.AddModelError("CPF", "*" + Resources.Mensagem.cpf_ja_cadastrado);
                        return View(model);
                    }


                    // Attempt to register the user
                    MembershipCreateStatus createStatus;
                    Membership.CreateUser(model.UserName, model.Password, model.Email, "Pergunta", "Resposta", true, "1234", out createStatus);
                    // inserir pessoa

                    MembershipUser usuario = string.IsNullOrEmpty(model.UserName) ? null : Membership.GetUser(model.UserName);

                    pessoaModel = new PessoaModel();
                    pessoaModel.IdUser = (int)usuario.ProviderUserKey;
                    pessoaModel.Nome = model.Nome;
                    pessoaModel.Cpf = model.Cpf;
                    pessoaModel.Fone = model.Fone;
                    pessoaModel.Matricula = model.Matricula;
                    pessoaModel.IdPessoa = GerenciadorPessoa.GetInstance().Inserir(pessoaModel);
                    SessionController.Pessoa = pessoaModel;


                    // usado para esconder as telas
                    SessionController.Roles = "usuario";


                    // fim do inserir pessoa

                    if (createStatus == MembershipCreateStatus.Success)
                    {
                        FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);
                        return RedirectToAction("Index", "SolicitarMatriculaTurma");
                    }
                    else
                    {
                        ModelState.AddModelError("", ErrorCodeToString(createStatus));
                    }

                }
                else
                {
                    ModelState.AddModelError("CPF", "*" + Resources.Mensagem.cpf_erro);
                }
            }
            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePassword

        [Authorize]
        public ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Account/ChangePassword

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {

                // ChangePassword will throw an exception rather
                // than return false in certain failure scenarios.
                bool changePasswordSucceeded;
                try
                {
                    MembershipUser currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
                    changePasswordSucceeded = currentUser.ChangePassword(model.OldPassword, model.NewPassword);
                }
                catch (Exception)
                {
                    changePasswordSucceeded = false;
                }

                if (changePasswordSucceeded)
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("", Resources.Mensagem.senha_atual_incorreta);
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePasswordSuccess

        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }

        #region Status Codes
        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return Resources.Mensagem.msgErro_DuplicateUserName;

                case MembershipCreateStatus.DuplicateEmail:
                    return Resources.Mensagem.msgErro_DuplicateEmail;

                case MembershipCreateStatus.InvalidPassword:
                    return Resources.Mensagem.msgErro_InvalidPassword;

                case MembershipCreateStatus.InvalidEmail:
                    return Resources.Mensagem.msgErro_InvalidEmail;

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return Resources.Mensagem.msgErro_InvalidUserName;

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion

        //Método necessário para alteração da Linguagem da aplicação
        public ActionResult ChangeCulture(string lang, string returnUrl)
        {

            Session["Culture"] = new CultureInfo(lang);

            return Redirect(returnUrl);

        }


        [Authorize]
        public ActionResult AlterarDadosUsuario(AlterarDadosUsuarioModel model)
        {
            MembershipUser currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
            PessoaModel pessoa = GerenciadorPessoa.GetInstance().ObterPorUserName(currentUser.UserName);
            model.UserName = pessoa.UserName;
            model.Nome = pessoa.Nome;
            model.Cpf = pessoa.Cpf;
            model.Fone = pessoa.Fone;
            model.Matricula = pessoa.Matricula;
            model.Email = currentUser.Email;
            return View(model);
        }

        [Authorize]
        [HttpPost]
        public ActionResult AlterarDadosUsuario(AlterarDadosUsuarioModel model, string nada)
        {
            if (ModelState.IsValid)
            {
                MembershipUser currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
                PessoaModel pessoaModel = new PessoaModel();
                pessoaModel.IdUser = SessionController.Pessoa.IdUser;
                pessoaModel.IdPessoa = SessionController.Pessoa.IdPessoa;
                pessoaModel.Nome = model.Nome;
                pessoaModel.Cpf = model.Cpf;
                pessoaModel.Fone = model.Fone;
                pessoaModel.Matricula = model.Matricula;
                pessoaModel.UserName = model.UserName;
                currentUser.Email = model.Email;
                GerenciadorPessoa.GetInstance().Atualizar(pessoaModel);
                SessionController.Pessoa = pessoaModel;
                return RedirectToAction("LogOff", "Account");
            }
            
            return View(model);
        }
    }

}
