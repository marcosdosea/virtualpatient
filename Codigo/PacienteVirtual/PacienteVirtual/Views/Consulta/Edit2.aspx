﻿<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ConsultaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Arquivo necessário para as View partial -->
    <script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
    </script>

    <!-- Solução das abas 2 com jquery -->
    <input type="hidden" value="<%: ViewBag.Abas2 %>" id="abas2" />
    <script type="text/javascript">
        var abas2 = document.getElementById('abas2').value;
        if (abas2 == 1) {
            $(document).ready(function () {
                $("#li1").addClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#tab1-1").removeClass("tab-pane"); $("#tab1-1").addClass("tab-pane active"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane"); 
            });
        } else if (abas2 == 2) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").addClass("active"); $("#li3").removeClass("active"); $("#li4").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane"); $("#tab1-2").addClass("tab-pane active"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane");
            });
        } else if (abas2 == 3) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").addClass("active"); $("#li4").removeClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane"); $("#tab1-3").addClass("tab-pane active"); $("#tab1-4").removeClass("tab-pane active"); $("#tab1-4").addClass("tab-pane");
            });
        } else if (abas2 == 4) {
            $(document).ready(function () {
                $("#li1").removeClass("active"); $("#li2").removeClass("active"); $("#li3").removeClass("active"); $("#li4").addClass("active"); $("#tab1-1").removeClass("tab-pane active"); $("#tab1-1").addClass("tab-pane"); $("#tab1-2").removeClass("tab-pane active"); $("#tab1-2").addClass("tab-pane"); $("#tab1-3").removeClass("tab-pane active"); $("#tab1-3").addClass("tab-pane"); $("#tab1-4").removeClass("tab-pane"); $("#tab1-4").addClass("tab-pane active");
            });
        }
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
        #nomeConsulta
        {
            font-size: small;
            font-weight: bolder;
        }
    </style>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend id="nomeConsulta">
            <%: Resources.Mensagem.consulta2 %> - <%: Resources.Mensagem.usuario %>: <%: Model.ConsultaVariavel.NomePessoa %></legend>
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
                </div><div class="tab-content" id="desabilitarComentariosTutor">
                    <div class="thumbnail">
                        <% Html.RenderPartial("../CorrigirConsultas/ComentariosTutor", Model.ConsultaVariavel);%>
                    </div>
                </div>

            </div>
        </div>
        <div class="span6">
            <div class="thumbnails">
                <% if (ViewBag.Curso.Equals("Bacharelado em Farmácia"))
                           { %>
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <li id="li1" class="active"><a href="#tab1-1" data-toggle="tab"><%: Resources.Mensagem.classificacao_de_prm%></a></li>
                        <li id="li2"><a href="#tab1-2" data-toggle="tab">
                            <%: Resources.Mensagem.intervencoes%></a></li>
                        <li id="li3"><a href="#tab1-3" data-toggle="tab">
                            <%: Resources.Mensagem.carta%></a></li>
                        <li id="li4"><a href="#tab1-4" data-toggle="tab">
                            <%: Resources.Mensagem.diario_pessoal_medicamentos%></a></li>
                    </ul>
                    <div class="tab-content" id="desabilitar">
                        <div class="tab-pane active" id="tab1-1">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../ConsultaVariavelQueixa/Index", Model.ListaConsultaVariavelQueixa);%>
                            </div>
                            <div class="thumbnail">
                            <div class="mostrarQueixa">
                                <% Html.RenderPartial("../QueixaMedicamento/Create", Model.QueixaMedicamento);%>
                            </div>
                            <% Html.RenderPartial("../QueixaMedicamento/Index", Model.ListaQueixaMedicamento);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-2">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../IntervencaoConsulta/Create", Model.IntervencaoConsulta);%>
                                <% Html.RenderPartial("../IntervencaoConsulta/Index", Model.ListaIntervencaoConsulta);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-3">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../Carta/Create", Model.Carta);%>
                                <% Html.RenderPartial("../Carta/Index", Model.ListaCarta);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-4">
                            <div class="thumbnail">
                            <% Html.RenderPartial("../DiarioPessoal/Create", Model.DiarioPessoal);%>
                            <% Html.RenderPartial("../DiarioPessoal/Index", Model.ListaDiarioPessoal);%>
                            </div>
                        </div>
                    </div>
                </div>
               <% } %>
            </div>
        </div>
    </fieldset>

    <% } %>
    <div id="botoesRodape">
        <div class="btn btn-large btn-primary">
            <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit", "Consulta", Model.ConsultaVariavel.IdConsultaVariavel, new { @style = "color:White; font-size:small;" })%>
        </div>
        &nbsp;
        <% if (!Session["_Roles"].Equals("tutor"))
           { %>   
            <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
           { %>
            <div class="btn btn-large btn-primary">
                <%: Html.ActionLink(Resources.Mensagem.encerrar_consulta, "Concluir", "Consulta", Model.ConsultaVariavel.IdConsultaVariavel, new { @style = "color:White; font-size:small;", onclick = ("return confirm('Deseja realmente Encerrar esta Consulta?')") })%>
            </div>
            <% } %>
        <% } %>
        <% if (Session["_Roles"].Equals("tutor") && Session["_TutorVisualizaConsultas"].Equals(true))
           { %>
           &nbsp;
           <div class="btn btn-large btn-primary">
               <%: Html.ActionLink(Resources.Mensagem.enviar_para_correcao_do_aluno, "EnviarParaCorrecao", "CorrigirConsultas", Model.ConsultaVariavel.IdConsultaVariavel, new { @style = "color:White; font-size:small;", onclick = ("return confirm('Deseja realmente Enviar esta Consulta para CORREÇÃO do Aluno?')") })%>
           </div>
           &nbsp;
           <div class="btn btn-large btn-primary">
               <%: Html.ActionLink(Resources.Mensagem.finalizar_correcao, "FinalizarCorrecao", "CorrigirConsultas", Model.ConsultaVariavel.IdConsultaVariavel, new { @style = "color:White; font-size:small;", onclick = ("return confirm('Deseja realmente Finalizar esta consulta?')") })%>
           </div>
        <% } %>
    </div>
    <style>
        #botoesRodape
        {
            position: relative;
            margin-left: 35%;
        }
    </style>

    <!-- Metodo Javascript para desabilitar todos os campos do formulario caso seja tutor -->
    <input type="hidden" value="<%: Session["_Roles"] %>" id="perfil" />
    <input type="hidden" value="<%: Session["_IdEstadoConsulta"] %>" id="IdEstadoConsulta" />
    <script type="text/javascript">
        var idEstadoConsulta = document.getElementById('IdEstadoConsulta').value;
        var perfil = document.getElementById('perfil').value;
        if (perfil == "tutor") {
            //habilitar para tutor corrigir e comentarios do tutor
            $("#desabilitar *").attr("disabled", "disabled").off('click');
        } else if (perfil == "usuario") {
            if (idEstadoConsulta == 3 || idEstadoConsulta == 4 || idEstadoConsulta == 5 || idEstadoConsulta == 7) {
                $("#desabilitar *").attr("disabled", "disabled").off('click');
            }
        }
    </script>
    <script type="text/javascript">
        //desabilitar comentarios do tutor
        var idEstadoConsulta = document.getElementById('IdEstadoConsulta').value;
        var perfil = document.getElementById('perfil').value;
        if (!(perfil == "tutor" && idEstadoConsulta == 5)) {
            $("#desabilitarComentariosTutor *").attr("disabled", "disabled").off('click');
        } else if (perfil == "usuario") {
            $("#desabilitarComentariosTutor *").attr("disabled", "disabled").off('click');
        }
    </script>

    <!-- Abas dos Relatos -->
    <input type="hidden" value="<%: ViewBag.AbasRelato %>" id="abasRelato" />
    <script type="text/javascript">
        var abasRelato = document.getElementById('abasRelato').value
        $(document).ready(function () {
            if (abasRelato != 1) {
                var abaLI1 = "#li0";
                var contLI1 = "#ab1-";
                for (var i = 1; i <= abasRelato; i++) {
                    var resultAbaLI = abaLI1.concat(i);
                    var resultContLI = contLI1.concat(i);

                    $(resultAbaLI).removeClass("active");
                    $(resultContLI).removeClass("tab-pane active");
                    $(resultContLI).addClass("tab-pane");

                }
                var resultAbaLI = abaLI1.concat(abasRelato);
                var resultContLI = contLI1.concat(abasRelato);
                $(resultAbaLI).addClass("active");
                $(resultContLI).addClass("tab-pane active");
                $(resultContLI).removeClass("tab-pane");
            }
        });
    </script>
    <script type="text/javascript">
        var abasRelato = document.getElementById('abasRelato').value
        $(document).ready(function () {
            var abaLI2 = "#li0";
            var contLI2 = "#ab1-";
            for (var i = 0; i < abasRelato; i++) {
                var resultAbaLI2 = abaLI2.concat(i);
                $(resultAbaLI2).click(function () {
                    var resultContLI2 = contLI2.concat(abasRelato);
                    $(resultContLI2).hide();
                });
            }
            var resultAbaAtual2 = abaLI2.concat(abasRelato);
            $(resultAbaAtual2).click(function () {
                var resultContAba2 = contLI2.concat(abasRelato);
                $(resultContAba2).show();
            });
        });
    </script>
    <!-- FIM das Abas dos Relatos -->

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
