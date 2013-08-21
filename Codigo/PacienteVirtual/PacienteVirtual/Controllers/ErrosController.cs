using System;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class ErrosController : Controller
    {
        //
        // GET: /Erros/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult EnviarErro(EmailErroModel emailModel1)
        {

            EmailErroModel emailModel = new EmailErroModel();
            emailModel = emailModel1;
            //if (ModelState.IsValid)
            //{
            try
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("noreply.pacientevirtual@gmail.com", "Website Contact Form");
                msg.To.Add("iuribtt@gmail.com");

                var fromAddress = new MailAddress("noreply.pacientevirtual@gmail.com", "From Name");
                var toAddress = new MailAddress("iuribtt@gmail.com", "To Name");
                string fromPassword = "virtualpatient";
                string subject = "Titulo (Erro) >>>" + emailModel1.Titulo;
                string body = "Erro enviado - " + emailModel1.Mensagem;

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body
                })
                {
                    smtp.Send(message);
                }
            }
            catch (Exception ex)
            {
                while (ex != null)
                {
                    Response.Write("<HR>" + ex.ToString());
                    ex = ex.InnerException;
                }
            }
            return View();
        }

    }
}
