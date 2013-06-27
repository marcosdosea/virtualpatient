<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ViewModel.VMConsulta>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Create</h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>VMPaciente</legend>
        <!--div class="editor-label">
            < %: Html.LabelFor(model => model.quantRelatos) %>
        </div>
        <div class="editor-field">
            < %: Html.EditorFor(model => model.quantRelatos) %>
            < %: Html.ValidationMessageFor(model => model.quantRelatos) %>
        </div-->
        <div class="span5">
            <div class="thumbnails center">
                <div class="span2">
                    <div class="thumbnail">
                        <img class="media" id="Img1" src="../../Content/themes/pv/img/default-avatar.png"
                            alt="Definir Imagem Padrão" style="width: 100px; height: 100px;" />
                    </div>
                </div>
                <div class="span2">
                    <div class="thumbnail right">
                        <blockquote>
                            Nome do Paciente
                        </blockquote>
                    </div>
                </div>
                <div class="thumbnail center">
                    <%: Html.Html5().Media.Video("video1","~/videofile1.mp4","Browser does not support", new { @width="435px", @height="425px"}) %>
                </div>
                <div class="thumbnail">
                    <% Html.RenderAction("RelatoClinico", "VMConsulta", new ViewDataDictionary(Model.relatoClinico));%>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="thumbnails">
                <div class="tabbable">
                    <!-- Only required for left/right tabs -->
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1" data-toggle="tab">Demográficos Antropomédicos</a></li>
                        <li><a href="#tab2" data-toggle="tab">Diário Pessoal</a></li>
                        <li><a href="#tab3" data-toggle="tab">Experiência Medicamentos</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <div class="thumbnail">
                                <% Html.RenderAction("DemograficosAntropomedicos", "VMConsulta", new ViewDataDictionary(Model.demograficosAntropomedicos));%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <div class="thumbnail">
                                <% Html.RenderAction("DiarioPessoal", "VMConsulta", new RouteValueDictionary(new { id = Model.diarioPessoal }));%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab3">
                            <div class="thumbnail">
                                <% Html.RenderAction("ExperienciaMedicamentos", "VMConsulta", new ViewDataDictionary(Model.experienciaMedicamentos));%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--div class="span3 bottom">
        <div class="form-actions">
            <input class="btn" type="submit" value="Save" />
        </div>
        </div-->
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
