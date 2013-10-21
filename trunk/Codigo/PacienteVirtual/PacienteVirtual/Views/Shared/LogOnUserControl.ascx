<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%  %>

<%
    if (Request.IsAuthenticated) {
%>
        Welcome <strong><%: Page.User.Identity.Name %></strong>!
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
