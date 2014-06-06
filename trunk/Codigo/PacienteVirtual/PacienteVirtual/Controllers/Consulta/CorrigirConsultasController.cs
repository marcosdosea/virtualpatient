using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web.Security;
using System;

namespace PacienteVirtual.Controllers
{
    public class CorrigirConsultasController : Controller
    {
        //
        // GET: /ConsultasAlunos/

        public ActionResult Index()
        {
            Global.ZeraSessaoConsulta();
            SessionController.TutorVisualizaConsultaPeloCorrigirConsultas = true;
            return View(GerenciadorConsultaVariavel.GetInstance().ObterParaCorreção(SessionController.DadosTurmaPessoa.IdTurma));
        }

        public ActionResult ComentariosTutor(ConsultaVariavelModel cvm)
        {
            if (ModelState.IsValid)
            {
                GerenciadorConsultaVariavel.GetInstance().Atualizar(cvm);
            }
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult EnviarParaCorrecao(long idConsultaVariavel)
        {
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavel);
            consultaVariavelModel.IdEstadoConsulta = Global.AguardandoCorrecaoDoAluno;
            GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
            SessionController.EmCorrecao = false;
            
            if (SessionController.Roles.Equals(Global.stringTutorRole))
            {
                /*MembershipUser tutor = Membership.GetUser(SessionController.Pessoa.UserName);
                MembershipUser aluno = Membership.GetUser(GerenciadorPessoa.GetInstance().ObterPorNome(consultaVariavelModel.NomePessoa).UserName);
                EnviarEmailParaAluno(tutor.Email, aluno.Email);*/
            }
            
            return RedirectToAction("Index", "CorrigirConsultas");
        }

        private void EnviarEmailParaAluno(string emailTutor, MembershipUser aluno)
        {
            string from = "sistemapacientevirtual@gmail.com";

            string to = aluno.Email;

            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(to);
            mail.From = new MailAddress(from, "Paciente Virtual", System.Text.Encoding.UTF8);
            mail.Subject = "Correção de Consulta do Paciente Virtual";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Caro " + GerenciadorPessoa.GetInstance().ObterPorUserName(aluno.UserName).Nome + ",<br/>Uma das suas consultas precisa de correções. Acesse http://www.pv.sistemasitatechjr.com.br/ e faça seu login.<br/><br/>Att. Sistema Paciente Virtual.";
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;

            SmtpClient client = new SmtpClient();
            //Add as credenciais usando o email e a senha criada para o sistema

            client.Credentials = new System.Net.NetworkCredential(from, "paciente2014");

            client.Port = 587; // Gmail funciona com essa porta 587
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true; //Gmail trabalha utilizando SSL
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
                throw new NegocioException(errorMessage);
            }
        }

        public ActionResult FinalizarCorrecao(long idConsultaVariavel)
        {
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavel);
            consultaVariavelModel.IdEstadoConsulta = Global.Finalizado;
            GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
            SessionController.EmCorrecao = false;
            return RedirectToAction("Index", "CorrigirConsultas");
        }

        public ActionResult Delete(long idConsultaVariavel, int idEstadoConsulta)
        {
            if(idEstadoConsulta == Global.AguardandoPreenchimento)
            {
                GerenciadorConsultaVariavel.GetInstance().Remover(idConsultaVariavel);
            }
            return RedirectToAction("Index", "CorrigirConsultas");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }

    }
}
