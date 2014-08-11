<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.SexualidadeModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit", "Sexualidade"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.sexualidade %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <%: Html.LabelFor(model => model.ParceiroFixo) %>
                <%: Html.RadioButtonFor(model => model.ParceiroFixo, ListaParceiroFixo.Sim) %>
                <%: Resources.Mensagem.sim %> &nbsp
                <%: Html.RadioButtonFor(model => model.ParceiroFixo, ListaParceiroFixo.Nao) %>
                <%: Resources.Mensagem.nao %> &nbsp
                <%: Html.RadioButtonFor(model => model.ParceiroFixo, ListaParceiroFixo.NaoRelatou) %>
                <%: Resources.Mensagem.NaoRelatou %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <%: Html.LabelFor(model => model.ConflitoPreferenciaSexual) %>
                <%: Html.RadioButtonFor(model => model.ConflitoPreferenciaSexual, ListaConflitoPreferenciaSexual.Sim) %>
                <%: Resources.Mensagem.sim %> &nbsp
                <%: Html.RadioButtonFor(model => model.ConflitoPreferenciaSexual, ListaConflitoPreferenciaSexual.Nao)%>
                <%: Resources.Mensagem.nao %> &nbsp
                <%: Html.RadioButtonFor(model => model.ConflitoPreferenciaSexual, ListaConflitoPreferenciaSexual.NaoRelatou)%>
                <%: Resources.Mensagem.NaoRelatou %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <%: Html.LabelFor(model => model.DorRelacaoSexual) %>
                <%: Html.RadioButtonFor(model => model.DorRelacaoSexual, ListaDorRelaxaoSexual.Sim)%>
                <%: Resources.Mensagem.sim %> &nbsp
                <%: Html.RadioButtonFor(model => model.DorRelacaoSexual, ListaDorRelaxaoSexual.Nao)%>
                <%: Resources.Mensagem.nao %> &nbsp
                <%: Html.RadioButtonFor(model => model.DorRelacaoSexual, ListaDorRelaxaoSexual.NaoRelatou)%>
                <%: Resources.Mensagem.NaoRelatou %>
            </div>
        </div>
    </div>
    <br />
        <h4><%: Resources.Mensagem.genitalia %></h4>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Secrecao) %>
                <%: Html.ValidationMessageFor(model => model.Secrecao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Secrecao) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Prurido) %>
                <%: Html.ValidationMessageFor(model => model.Prurido, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Prurido) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.OdorFetido) %>
                <%: Html.ValidationMessageFor(model => model.OdorFetido, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OdorFetido) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Edema) %>
                <%: Html.ValidationMessageFor(model => model.Edema, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Edema) %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Lesao) %>
                <%: Html.ValidationMessageFor(model => model.Lesao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Lesao) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Sangramento) %>
                <%: Html.ValidationMessageFor(model => model.Sangramento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Sangramento) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Hiperemia) %>
                <%: Html.ValidationMessageFor(model => model.Hiperemia, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Hiperemia) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.SemAlteracao) %>
                <%: Html.ValidationMessageFor(model => model.SemAlteracao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SemAlteracao) %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
