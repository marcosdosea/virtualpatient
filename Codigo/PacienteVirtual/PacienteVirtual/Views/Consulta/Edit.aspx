<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ConsultaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.consulta %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Arquivo necessário para as View partial -->
    <script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <h2>
        <%: Resources.Mensagem.consulta %></h2>
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
                        <img class="media" id="Img1" src="<%: Url.Action("GetImage", "Paciente",new { id = Model.Paciente.IdPaciente}) %>"
                            alt="Definir Imagem Padrão" style="width: 100px; height: 100px;" />
                    </div>
                </div>
                <div class="span3">
                    <div class="thumbnail right">
                        <blockquote>
                            <%: 
                            Resources.Mensagem.nome %>
                            do Paciente :
                            <br />
                            <br />
                            <%: Model.Paciente.NomePaciente %>
                        </blockquote>
                    </div>
                </div>
                <div class="thumbnail">
                    <% Html.RenderAction("RelatoClinico", "Consulta", new RouteValueDictionary(new { model = Model.RelatoClinico }));%>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="thumbnails">
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1-1" data-toggle="tab">
                            <%: Resources.Mensagem.demografico_antropometricos %></a></li>
                        <li><a href="#tab1-2" data-toggle="tab">
                            <%: Resources.Mensagem.experiencia_medicamentos %></a></li>
                        <li><a href="#tab1-3" data-toggle="tab">
                            <%: Resources.Mensagem.diario_pessoal %></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1-1">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../DemograficosAntropometicos/Edit", Model.DemograficoAntropometrico);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-2">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../ExperienciaMedicamentos/Edit", Model.ExperienciaMedicamentos);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-3">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../DiarioPessoal/Create", Model.DiarioPessoal);%>
                                <% Html.RenderPartial("../DiarioPessoal/Index", Model.ListaDiarioPessoal);%>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="thumbnails">
                <div class="tabbable">
                    <!-- Only required for left/right tabs -->
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab2-1" data-toggle="tab">
                            <%: Resources.Mensagem.estilo_vida %></a></li>
                        <li><a href="#tab2-2" data-toggle="tab">
                            <%: Resources.Mensagem.medicamentos_anteriores %></a></li>
                        <li><a href="#tab2-3" data-toggle="tab">
                            <%: Resources.Mensagem.medicamento_prescrito %></a></li>
                        <li><a href="#tab2-4" data-toggle="tab">
                            <%: Resources.Mensagem.medicamento_nao_prescrito %></a></li>
                    </ul> 
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab2-1">
                            <div class="thumbnail">
                                <%  Html.RenderPartial("EstiloVida", Model.EstiloVida);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2-2">
                            <div class="thumbnail">
                                <% Html.RenderPartial("MedicamentosAnteriores", Model.MedicamentosAnteriores );%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2-3">
                            <div class="thumbnail">
                                <% Html.RenderPartial("MedicamentoPrescrito", Model.MedicamentoPrescrito );%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2-4">
                            <div class="thumbnail">
                                <% Html.RenderPartial("MedicamentoNaoPrescrito", Model.MedicamentoNaoPrescrito);%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="thumbnail">
                    <% Html.RenderAction("Queixa", "Consulta", new RouteValueDictionary(new { id = Model.IdQueixa }));%>
                    <% Html.RenderAction("ListarQueixa", "Consulta", new { id = 1 });%>
                </div>
            </div>
        </div>
        <!--div class="span3 bottom">
            <p>
                   <div class="form-actions"><input class="btn btn-primary" type="submit" value="Salvar" /> </div>
            </p>
        </div-->
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </div>
</asp:Content>
