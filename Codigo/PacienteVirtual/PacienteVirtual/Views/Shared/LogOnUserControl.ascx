<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%
    if (Request.IsAuthenticated) {
%>
        <% if (!Session["_NomePessoa"].ToString().Equals("")) { %>
        <p class="bem_vindo"><b><%: Resources.Mensagem.bem_vindo %></b><%: Session["_NomePessoa"].ToString() %>!</p>
        <%  } %>
        [ <%: Html.ActionLink(Resources.Mensagem.log_off, "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Login", "LogOn", "Account") %> ]
<%
    }
%>

<style>
    .bem_vindo
    {
        float: right;
        font-size: medium;
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
