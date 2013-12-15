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
        <%: Resources.Mensagem.consulta2 %></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
    </script>

    <!--input type="hidden" value="<!--%: ViewBag.AncoraEdit2 %>" id="ancoraEdit2" />
        <script type="text/javascript">
            var ancoraEdit2 = document.getElementById('ancoraEdit2').value;
            if (ancoraEdit2 == 1) {
                location.href = "#ancora1";
            } else if (ancoraEdit2 == 2) {
                location.href = "#ancora2";
            } else if (ancoraEdit2 == 3) {
                location.href = "#ancora3";
            }
        </script-->

    <script type="text/javascript">
        $(document).ready(function () {
            $(".botaoMostrar").click(function () {
                $(".mostrarQueixa").slideToggle(1200);
            });
        });
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".botaoMostrar").mouseover(function () {
                $(this).css("color", "#2162A3");
            }),
          $(".botaoMostrar").mouseout(function () {
              $(this).css("color", "#2E8AE6");
          });
        });
    </script>
    <style type="text/css">
        .mostrarQueixa
        {
            display: none;
        }
    </style>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>
            <%: Resources.Mensagem.consulta2 %></legend>
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
                <legend></legend>
                <div class="thumbnail">
                    <div class="tabbable">
                        <ul class="nav nav-tabs">
                        <% foreach(var item in Model.RelatoClinico) { %>
                        <% var a = item.OrdemCronologica; %>
                            <% if (a == 1)
                               { %>
                            <li id="li0<%: a %>" class="active"><a href="#ab1-<%: a %>" data-toggle="tab"> <%: Resources.Mensagem.relato_clinico%> <%: a%> </a></li>
                            <% }else{ %>
                               <li id="li0<%: a %>"><a href="#ab1-<%: a %>" data-toggle="tab"> <%: Resources.Mensagem.relato_clinico%> <%: a%> </a></li>
                            <% } %>
                        <% } %>
                        </ul>
                        <div class="tab-content">
                            <% foreach(var item in Model.RelatoClinico) { %>
                            <% var a = item.OrdemCronologica; %>
                            <div class="tab-pane active" id="ab1-<%: a %>">
                                <div class="thumbnail">
                                    <% Html.RenderAction("DetailsConsulta", "RelatoClinico", new RouteValueDictionary(new { model = item }));%>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="thumbnails">
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <li id="li1" class="active"><a href="#tab1-1" data-toggle="tab"><%: Resources.Mensagem.diario_pessoal %></a></li>
                        <li id="li2"><a href="#tab1-2" data-toggle="tab">
                            <%: Resources.Mensagem.revisao_sistemas %></a></li>
                        <li id="li3"><a href="#tab1-3" data-toggle="tab">
                            <%: Resources.Mensagem.intervencao %></a></li>
                        <li id="li4"><a href="#tab1-4" data-toggle="tab">
                            <%: Resources.Mensagem.carta %></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1-1">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../DiarioPessoal/Create", Model.DiarioPessoal);%>
                                <% Html.RenderPartial("../DiarioPessoal/Index", Model.ListaDiarioPessoal);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-2">
                            <div class="thumbnail">
                            <% Html.RenderPartial("../ConsultaVariavelQueixa/Index", Model.ListaConsultaVariavelQueixa);%>
                            <div class="mostrarQueixa">
                                <% Html.RenderPartial("../QueixaMedicamento/Create", Model.QueixaMedicamento);%>
                            </div>
                            <% Html.RenderPartial("../QueixaMedicamento/Index", Model.ListaQueixaMedicamento);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-3">
                            <div class="thumbnail">
                            <% Html.RenderPartial("../IntervencaoConsulta/Create", Model.IntervencaoConsulta);%>
                            <% Html.RenderPartial("../IntervencaoConsulta/Index", Model.ListaIntervencaoConsulta);%>
                        </div>
                        </div>
                        <div class="tab-pane" id="tab1-4">
                            <div class="thumbnail">
                            <% Html.RenderPartial("../Carta/Create", Model.Carta);%>
                            <% Html.RenderPartial("../Carta/Index", Model.ListaCarta);%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
    <% } %>
    <div class="btn btn-large btn-primary">
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit", "Consulta", Model.ConsultaVariavel.IdConsultaVariavel, new { @style = "color:White; font-size:small;" })%>
    </div>
    <p>
    <br/><br/>
    </p>
    <div class="btn btn-large btn-primary" id="Div1">
        <%: Html.ActionLink(Resources.Mensagem.concluir, "Concluir", "Consulta", Model.ConsultaVariavel.IdConsultaVariavel, new { @style = "color:White; font-size:small;", onclick = ("return confirm('Deseja realmente Concluir esta Consulta?')") })%>
    </div>

    <!-- Abas dos Relatos -->
    <input type="hidden" value="<%: ViewBag.AbasRelato %>" id="abasRelato" />
    <script type="text/javascript">
        var abasRelato = document.getElementById('abasRelato').value;
        if (abasRelato == 2) {
            $(document).ready(function () {
                $("#li01").removeClass("active"); $("#li02").addClass("active"); $("#li03").removeClass("active"); $("#li04").removeClass("active"); $("#ab1-1").removeClass("tab-pane active"); $("#ab1-1").addClass("tab-pane"); $("#ab1-2").removeClass("tab-pane"); $("#ab1-2").addClass("tab-pane active"); $("#ab1-3").removeClass("tab-pane active"); $("#ab1-3").addClass("tab-pane"); $("#ab1-4").removeClass("tab-pane active"); $("#ab1-4").addClass("tab-pane");
            });
        } else if (abasRelato == 3) {
            $(document).ready(function () {
                $("#li01").removeClass("active"); $("#li02").removeClass("active"); $("#li03").addClass("active"); $("#li04").removeClass("active"); $("#ab1-1").removeClass("tab-pane active"); $("#ab1-1").addClass("tab-pane"); $("#ab1-2").removeClass("tab-pane active"); $("#ab1-2").addClass("tab-pane"); $("#ab1-3").removeClass("tab-pane"); $("#ab1-3").addClass("tab-pane active"); $("#ab1-4").removeClass("tab-pane active"); $("#ab1-4").addClass("tab-pane");
            });
        } else if (abasRelato == 4) {
            $(document).ready(function () {
                $("#li01").removeClass("active"); $("#li02").removeClass("active"); $("#li03").removeClass("active"); $("#li04").addClass("active"); $("#ab1-1").removeClass("tab-pane active"); $("#ab1-1").addClass("tab-pane"); $("#ab1-2").removeClass("tab-pane active"); $("#ab1-2").addClass("tab-pane"); $("#ab1-3").removeClass("tab-pane active"); $("#ab1-3").addClass("tab-pane"); $("#ab1-4").removeClass("tab-pane"); $("#ab1-4").addClass("tab-pane active");
            });
        }
    </script>

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
