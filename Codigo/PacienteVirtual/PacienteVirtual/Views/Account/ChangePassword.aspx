<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ChangePasswordModel>" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.mudar_senha %>
</asp:Content>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Resources.Mensagem.mudar_senha %></h2>
    <p>
        <%: Resources.Mensagem.utilize_formulario_altera_senha%>
    </p>
    <p>
        <%: Resources.Mensagem.minimo_senha_1 %> <%: Membership.MinRequiredPasswordLength %> <%: Resources.Mensagem.minimo_senha_2 %>
    </p>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, Resources.Mensagem.senha_sem_sucesso_tentar_novamente) %>
        <div>
            <fieldset>
                <legend><%: Resources.Mensagem.informacao_conta %></legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.OldPassword) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.OldPassword) %>
                    <%: Html.ValidationMessageFor(m => m.OldPassword) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.NewPassword) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.NewPassword) %>
                    <%: Html.ValidationMessageFor(m => m.NewPassword) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                
            <div class="form-actions">
                <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.mudar_senha %>" />
            </div>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
