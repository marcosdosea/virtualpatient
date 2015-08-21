<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.QueixaMedicamentoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.queixa_medicamento %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<% using (Html.BeginForm("Edit", "QueixaMedicamento")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.queixa_medicamento %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.HiddenFor(model => model.IdQueixaMedicamento) %>
        <%: Html.HiddenFor(model => model.IdMedicamento) %>
        <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Queixa) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Queixa, new { id = "textbox" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.NomeMedicamento) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.NomeMedicamento, new { id = "textbox2" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Dose) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Dose, new { @class = "textbox", style = "width:127px;" })%>
                <%: Html.ValidationMessageFor(model => model.Dose, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Desde) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Desde, new { @class = "textbox", style = "width:127px;" })%>
                <%: Html.ValidationMessageFor(model => model.Desde, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <p></p>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Necessario) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Necessario, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Necessario, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Necessario, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Efetivo) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Efetivo, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Efetivo, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Efetivo) %>
            </div>
        </div>
        </div>
        <br />
        <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Seguro) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Seguro, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Seguro, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Seguro) %>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Cumprimento) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Cumprimento, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Cumprimento, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Cumprimento) %>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Resolvido) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Resolvido, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Resolvido, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Resolvido) %>
            </div>
        </div>
        </div>
    </div>
    <p></p>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SuspeitaPRM) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdSuspeitaPrm", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdSuspeitaPRM) %>
            </div>
        </div>
    </div>
    <p></p>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoAcaoQueixa1) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdAcaoQueixa1", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdAcaoQueixa1) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoAcaoQueixa2) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdAcaoQueixa2", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdAcaoQueixa2) %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
    </fieldset>
<% } %>

<div class="btn btn-primary">
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit2", "Consulta", Model.IdConsultaVariavel, new { @style = "color:White; font-size:small;"})%>
</div>

<script type="text/javascript">
    document.getElementById('textbox').disabled = true;
    document.getElementById('textbox2').disabled = true;
</script>

</asp:Content>
