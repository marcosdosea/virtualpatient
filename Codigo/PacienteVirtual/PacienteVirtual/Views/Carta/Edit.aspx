<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.CartaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.carta %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.carta %></legend>

        <%: Html.HiddenFor(model => model.IdCarta) %>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeProfissional) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.NomeProfissional)%>
            <%: Html.ValidationMessageFor(model => model.NomeProfissional, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomePaciente) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.NomePaciente)%>
            <%: Html.ValidationMessageFor(model => model.NomePaciente, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataNascimento) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.DataNascimento, new {  @Value = (String.Format("{0:dd/MM/yyyy}", Model.DataNascimento)), type = "text", id = "calendario" , style = "width:176px;"}) %>
            <%: Html.ValidationMessageFor(model => model.DataNascimento, string.Empty, new { @class = "styleValidation" }) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TelefonePaciente) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.TelefonePaciente)%>
            <%: Html.ValidationMessageFor(model => model.TelefonePaciente, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.MotivoReferenciaConsulta) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.MotivoReferenciaConsulta, new { style = "width:579px;" })%>
            <%: Html.ValidationMessageFor(model => model.MotivoReferenciaConsulta, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Alternativas) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.Alternativas, new { style = "width:579px;" })%>
            <%: Html.ValidationMessageFor(model => model.Alternativas, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Farmaceutico) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Farmaceutico) %>
            <%: Html.ValidationMessageFor(model => model.Farmaceutico, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CRFUF) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.CRFUF) %>
            <%: Html.ValidationMessageFor(model => model.CRFUF, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TelefoneFarmaceutico) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.TelefoneFarmaceutico)%>
            <%: Html.ValidationMessageFor(model => model.TelefoneFarmaceutico, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Referências) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.Referências, new { style = "width:579px;" })%>
            <%: Html.ValidationMessageFor(model => model.Referências, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdEspecialidade) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdEspecialidade")%>
            <%: Html.ValidationMessageFor(model => model.IdEspecialidade, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>

<div class="btn btn-primary">
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit2", "Consulta", Model.IdConsultaVariavel, new { @style = "color:White; font-size:small;"})%>
</div>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#calendario").datepicker({
                dateFormat: 'dd/mm/yy',
                dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'],
                dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
                dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'],
                monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                showOtherMonths: true,
                selectOtherMonths: true,
                showOn: "button",
                buttonImage: "../../Content/themes/pv/img/icons/calendar3.png",
                buttonImageOnly: true,
                nextText: 'Próximo',
                prevText: 'Anterior'
            }); //.datepicker('setDate', 'today');
        });
    </script>

</asp:Content>
