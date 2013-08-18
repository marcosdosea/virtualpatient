<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Error
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Desculpe, um erro enquando efetuavamos sua requisição.
    </h2>
    <%  if (Request.IsLocal)
        {
            if (Model != null && Model.Exception != null)
            { %>
    <br />
    <h4>
        Exception :
        <%: Model.Exception.Message %></h4>
    <br />
    <br />
    <h4>
        Stack Trace:
        <%: Model.Exception.StackTrace %></h4>
    <br />
    <br />
    <%: Model.Exception.Message %>
    <% }
        }
        else
        {%>
    <h3>
        O erro foi reportado ao Administrador.</h3>
    <% } %>

    <% using (Html.BeginForm("EnviarErro", "Erros", FormMethod.Post, new { emailModel1 = new PacienteVirtual.Models.EmailErroModel(Model.Exception.Message) }))
       { %>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="Enviar email para o desenvolvedor" />
    </div>
    <% } %>
    <a href="<%: Url.Action("EnviarErro", "Erros", new { emailModel1 = new PacienteVirtual.Models.EmailErroModel("foi") })%>">
        Enviar Mensagem</a>
</asp:Content>
