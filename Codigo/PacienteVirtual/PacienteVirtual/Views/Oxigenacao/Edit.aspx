<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.tb_oxiginecao>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>tb_oxiginecao</legend>

        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.FrequeciaRespiratoria) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.FrequeciaRespiratoria) %>
            <%: Html.ValidationMessageFor(model => model.FrequeciaRespiratoria) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Ritmo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Ritmo) %>
            <%: Html.ValidationMessageFor(model => model.Ritmo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Dispineia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Dispineia) %>
            <%: Html.ValidationMessageFor(model => model.Dispineia) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Taquipneia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Taquipneia) %>
            <%: Html.ValidationMessageFor(model => model.Taquipneia) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Bradipneia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Bradipneia) %>
            <%: Html.ValidationMessageFor(model => model.Bradipneia) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Kussmaul) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Kussmaul) %>
            <%: Html.ValidationMessageFor(model => model.Kussmaul) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CheyneStokes) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CheyneStokes) %>
            <%: Html.ValidationMessageFor(model => model.CheyneStokes) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Epistaxe) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Epistaxe) %>
            <%: Html.ValidationMessageFor(model => model.Epistaxe) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ObstrucaoNasal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ObstrucaoNasal) %>
            <%: Html.ValidationMessageFor(model => model.ObstrucaoNasal) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Coriza) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Coriza) %>
            <%: Html.ValidationMessageFor(model => model.Coriza) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DesvioDeSepto) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DesvioDeSepto) %>
            <%: Html.ValidationMessageFor(model => model.DesvioDeSepto) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Palidez) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Palidez) %>
            <%: Html.ValidationMessageFor(model => model.Palidez) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.LabioCianotico) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.LabioCianotico) %>
            <%: Html.ValidationMessageFor(model => model.LabioCianotico) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.SimetriaToracica) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.SimetriaToracica) %>
            <%: Html.ValidationMessageFor(model => model.SimetriaToracica) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Barril) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Barril) %>
            <%: Html.ValidationMessageFor(model => model.Barril) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.PeitoDePombo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.PeitoDePombo) %>
            <%: Html.ValidationMessageFor(model => model.PeitoDePombo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Funil) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Funil) %>
            <%: Html.ValidationMessageFor(model => model.Funil) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Lordose) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Lordose) %>
            <%: Html.ValidationMessageFor(model => model.Lordose) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Cifose) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Cifose) %>
            <%: Html.ValidationMessageFor(model => model.Cifose) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Escoliose) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Escoliose) %>
            <%: Html.ValidationMessageFor(model => model.Escoliose) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TiragemIntercostal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TiragemIntercostal) %>
            <%: Html.ValidationMessageFor(model => model.TiragemIntercostal) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
