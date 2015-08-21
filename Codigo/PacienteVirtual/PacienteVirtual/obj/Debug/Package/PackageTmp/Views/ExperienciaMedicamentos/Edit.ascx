<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ExperienciaMedicamentosModel>" %>
<% using (Html.BeginForm("Edit", "ExperienciaMedicamentos"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.experiencia_medicamentos %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
    <div class="row-fluid">
        <div class="span9">
            <div class="editor-label">
                <%: ViewBag.PerguntaEsperaTratamento %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdRespostaEsperaTratamento", null, Resources.Mensagem.selecione, new { style = "width:400px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdRespostaEsperaTratamento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <!--%: Html.LabelFor(model => model.AtencaoEsperaTratamento) %-->
                <%: Resources.Mensagem.necessidade_atencao %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoEsperaTratamento) %-->
                <%= Html.RadioButtonFor(model => model.AtencaoEsperaTratamento, true) %> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.AtencaoEsperaTratamento, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoEsperaTratamento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9">
            <div class="editor-label">
                <%: ViewBag.PerguntaPreocupacoes %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdRespostaPreocupacoes", null, Resources.Mensagem.selecione, new { style = "width:400px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdRespostaPreocupacoes, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Resources.Mensagem.necessidade_atencao %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.AtencaoPreocupacoes, true)%>
                &nbsp
                <%: Resources.Mensagem.sim %>
                &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.AtencaoPreocupacoes, false)%>
                &nbsp
                <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoPreocupacoes, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9">
            <div class="editor-label">
                <%: ViewBag.PerguntaGrauEntendimento %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdRespostaGrauEntendimento", null, Resources.Mensagem.selecione, new { style = "width:400px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdRespostaGrauEntendimento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Resources.Mensagem.necessidade_atencao %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoGrauEntendimento) % -->
                <%= Html.RadioButtonFor(model => model.AtencaoGrauEntendimento, true)%> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.AtencaoGrauEntendimento, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoGrauEntendimento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9">
            <div class="editor-label">
                <%: ViewBag.PerguntaCultural %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdRespostaCultural", null, Resources.Mensagem.selecione, new { style = "width:400px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdRespostaCultural, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Resources.Mensagem.necessidade_atencao %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoCultural) % -->
                <%= Html.RadioButtonFor(model => model.AtencaoCultural, true)%> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.AtencaoCultural, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoCultural, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9">
            <div class="editor-label">
                <%: ViewBag.PerguntaComportamento%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdRespostaComportamento", null, Resources.Mensagem.selecione, new { style = "width:400px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdRespostaComportamento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Resources.Mensagem.necessidade_atencao %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoComportamento) % -->
                <%= Html.RadioButtonFor(model => model.AtencaoComportamento, true)%> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.AtencaoComportamento, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoComportamento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="editor-label">
        <%: ViewBag.PerguntaIncorporadoPlano %>
    </div>
    <div class="editor-field">
        <%: Html.DropDownList("IdRespostaIncorporadoPlano", null, Resources.Mensagem.selecione, new { style = "width:400px;" })%>
        <%: Html.ValidationMessageFor(model => model.IdRespostaIncorporadoPlano, string.Empty, new { @class = "styleValidation" })%>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
