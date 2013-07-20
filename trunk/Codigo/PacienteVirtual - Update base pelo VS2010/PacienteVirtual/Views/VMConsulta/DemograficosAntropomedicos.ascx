<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DemograficosAntropometricosModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend><%: Resources.Mensagem.demografico_antropometricos %></legend>
    <h3> <%: ViewBag.foi %> </h3>

    <table class="table">
        <!-- <caption>Descrição ou sumário do que a tabela possui, especialmente útil para leitores de tela</caption> -->    
        <tbody>
            <tr>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.IdConsultaFixo) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.IdConsultaFixo) %>
                        <%: Html.ValidationMessageFor(model => model.IdConsultaFixo) %>
                    </div>
                </td>
                <td></td>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Nome) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Nome) %>
                        <%: Html.ValidationMessageFor(model => model.Nome) %>
                    </div>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Genero) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Genero) %>
                        <%: Html.ValidationMessageFor(model => model.Genero) %>
                    </div>
                </td>
                <td></td>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.DataNascimento) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.DataNascimento) %>
                        <%: Html.ValidationMessageFor(model => model.DataNascimento) %>
                    </div>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>      
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.MedicosAtendem) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.MedicosAtendem) %>
                        <%: Html.ValidationMessageFor(model => model.MedicosAtendem) %>
                    </div>
                </td>
                <td></td>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.MoradiaFamilia) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.MoradiaFamilia) %>
                        <%: Html.ValidationMessageFor(model => model.MoradiaFamilia) %>
                    </div>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.OndeAdquireMedicamentos) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.OndeAdquireMedicamentos) %>
                        <%: Html.ValidationMessageFor(model => model.OndeAdquireMedicamentos) %>
                    </div>
                </td>
                <td></td>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Nivel) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.DropDownList("IdEscolaridade", Resources.Mensagem.selecione)%>
                        <%: Html.ValidationMessageFor(model => model.IdEscolaridade)%>
                    </div>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Descricao) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.DropDownList("IdOcupacao", Resources.Mensagem.selecione)%>
                        <%: Html.ValidationMessageFor(model => model.IdOcupacao)%>
                    </div>
                </td>
                <td></td>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.PlanoSaudeNome) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.DropDownList("IdPlanoSaude", Resources.Mensagem.selecione)%>
                        <%: Html.ValidationMessageFor(model => model.IdPlanoSaude) %>
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
