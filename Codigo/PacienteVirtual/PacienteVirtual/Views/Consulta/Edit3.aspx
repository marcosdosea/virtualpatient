<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Views/Shared/Site.Master"
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
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <div class="span5">
            <div class="thumbnails center">
                <div class="row-fluid">
                <div class="span6">
                    <div class="thumbnail">
                        <img class="media" id="Img1" src="<%: Url.Action("GetImage", "Paciente",new { id = Model.Paciente.IdPaciente}) %>"
                            alt="Definir Imagem Padrão" style="width: 100px; height: 100px;" />
                    </div>
                </div>
                <div class="span6">
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
                </div>
                <div class="thumbnail">
                    <div class="tabbable">
                        <ul class="nav nav-tabs">
                        <!-- Solução das abas dos relatos -->
                        <% foreach(var item in Model.RelatoClinico) { %>
                        <!-- Adicionando ou removendo a classe que ativa as abas nos relatos de acordo com a ordem cronologica. Este método é complementado com um código javascript no final deste código. -->
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
            <p>
               [ <%: Html.ActionLink(Resources.Mensagem.escolher_outro_paciente, "Index", "Consulta", new { idConsultaVariavel = Model.ConsultaVariavel.IdConsultaVariavel }, new { @style = "font-size:small;", onclick = ("return confirm('Você retornará a tela de exibição dos pacientes. Todas as informações desse paciente que não foram salvas serão perdidas. Confirma saída?')") })%> ] 
               [ <%: Html.ActionLink(Resources.Mensagem.etapa_anterior, "Edit2", "Consulta", new { idConsultaVariavel = Model.ConsultaVariavel.IdConsultaVariavel }, new { @style = "font-size:small;" })%> ]
            <% if (!Session["_Roles"].Equals("tutor"))
               { %>   
               <!-- Os números 3, 4, 5 e 7, são os id dos estados da consulta os quais as descrições encontram-se no Models/Global.cs -->
                <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
               { %>
                    [ <%: Html.ActionLink(Resources.Mensagem.encerrar_consulta, "Concluir", "Consulta", new { IdConsultaVariavel = Model.ConsultaVariavel.IdConsultaVariavel }, new { @style = "font-size:small;", onclick = ("return exibirConfirmacoes()") })%> ]
                <% } %>
            <% } %>
            <% if (Session["_Roles"].Equals("tutor") && Session["_TutorVisualizaConsultas"].Equals(true))
               { %>
                   [ <%: Html.ActionLink(Resources.Mensagem.enviar_para_correcao_do_aluno, "EnviarParaCorrecao", "CorrigirConsultas", new { idConsultaVariavel = Model.ConsultaVariavel.IdConsultaVariavel }, new { @style = "font-size:small;", onclick = ("return confirm('Deseja realmente Enviar esta Consulta para CORREÇÃO do Aluno?')") })%> ]
                   [ <%: Html.ActionLink(Resources.Mensagem.finalizar_correcao, "FinalizarCorrecao", "CorrigirConsultas", new { idConsultaVariavel = Model.ConsultaVariavel.IdConsultaVariavel }, new { @style = "font-size:small;", onclick = ("return confirm('Deseja realmente Finalizar esta consulta?')") })%> ] 
            <% } %>
            </p>
            <div class="thumbnails">
                <div class="tabbable">
                    <div class="nomeConsulta">
                            <br />
                        <%: Resources.Mensagem.etapa_5_evolucao_avaliacao%>
                    </div>
                    <br /> 
                    <div class="thumbnail">
                    <% Html.RenderPartial("../DadosComplementares/EditEnfermagem", Model.ConsultaVariavel);%>
                </div>
                </div>
            </div>
        </div>
    </fieldset>
    <% } %>
    <style type="text/css">
        #botoesRodape
        {
            position: relative;
            margin-left: 35%;
        }
        .nomeConsulta
        {
            position: relative;
            font-size: x-large;
            color: Blue;
        }
    </style>

     <!-- Código Javascript para confirmações do botão de Finalizar consulta para o aluno -->
    <script type="text/javascript">
        function exibirConfirmacoes() {
            var x;
            var r = confirm("Deseja finalizar as etapas do processo de enfermagem desse paciente? Após a finalização suas respostas serão enviadas para correção pelo tutor.");
            if (r == true) {
                alert("Parabéns!!!\nVocê cumpriu todas as etapas do processo de enfermagem.\nSuas respostas serão enviadas para correções pelo tutor. Assim que o tutor finalizar as correções você será notificado por email da avaliação realizada e possíveis correções a serem realizadas.");
                return true;
            } else {
                return false;
            }
        }
    </script>

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
</asp:Content>
