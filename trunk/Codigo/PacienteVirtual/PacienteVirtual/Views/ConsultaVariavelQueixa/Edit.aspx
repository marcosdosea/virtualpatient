<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ConsultaVariavelQueixaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.intervencao %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<% using (Html.BeginForm("Edit", "ConsultaVariavelQueixa")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.intervencao %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.HiddenFor(model => model.IdQueixa) %>
        <%: Html.HiddenFor(model => model.IdSistema) %>
        <div class="row-fluid">
            <div class="span3">
                <div class="editor-label">
                    <%: Html.Label(Resources.Mensagem.problema_saude) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.DescricaoQueixa, new { id = "textbox" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Tipo) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Tipo, "S" ) %> <%: Resources.Mensagem.classificao_prm %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Tipo, "D")%> <%: Resources.Mensagem.doenca_agrave %>
                <%: Html.ValidationMessageFor(model => model.Tipo, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Desde) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Desde) %>
                <%: Html.ValidationMessageFor(model => model.Desde, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Prioridade) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Prioridade) %>
                <%: Html.ValidationMessageFor(model => model.Prioridade, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoObjetivoTerapeutico) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdObjetivoTerapeutico", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdObjetivoTerapeutico, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoSituacao) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdSituacaoQueixa", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdSituacaoQueixa, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
    </fieldset>
<% } %>

<div class="btn btn-primary">
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit2", "Consulta", Model.IdConsultaVariavel, new { @style = "color:White; font-size:small;"})%>
</div>

<script type="text/javascript">
    document.getElementById('textbox').disabled = true;
</script>

</asp:Content>
