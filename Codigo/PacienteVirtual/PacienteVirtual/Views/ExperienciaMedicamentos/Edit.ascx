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
                <%: Html.ValidationMessageFor(model => model.IdRespostaEsperaTratamento) %>
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
                <%: Html.ValidationMessageFor(model => model.AtencaoEsperaTratamento) %>
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
                <%: Html.ValidationMessageFor(model => model.IdRespostaPreocupacoes) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Resources.Mensagem.necessidade_atencao %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoPreocupacoes) % -->
                <%= Html.RadioButtonFor(model => model.AtencaoPreocupacoes, true)%> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.AtencaoPreocupacoes, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoPreocupacoes) %>
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
                <%: Html.ValidationMessageFor(model => model.IdRespostaGrauEntendimento) %>
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
                <%: Html.ValidationMessageFor(model => model.AtencaoGrauEntendimento) %>
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
                <%: Html.ValidationMessageFor(model => model.IdRespostaCultural) %>
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
                <%: Html.ValidationMessageFor(model => model.AtencaoCultural) %>
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
                <%: Html.ValidationMessageFor(model => model.IdRespostaComportamento) %>
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
                <%: Html.ValidationMessageFor(model => model.AtencaoComportamento) %>
            </div>
        </div>
    </div>
    <div class="editor-label">
        <%: ViewBag.PerguntaIncorporadoPlano %>
    </div>
    <div class="editor-field">
        <%: Html.DropDownList("IdRespostaIncorporadoPlano", null, Resources.Mensagem.selecione, new { style = "width:400px;" })%>
        <%: Html.ValidationMessageFor(model => model.IdRespostaIncorporadoPlano) %>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
