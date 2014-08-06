<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.UsuarioE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>UsuarioE</legend>

    <div class="display-label">Cpf</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Cpf) %>
    </div>

    <div class="display-label">NomeUsuario</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeUsuario) %>
    </div>

    <div class="display-label">Email</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Email) %>
    </div>

    <div class="display-label">Login</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Login) %>
    </div>

    <div class="display-label">Senha</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Senha) %>
    </div>

    <div class="display-label">tpUsuario</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tpUsuario) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdUsuario }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
