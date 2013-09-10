<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.EstiloVidaModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<% using (Html.BeginForm("Edit", "EstiloVida"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend><%: Resources.Mensagem.estilo_vida %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>
                    <%: Resources.Mensagem.substancia %>
                </th>
                <th>
                    <%: Resources.Mensagem.consumo %>
                </th>
                <th>
                    <%: Resources.Mensagem.historia_uso %>
                </th>
                <th>
                    <%: Resources.Mensagem.historia_anterior_uso %>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Resources.Mensagem.tabaco %>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.TabacoConsumo) %>
                        <%: Html.ValidationMessageFor(model => model.TabacoConsumo) %>
                    </div>
                </td>
                <td>
                    <%: Resources.Mensagem.uso %>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.TabacoUso, new { @class = "textbox", style = "width:150px;" })%>
                        <%: Html.ValidationMessageFor(model => model.TabacoUso) %>
                    </div>
                </td>
                <td>
                    <%: Resources.Mensagem.quanto_tempo_parou %>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.TabacoParou, new { @class = "textbox", style = "width:150px;" })%>
                        <%: Html.ValidationMessageFor(model => model.TabacoParou) %>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <%: Resources.Mensagem.cafe %>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.CafeConsumo) %>
                        <%: Html.ValidationMessageFor(model => model.CafeConsumo) %>
                    </div>
                </td>
                <td>
                    <%: Resources.Mensagem.uso %>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.CafeUso, new { @class = "textbox", style = "width:150px;" })%>
                        <%: Html.ValidationMessageFor(model => model.CafeUso) %>
                    </div>
                </td>
                <td>
                    <%: Resources.Mensagem.quanto_tempo_parou %>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.CafeParou, new { @class = "textbox", style = "width:150px;" })%>
                        <%: Html.ValidationMessageFor(model => model.CafeParou) %>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <%: Resources.Mensagem.alcool %>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.AlcoolConsumo) %>
                        <%: Html.ValidationMessageFor(model => model.AlcoolConsumo) %>
                    </div>
                </td>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.AlcoolTipoBebida) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.AlcoolTipoBebida, new { @class = "textbox", style = "width:150px;" })%>
                        <%: Html.ValidationMessageFor(model => model.AlcoolTipoBebida) %>
                    </div>
                    <%: Resources.Mensagem.uso %>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.AlcoolUso, new { @class = "textbox", style = "width:150px;" })%>
                        <%: Html.ValidationMessageFor(model => model.AlcoolUso) %>
                    </div>
                </td>
                <td>
                    <%: Resources.Mensagem.quanto_tempo_parou %>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.AlcoolParou, new { @class = "textbox", style = "width:150px;" })%>
                        <%: Html.ValidationMessageFor(model => model.AlcoolParou) %>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
