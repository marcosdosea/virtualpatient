<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.EstiloVidaModel>" %>
<% using (Html.BeginForm("Edit", "EstiloVida"))
   { %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.estilo_vida %></legend>
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
                        <%: Html.RadioButtonFor(model => model.TabacoConsumo, true) %>  <%: Resources.Mensagem.sim %>&nbsp &nbsp
                        <%: Html.RadioButtonFor(model => model.TabacoConsumo, false) %>  <%: Resources.Mensagem.nao %>
                        <%: Html.ValidationMessageFor(model => model.TabacoConsumo, string.Empty, new { @class = "styleValidation" })%>
                    </div>
                </td>
                <td>
                    <div class="editor-field">
                        <div>
                        <%= Html.RadioButtonFor(model => model.TabacoUso, 1) %> &nbsp <%: Resources.Mensagem.cigarros_dia_0_10 %> &nbsp &nbsp
                        </div>
                        <div>
                        <%= Html.RadioButtonFor(model => model.TabacoUso, 2) %> &nbsp <%: Resources.Mensagem.cigarros_dia_10_20 %> &nbsp &nbsp
                        </div>
                        <div>
                        <%= Html.RadioButtonFor(model => model.TabacoUso, 3) %> &nbsp <%: Resources.Mensagem.cigarros_dia_20_mais %> 
                        </div>
                        <div>
                        <%= Html.RadioButtonFor(model => model.TabacoUso, 4) %> &nbsp <%: Resources.Mensagem.nao_se_aplica %> 
                        </div>
                    </div>
                </td>
                <td>
                    <%: Resources.Mensagem.quanto_tempo_parou %>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.TabacoParou, new { @class = "textbox", style = "width:150px;" })%>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <%: Resources.Mensagem.cafe %>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.RadioButtonFor(model => model.CafeConsumo, true) %>  <%: Resources.Mensagem.sim %>&nbsp &nbsp
                        <%: Html.RadioButtonFor(model => model.CafeConsumo, false) %>  <%: Resources.Mensagem.nao %>
                    </div>
                </td>
                <td>
                    <div class="editor-field">
                        <div>
                        <%= Html.RadioButtonFor(model => model.CafeUso, 1) %> &nbsp <%: Resources.Mensagem.xicaras_dia_2_menos %> &nbsp &nbsp
                        </div>
                        <div>
                        <%= Html.RadioButtonFor(model => model.CafeUso, 2)%> &nbsp <%: Resources.Mensagem.xicaras_dia_2_6 %> &nbsp &nbsp
                        </div>
                        <div>
                        <%= Html.RadioButtonFor(model => model.CafeUso, 3)%> &nbsp <%: Resources.Mensagem.xicaras_dias_6_mais %> 
                        </div>
                        <div>
                        <%= Html.RadioButtonFor(model => model.CafeUso, 4) %> &nbsp <%: Resources.Mensagem.nao_se_aplica %> 
                        </div>
                    </div>
                </td>
                <td>
                    <%: Resources.Mensagem.quanto_tempo_parou %>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.CafeParou, new { @class = "textbox", style = "width:150px;" })%>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <%: Resources.Mensagem.alcool %>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.RadioButtonFor(model => model.AlcoolConsumo, true) %>  <%: Resources.Mensagem.sim %>&nbsp &nbsp
                        <%: Html.RadioButtonFor(model => model.AlcoolConsumo, false) %>  <%: Resources.Mensagem.nao %>
                    </div>
                </td>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.AlcoolTipoBebida) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.AlcoolTipoBebida, new { @class = "textbox", style = "width:150px;" })%>
                    </div>
                    <div class="editor-field">
                        <div>
                        <%= Html.RadioButtonFor(model => model.AlcoolUso, 1)%> &nbsp <%: Resources.Mensagem.copos_dia_2_menos %> &nbsp &nbsp
                        </div>
                        <div>
                        <%= Html.RadioButtonFor(model => model.AlcoolUso, 2)%> &nbsp <%: Resources.Mensagem.copos_dia_2_6 %> &nbsp &nbsp
                        </div>
                        <div>
                        <%= Html.RadioButtonFor(model => model.AlcoolUso, 3)%> &nbsp <%: Resources.Mensagem.copos_dia_6_mais %> 
                        </div>
                        <div>
                        <%= Html.RadioButtonFor(model => model.AlcoolUso, 4) %> &nbsp <%: Resources.Mensagem.nao_se_aplica %> 
                        </div>
                    </div>
                </td>
                <td>
                    <%: Resources.Mensagem.quanto_tempo_parou %>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.AlcoolParou, new { @class = "textbox", style = "width:150px;" })%>
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
