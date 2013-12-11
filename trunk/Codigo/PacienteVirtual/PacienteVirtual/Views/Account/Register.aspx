<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.registre_se %>
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Resources.Mensagem.criar_conta %></h2>
    <p>
        <%: Resources.Mensagem.utilize_formulario_altera_senha %>
    </p>
    <p>
        <%: Resources.Mensagem.minimo_senha_1 %> 3 <%: Resources.Mensagem.minimo_senha_2 %>
    </p>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <script src="<%: Url.Content("~/Scripts/jquery.maskedinput.min.js") %>" ></script>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, Resources.Mensagem.conta_sem_sucesso_tentar_novamente) %>
        <div>
            <fieldset>
                <legend><%: Resources.Mensagem.informacao_conta %></legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Email) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Email) %>
                    <%: Html.ValidationMessageFor(m => m.Email) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Nome) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Nome) %>
                    <%: Html.ValidationMessageFor(m => m.Nome) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Cpf) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Cpf, new { id = "cpf", onkeyup = "FormataCpf(this,event);", MaxLength = 14 })%>
                    <%: Html.ValidationMessageFor(m => m.Cpf) %>
                </div>
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Fone) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Fone) %>
                    <%: Html.ValidationMessageFor(m => m.Fone) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Matricula) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Matricula) %>
                    <%: Html.ValidationMessageFor(m => m.Matricula) %>
                </div>    
            <div class="form-actions">
                <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.registre_se %>" />
            </div>
            </fieldset>
        </div>
    <% } %>

    <script type="text/javascript">
        function FormataCpf(campo, teclapres) {
            var tecla = teclapres.keyCode;
            var vr = new String(campo.value);
            vr = vr.replace(".", "");
            vr = vr.replace("/", "");
            vr = vr.replace("-", "");
            tam = vr.length + 1;
            if (tecla != 14) {
                if (tam == 4)
                    campo.value = vr.substr(0, 3) + '.';
                if (tam == 7)
                    campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 6) + '.';
                if (tam == 11)
                    campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 3) + '.' + vr.substr(7, 3) + '-' + vr.substr(11, 2);
            }
        }

</script>
</asp:Content>


