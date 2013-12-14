<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ConsultaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.consulta %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Arquivo necessário para as View partial -->
    <script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <h2>
        <%: Resources.Mensagem.consulta %></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <!-- Solução das abas 1 com jquery -->
    <input type="hidden" value="<%: ViewBag.Abas1 %>" id="abas1" />
    <script type="text/javascript">
        var abas1 = document.getElementById('abas1').value;
        if (abas1 == 1) {
            $(document).ready(function () {
                $("#li1").addClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#li5").removeClass("active"); $("#li6").removeClass("active"); $("#li7").removeClass("active"); $("#li8").removeClass("active"); $("#li9").removeClass("active"); $("#li10").removeClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane"); $("#tab1-1").addClass("tab-pane active"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");  
            });
        } else if (abas1 == 2) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").addClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#li5").removeClass("active"); $("#li6").removeClass("active"); $("#li7").removeClass("active"); $("#li8").removeClass("active"); $("#li9").removeClass("active"); $("#li10").removeClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane"); $("#tab1-2").addClass("tab-pane active"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");    
            });
        } else if (abas1 == 3) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").addClass("active"); $("#li4").removeClass("active"); $("#li5").removeClass("active"); $("#li6").removeClass("active"); $("#li7").removeClass("active"); $("#li8").removeClass("active"); $("#li9").removeClass("active"); $("#li10").removeClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane"); $("#tab1-3").addClass("tab-pane active"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");      
            });
        } else if (abas1 == 4) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").addClass("active"); $("#li5").removeClass("active"); $("#li6").removeClass("active"); $("#li7").removeClass("active"); $("#li8").removeClass("active"); $("#li9").removeClass("active"); $("#li10").removeClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane"); $("#tab1-4").addClass("tab-pane active"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");        
            });
        } else if (abas1 == 5) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#li5").addClass("active"); $("#li6").removeClass("active"); $("#li7").removeClass("active"); $("#li8").removeClass("active"); $("#li9").removeClass("active"); $("#li10").removeClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane"); $("#tab1-5").addClass("tab-pane active"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");           
            });
        } else if (abas1 == 6) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#li5").removeClass("active"); $("#li6").addClass("active"); $("#li7").removeClass("active"); $("#li8").removeClass("active"); $("#li9").removeClass("active"); $("#li10").removeClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane"); $("#tab1-6").addClass("tab-pane active"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");  
            });
        } else if (abas1 == 7) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#li5").removeClass("active"); $("#li6").removeClass("active"); $("#li7").addClass("active"); $("#li8").removeClass("active"); $("#li9").removeClass("active"); $("#li10").removeClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane"); $("#tab1-7").addClass("tab-pane active"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");  
            });
        } else if (abas1 == 8) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#li5").removeClass("active"); $("#li6").removeClass("active"); $("#li7").removeClass("active"); $("#li8").addClass("active"); $("#li9").removeClass("active"); $("#li10").removeClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane"); $("#tab1-8").addClass("tab-pane active"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");  
            });
        } else if (abas1 == 9) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#li5").removeClass("active"); $("#li6").removeClass("active"); $("#li7").removeClass("active"); $("#li8").removeClass("active"); $("#li9").addClass("active"); $("#li10").removeClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane"); $("#tab1-9").addClass("tab-pane active"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");  
            });
        } else if (abas1 == 10) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#li5").removeClass("active"); $("#li6").removeClass("active"); $("#li7").removeClass("active"); $("#li8").removeClass("active"); $("#li9").removeClass("active"); $("#li10").addClass("active"); $("#li11").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane"); $("#tab1-10").addClass("tab-pane active"); $("#tab1-11").removeClass("tab-pane active"); $("#tab1-11").addClass("tab-pane");  
            });
        } else if (abas1 == 11) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#li5").removeClass("active"); $("#li6").removeClass("active"); $("#li7").removeClass("active"); $("#li8").removeClass("active"); $("#li9").removeClass("active"); $("#li10").removeClass("active"); $("#li11").addClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); $("#tab1-5").removeClass("tab-pane active"); $("#tab1-5").addClass("tab-pane"); $("#tab1-6").removeClass("tab-pane active"); $("#tab1-6").addClass("tab-pane"); $("#tab1-7").removeClass("tab-pane active"); $("#tab1-7").addClass("tab-pane"); $("#tab1-8").removeClass("tab-pane active"); $("#tab1-8").addClass("tab-pane"); $("#tab1-9").removeClass("tab-pane active"); $("#tab1-9").addClass("tab-pane"); $("#tab1-10").removeClass("tab-pane active"); $("#tab1-10").addClass("tab-pane"); $("#tab1-11").removeClass("tab-pane"); $("#tab1-11").addClass("tab-pane active");  
            });
        }
    </script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>
            <%: Resources.Mensagem.consulta %></legend>
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

                <!-- Mudar aqui para aceitar abas -->
                <div class="thumbnail">   
                    <% foreach(var item in Model.RelatoClinico) { %>
                    <div class="tabbable">
                      
                    <ul class="nav nav-tabs">
                    <% var a = item.OrdemCronologica; %>
                        <% if (a == 1)
                           { %>
                        <li class="active"><a href="#ab1-<%: a %>" data-toggle="tab"> <%: Resources.Mensagem.relato_clinico%> <%: a%> </a></li>
                        <% }
                           else
                           { %>
                           <li><a href="#ab1-<%: a %>" data-toggle="tab"> <%: Resources.Mensagem.relato_clinico%> <%: a%> </a></li>
                        <% } %>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="ab1-<%: a %>">
                            <div class="thumbnail">
                                <% Html.RenderAction("DetailsConsulta", "RelatoClinico", new RouteValueDictionary(new { model = item }));%>
                            </div>
                        </div>
                    </div>
                    </div>
                    <% } %>
                </div>


            </div>
        </div>
        <div class="span6">
            <div class="thumbnails">
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <li id="li1" class="active"><a href="#tab1-1" data-toggle="tab"><%: Resources.Mensagem.demografico_antropometricos %></a></li>
                        <li id="li2"><a href="#tab1-2" data-toggle="tab">
                            <%: Resources.Mensagem.razao_encontro %></a></li>
                        <li id="li3"><a href="#tab1-3" data-toggle="tab">
                            <%: Resources.Mensagem.experiencia_medicamentos %></a></li>
                        <li id="li4"><a href="#tab1-4" data-toggle="tab">
                            <%: Resources.Mensagem.estilo_vida %></a></li>
                        <li id="li5"><a href="#tab1-5" data-toggle="tab">
                            <%: Resources.Mensagem.alergia %></a></li>
                        <li id="li6"><a href="#tab1-6" data-toggle="tab">
                            <%: Resources.Mensagem.medicamento_prescrito %></a></li>
                        <li id="li7"><a href="#tab1-7" data-toggle="tab">
                            <%: Resources.Mensagem.medicamento_nao_prescrito %></a></li>
                        <li id="li8"><a href="#tab1-8" data-toggle="tab">
                            <%: Resources.Mensagem.medicamentos_anteriores %></a></li>
                        <li id="li9"><a href="#tab1-9" data-toggle="tab">
                            <%: Resources.Mensagem.historia %></a></li>
                        <li id="li10"><a href="#tab1-10" data-toggle="tab">
                            <%: Resources.Mensagem.exames_fisicos %></a></li>
                            <li id="li11"><a href="#tab1-11" data-toggle="tab">
                            <%: Resources.Mensagem.parametro_clinico %></a></li>
                            <li id="li12"><a href="#tab1-12" data-toggle="tab">
                            <%: Resources.Mensagem.revisao_sistemas %></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1-1">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../DemograficosAntropometicos/Edit", Model.DemograficoAntropometrico);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-2">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../ConsultaVariavel/Edit", Model.ConsultaVariavel);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-3">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../ExperienciaMedicamentos/Edit", Model.ExperienciaMedicamentos);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-4">
                            <div class="thumbnail">
                                <%  Html.RenderPartial("../EstiloVida/Edit", Model.EstiloVida);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-5">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../ExamesFisicos/AdicionarAlergia", Model.AlergiaExamesFisicos);%>
                                <% Html.RenderPartial("../ExamesFisicos/ListaAlergias", Model.ListaAlergia);%>
                                
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-6">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../MedicamentoPrescrito/Create", Model.MedicamentoPrescrito);%>
                                <% Html.RenderPartial("../MedicamentoPrescrito/Index", Model.ListaMedicamentoPrescrito);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-7">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../MedicamentoNaoPrescrito/Create", Model.MedicamentoNaoPrescrito);%>
                                <% Html.RenderPartial("../MedicamentoNaoPrescrito/Index", Model.ListaMedicamentoNaoPrescrito);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-8">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../MedicamentosAnteriores/Create", Model.MedicamentosAnteriores);%>
                                <% Html.RenderPartial("../MedicamentosAnteriores/Index", Model.ListaMedicamentosAnteriores);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-9">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../Historia/Edit", Model.Historia);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-10">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../ExamesFisicos/Edit", Model.ExamesFisicos);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-11">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../ConsultaParametro/Create", Model.ConsultaParametro);%>
                                <% Html.RenderPartial("../ConsultaParametro/Index", Model.ListaConsultaParametro);%>
                            </div>
                        </div>
                        
                        <div class="tab-pane" id="tab1-12">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../ConsultaVariavelQueixa/Create", Model.ConsultaVariavelQueixa);%>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        </div>
    </fieldset>
    <% } %>
    <style type="text/css">
        #botaopos
        {
            position: relative;
            left: 96%;
            top: 80%;
            margin-left: -110px;
            margin-top: -40px;
        }
    </style>
    <div class="btn btn-large btn-primary">
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index", null, new { @style = "color:White; font-size:small;"}) %>
    </div>
    <div class="btn btn-large btn-primary" id="botaopos">
        <%: Html.ActionLink(Resources.Mensagem.proximo, "Edit2", "Consulta", Model.ConsultaVariavel.IdConsultaVariavel, new { @style = "color:White; font-size:small;"})%>
    </div>
    <p>
    <br/><br/>
    </p>
    <div class="btn btn-large btn-primary" id="Div1">
        <%: Html.ActionLink(Resources.Mensagem.concluir, "Concluir", "Consulta", Model.ConsultaVariavel.IdConsultaVariavel, new { @style = "color:White; font-size:small;", onclick = ("return confirm('Deseja realmente Concluir esta Consulta?')") })%>
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
            });//.datepicker('setDate', 'today');
        });
    </script>
</asp:Content>
