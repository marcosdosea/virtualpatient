<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ExperienciaMedicamentosModel>" %>
<% using (Html.BeginForm("Edit", "ExperienciaMedicamentos"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.experiencia_medicamentos %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdRespostaEsperaTratamento) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.IdRespostaEsperaTratamento) %>
                <%: Html.ValidationMessageFor(model => model.IdRespostaEsperaTratamento) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AtencaoEsperaTratamento) %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoEsperaTratamento) %-->
                <%= Html.RadioButtonFor(model => model.AtencaoEsperaTratamento, true) %> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.AtencaoEsperaTratamento, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoEsperaTratamento) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdRespostaPreocupacoes) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.IdRespostaPreocupacoes) %>
                <%: Html.ValidationMessageFor(model => model.IdRespostaPreocupacoes) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AtencaoPreocupacoes) %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoPreocupacoes) % -->
                <%= Html.RadioButtonFor(model => model.AtencaoPreocupacoes, true)%> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.AtencaoPreocupacoes, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoPreocupacoes) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdRespostaGrauEntendimento) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.IdRespostaGrauEntendimento) %>
                <%: Html.ValidationMessageFor(model => model.IdRespostaGrauEntendimento) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AtencaoGrauEntendimento) %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoGrauEntendimento) % -->
                <%= Html.RadioButtonFor(model => model.AtencaoGrauEntendimento, true)%> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.AtencaoGrauEntendimento, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoGrauEntendimento) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdRespostaCultural) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.IdRespostaCultural) %>
                <%: Html.ValidationMessageFor(model => model.IdRespostaCultural) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AtencaoCultural) %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoCultural) % -->
                <%= Html.RadioButtonFor(model => model.AtencaoCultural, true)%> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.AtencaoCultural, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoCultural) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdRespostaComportamento) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.IdRespostaComportamento) %>
                <%: Html.ValidationMessageFor(model => model.IdRespostaComportamento) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AtencaoComportamento) %>
            </div>
            <div class="editor-field">
                <!--%: Html.EditorFor(model => model.AtencaoComportamento) % -->
                <%= Html.RadioButtonFor(model => model.AtencaoComportamento, true)%> &nbsp <%: Resources.Mensagem.sim %>
                &nbsp &nbsp &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.AtencaoComportamento, false)%> &nbsp <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.AtencaoComportamento) %>
            </div>
        </div>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.IdRespostaIncorporadoPlano) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.IdRespostaIncorporadoPlano) %>
        <%: Html.ValidationMessageFor(model => model.IdRespostaIncorporadoPlano) %>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
