using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web.Security;

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

        private void EnviarEmailParaAluno(string emailTutor, string emailAluno)
        {
            //crio objeto responsável pela mensagem de email
            MailMessage objEmail = new MailMessage();

            //rementente do email
            objEmail.From = new MailAddress(emailTutor);

            //email para resposta(quando o destinatário receber e clicar em responder, vai para:)
            objEmail.ReplyTo = new MailAddress(emailTutor);

            //destinatário(s) do email(s). Obs. pode ser mais de um, pra isso basta repetir a linha
            //abaixo com outro endereço
            objEmail.To.Add(emailAluno);

            //se quiser enviar uma cópia oculta pra alguém, utilize a linha abaixo:
            //objEmail.Bcc.Add("oculto@provedor.com.br");

            //prioridade do email
            objEmail.Priority = MailPriority.Normal;

            //utilize true pra ativar html no conteúdo do email, ou false, para somente texto
            objEmail.IsBodyHtml = true;

            //Assunto do email
            objEmail.Subject = "Correção de Consulta do Paciente Virtual";

            //corpo do email a ser enviado
            objEmail.Body = "Uma das suas consultas precisa de correções. Acesse http://www.pv.sistemasitatechjr.com.br/ e faça seu login.";

            //codificação do assunto do email para que os caracteres acentuados serem reconhecidos.
            objEmail.SubjectEncoding = Encoding.GetEncoding("ISO-8859-1");

            //codificação do corpo do emailpara que os caracteres acentuados serem reconhecidos.
            objEmail.BodyEncoding = Encoding.GetEncoding("ISO-8859-1");

            //cria o objeto responsável pelo envio do email
            SmtpClient objSmtp = new SmtpClient();

            //endereço do servidor SMTP(para mais detalhes leia abaixo do código)
            objSmtp.Host = "smtp.sistemasitatechjr.com.br";

            //Permitir que emails possam ser enviados de dominios diferentes
            objSmtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.PickupDirectoryFromIis;

            //para envio de email autenticado, coloque login e senha de seu servidor de email
            //objSmtp.Credentials = new NetworkCredential("login", "senha");

            //envia o email
            objSmtp.Send(objEmail);
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
