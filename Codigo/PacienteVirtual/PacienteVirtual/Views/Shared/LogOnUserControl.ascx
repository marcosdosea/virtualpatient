<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%  %>

<%
    if (Request.IsAuthenticated) {
%>
        <p class="bem_vindo"><%: Page.User.Identity.Name %>!</p><p class="nome"><%: Resources.Mensagem.bem_vindo %></p>
        [ <%: Html.ActionLink(Resources.Mensagem.alterar_senha, "ChangePassword", "Account")%> ]
        [ <%: Html.ActionLink("Log Off", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Log On", "LogOn", "Account") %> ]
<%
    }
%>

<style>
    .bem_vindo
    {
        float: right;
        font-size: small;
        font-family: Tahoma;
        text-transform:capitalize;
        color: Black;
    }
    .nome
    {
        font-size: medium;
        font-family: Tahoma;
        font-weight: bold;
        color: Black;
    }
</style>
