<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.alterar_senha %>
</asp:Content>

<asp:Content ID="changePasswordSuccessContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Resources.Mensagem.alterar_senha%></h2>
    <p>
        <%: Resources.Mensagem.senha_alterada_sucesso %>
    </p>
</asp:Content>
