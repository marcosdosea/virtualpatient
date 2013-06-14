<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ViewModel.VMPaciente>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit</h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>

    <fieldset>
        <%: ViewBag.ab %>
        <legend>VMPaciente</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.quantRelatos) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.quantRelatos) %>
            <%: Html.ValidationMessageFor(model => model.quantRelatos) %>
        </div>

        <% Html.RenderAction("RelatoClinico", "VMPaciente", new ViewDataDictionary(Model.relatoClinico));%>
        
        <div class="tabbable">
            <!-- Only required for left/right tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab1" data-toggle="tab">Demográficos Antropomédicos</a></li>
                <li><a href="#tab2" data-toggle="tab">Diário Pessoal</a></li>
                <li><a href="#tab3" data-toggle="tab">Experiência Medicamentos</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Dropdown
                    <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">...</a></li>
                        <li><a href="#">...</a></li>
                    </ul>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <% Html.RenderAction("DemograficosAntropomedicos", "VMPaciente", new ViewDataDictionary(Model.demograficosAntropomedicos));%>
                </div>
                <div class="tab-pane" id="tab2">
                    <% Html.RenderAction("DiarioPessoal", "VMPaciente", new ViewDataDictionary(Model.diarioPessoal));%>
                </div>
                <div class="tab-pane" id="tab3">
                    <% Html.RenderAction("ExperienciaMedicamentos", "VMPaciente", new ViewDataDictionary(Model.experienciaMedicamentos));%>
                </div>
            </div>
        </div>
        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>

</asp:Content>
