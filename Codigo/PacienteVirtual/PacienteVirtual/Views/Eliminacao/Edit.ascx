<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.EliminacaoModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit","Eliminacao")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.eliminacao %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <h4><%: Resources.Mensagem.intestinal %></h4>
        <legend></legend>
        <div class="row-fluid">
            <div class="span3">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.EvacuacoesDia) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-label">
                    <%: Html.TextBoxFor(model => model.EvacuacoesDia, new { style = "width:70px;" })%>
                    <%: Html.ValidationMessageFor(model => model.EvacuacoesDia, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span3">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.UltimaEvacuacao) %>
                </div>
            </div>
            <div class="span5">
                <%: Html.TextBoxFor(model => model.UltimaEvacuacao, new {  @Value = (String.Format("{0:dd/MM/yyyy}", Model.UltimaEvacuacao)), type = "text", @class = "calendario" , style = "width:70px;"}) %>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span7">
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.EsforcoEvacuar) %>
                    <%: Resources.Mensagem.esforco_evacuar %>
                    <%: Html.ValidationMessageFor(model => model.EsforcoEvacuar) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span6">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.TiposFezes) %>
                </div>
                <div class="editor-field">
                    <%: Html.EnumDropDownListFor(model => model.TiposFezes, ListaTiposFezes.FezesFormadas) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span4">
                    <%: Html.EditorFor(model => model.IncontinenciaFecal) %>
                    <%: Resources.Mensagem.incontinencia_fecal %>
                    <%: Html.ValidationMessageFor(model => model.IncontinenciaFecal, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Flatos) %>
                    <%: Resources.Mensagem.flatos %>
                    <%: Html.ValidationMessageFor(model => model.Flatos, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span5">
                    <%: Html.EditorFor(model => model.SangramentoRetal) %>
                    <%: Resources.Mensagem.sangramento_retal %>
                    <%: Html.ValidationMessageFor(model => model.SangramentoRetal, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span4">
                    <%: Html.EditorFor(model => model.Hemorroidas) %>
                    <%: Resources.Mensagem.hemorroidas %>
                    <%: Html.ValidationMessageFor(model => model.Hemorroidas, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.PruridoAnal) %>
                    <%: Resources.Mensagem.prurido_anal %>
                    <%: Html.ValidationMessageFor(model => model.PruridoAnal, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>        
        <br />
        <div class="row-fluid">
            <div class="span6">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.EstomasCirurgicos) %>
                    <%: Html.EnumDropDownListFor(model => model.EstomasCirurgicos, ListaEstomasCirurgicos.NaoSeAplica) %>
                </div>
            </div>
        </div>
        <br />
        <h4><%: Resources.Mensagem.abdomen %></h4>
        <legend></legend>
        <div class="row-fluid">
            <div class="span6">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.FormasAbdomem) %>
                    <%: Html.EnumDropDownListFor(model => model.FormasAbdomem, ListaFormasAbdomem.Plano) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.SonsIntestinais) %>
                    <%: Html.EnumDropDownListFor(model => model.SonsIntestinais, ListaSonsIntestinais.Presentes) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span6">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.TipoSonsPercussao) %>
                    <%: Html.EnumDropDownListFor(model => model.TipoSonsPercussao, ListaTipoSonsPercussao.SomMacico) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.PalpacaoAbodminal) %>
                    <%: Html.EnumDropDownListFor(model => model.PalpacaoAbodminal, ListaPalpacaoAbodminal.Tenso) %>
                </div>
            </div>
        </div>
        <br />
        <h4><%: Resources.Mensagem.urinaria %></h4>
        <legend></legend>
        <div class="row-fluid">
            <div class="span6">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.ColoracaoUrinaria) %>
                    <%: Html.EnumDropDownListFor(model => model.ColoracaoUrinaria, ListaColoracaoUrinaria.LimpidaClara) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.DebitoUrinario) %>
                    <%: Html.EnumDropDownListFor(model => model.DebitoUrinario, ListaDebitoUrinario.NaoSeAplica) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span6">
                <%: Html.EditorFor(model => model.Disuria) %> &nbsp
                <%: Resources.Mensagem.disuria %>
                <%: Html.ValidationMessageFor(model => model.Disuria) %>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span2">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.Tempo) %>
                </div>
            </div>
            <div class="span10">
                <div class="editor-label">
                    <%: Html.TextBoxFor(model => model.Tempo, new { style = "width:410px;" })%>
                    <%: Html.ValidationMessageFor(model => model.Tempo, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span6">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.CondicaoContinenciaUrinaria) %>
                    <%: Html.EnumDropDownListFor(model => model.CondicaoContinenciaUrinaria, ListaCondicaoContinenciaUrinaria.IncontinenciaUrinaria) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span2">
                <div class="editor-field">
                <%: Html.EditorFor(model => model.SVD) %> &nbsp
                <%: Resources.Mensagem.svd %>
                <%: Html.ValidationMessageFor(model => model.SVD) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.SVDInstalada) %>
                    <%: Html.TextBoxFor(model => model.SVDInstalada, new {  @Value = (String.Format("{0:dd/MM/yyyy}", Model.SVDInstalada)), type = "text", @class = "calendario" , style = "width:100px;"}) %>
                    <%: Html.ValidationMessageFor(model => model.SVDInstalada) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span6">
                <%: Html.EditorFor(model => model.Cistostomia) %> &nbsp
                <%: Resources.Mensagem.cistostomia %>
                <%: Html.ValidationMessageFor(model => model.Cistostomia) %>
            </div>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>
