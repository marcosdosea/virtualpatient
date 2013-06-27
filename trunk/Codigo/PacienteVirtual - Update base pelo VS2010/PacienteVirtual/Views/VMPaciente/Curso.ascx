<%@ Control  Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.CursoModel>" %>

    <h2><%: Resources.Mensagem.criar %></h2>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Criar Novo Curso</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeCurso) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeCurso) %>
            <%: Html.ValidationMessageFor(model => model.NomeCurso) %>
        </div>
           <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeInstituicao) %>
        </div>
         <!--div-- class="editor-label">
            <!--%: Html.LabelFor(model => model.NomeInstituicao) %-->
        <!--/div-->
        <p>
            <input type="submit" value="<%: Resources.Mensagem.salvar%>" />
        </p>

    </fieldset>
    <% } %>

    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </div>

