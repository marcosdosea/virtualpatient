<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ViewModel.VMPaciente>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Resources.Mensagem.editar %></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <!-- <%: ViewBag.ab %> -->
        <legend>VMPaciente</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.quantRelatos) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.quantRelatos) %>
            <%: Html.ValidationMessageFor(model => model.quantRelatos) %>
        </div>
        <div class="span5">
            <% Html.RenderAction("RelatoClinico", "VMPaciente", new ViewDataDictionary(Model.relatoClinico));%>
        </div>
        <div class="span5">
            <div class="tabbable">
                <!-- Only required for left/right tabs -->
                <ul class="nav nav-tabs">
                    <li><a href="#tab4" data-toggle="tab">Curso Teste</a></li>
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
                        <% Html.RenderAction("DiarioPessoal", "VMPaciente", new RouteValueDictionary(new { id = Model.diarioPessoal }));%>
                    </div>
                    <div class="tab-pane" id="tab3">
                        <% Html.RenderAction("ExperienciaMedicamentos", "VMPaciente", new ViewDataDictionary(Model.experienciaMedicamentos));%>
                    </div>
                    <div class="tab-pane" id="tab4">
                        <% Html.RenderAction("Curso", "VMPaciente", new RouteValueDictionary(new { cursoModel = Model.cursoModel }));%>
                         <!-- % Html.RenderPartial("Curso", new ViewDataDictionary(new { id = Model.cursoModel }));%-->
                    </div>
                </div>
            </div>
        </div>
        <div class="span3 bottom">
            <p>
                <input type="submit" value="Save" />
            </p>
        </div>
    </fieldset>
    <% } %>
</asp:Content>
