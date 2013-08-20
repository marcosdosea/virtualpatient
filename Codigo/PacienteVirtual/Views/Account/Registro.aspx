<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Data.UsuarioE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>UsuarioE</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeUsuario) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeUsuario) %>
            <%: Html.ValidationMessageFor(model => model.NomeUsuario) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Login) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Login) %>
            <%: Html.ValidationMessageFor(model => model.Login) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Senha) %>
        </div>
        <div class="editor-field">
            <%: Html.PasswordFor(model => model.Senha) %>
            <%: Html.ValidationMessageFor(model => model.Senha) %>
        </div>

        <div class="editor-label">
            <%: Html.Label("Confirmar Senha") %>
        </div>
        <div class="editor-field">
            <%: Html.Password("Confirmar Senha") %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Cpf) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Cpf) %>
            <%: Html.ValidationMessageFor(model => model.Cpf) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Email) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Email) %>
            <%: Html.ValidationMessageFor(model => model.Email) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.tpUsuario) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.tpUsuario) %>
            <%: Html.ValidationMessageFor(model => model.tpUsuario) %>
        </div>

    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="Cadastrar" />
    </div>
    </fieldset>
    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>
