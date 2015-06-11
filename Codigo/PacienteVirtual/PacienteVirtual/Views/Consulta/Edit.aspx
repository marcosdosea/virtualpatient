<%@Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Views/Shared/Site.Master"
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
                </div>
                <div id="desabilitarComentariosTutor">
                    <div class="thumbnail">
                        <% Html.RenderPartial("../CorrigirConsultas/ComentariosTutor", Model.ConsultaVariavel);%>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <% if (ViewBag.Curso.Equals("Bacharelado em Enfermagem"))
                           { %><div id="nomeConsulta">
                <%: Resources.Mensagem.etapa_1_investigacao%></div>
                    <br /> 
	     <% } %>
            <div class="thumbnails">
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <% if (ViewBag.Curso.Equals("Bacharelado em Farmácia"))
                           { %>
                        <li id="li1" class="active"><a href="#tab1-1" data-toggle="tab">
                        <%: Resources.Mensagem.demografico_antropometricos%></a></li>
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
                        <li id="li13"><a href="#tab1-13" data-toggle="tab">
                            <%: Resources.Mensagem.links_uteis %></a></li>
                        <% }
                           else if (ViewBag.Curso.Equals("Bacharelado em Enfermagem"))
                           { %>
                            <li id="li1" class="active"><a href="#tab1-1" data-toggle="tab">
                            <%: Resources.Mensagem.dados_identificacao%></a></li>
                            <li id="li2"><a href="#tab1-2" data-toggle="tab">
                            <%: Resources.Mensagem.clinico_internacao %></a></li>
                            <li id="li3"><a href="#tab1-3" data-toggle="tab">
                            <%: Resources.Mensagem.percepcao_expectativas_paciente %></a></li>
                            <li id="li4"><a href="#tab1-4" data-toggle="tab">
                            <%: Resources.Mensagem.consciencia %></a></li>
                            <li id="li5"><a href="#tab1-5" data-toggle="tab">
                            <%: Resources.Mensagem.necessidades_psicobiologicas %></a></li>   
                            <li id="li6"><a href="#tab1-6" data-toggle="tab">
                            <%: Resources.Mensagem.necessidades_psicossociais %></a></li> 
                            <li id="li7"><a href="#tab1-7" data-toggle="tab">
                            <%: Resources.Mensagem.necessidades_psicoespirituais %></a></li>
                            <li id="li8"><a href="#tab1-8" data-toggle="tab">
                            <%: Resources.Mensagem.outras_necessidades %></a></li> 
                            <li id="li9"><a href="#tab1-9" data-toggle="tab">
                            <%: Resources.Mensagem.dados_complementares %></a></li>
                            <li id="li10"><a href="#tab1-10" data-toggle="tab">
                            <%: Resources.Mensagem.outros_achados %></a></li>
                          <% } %>
                    </ul>
                    <div class="tab-content" id="desabilitar">
                        <% if (ViewBag.Curso.Equals("Bacharelado em Farmácia") || ViewBag.Curso.Equals("Bacharelado em Enfermagem"))
                           { %>
                        <div class="tab-pane active" id="tab1-1">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../DemograficosAntropometicos/Edit", Model.DemograficoAntropometrico);%>
                            </div>
                        </div>
                        <% } %>
                        <% if (ViewBag.Curso.Equals("Bacharelado em Farmácia"))
                           { %>
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
                                <% Html.RenderPartial("../ConsultaVariavelQueixa/Index", Model.ListaConsultaVariavelQueixa);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-13">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../Consulta/Links");%>
                            </div>
                        </div>
                        <% }
                           else if (ViewBag.Curso.Equals("Bacharelado em Enfermagem"))
                           { %>
                        <div class="tab-pane" id="tab1-2">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../ClinicoInternacao/Edit", Model.ClinicoInternacao);%>
                                <% Html.RenderPartial("../ClinicoInternacao/AdicionarPatologiasAtuais", Model.PatologiasAtuais);%>
                                <% Html.RenderPartial("../ClinicoInternacao/ListaPatologiasAtuais", Model.ListaPatologiasAtuais);%>
                                <% Html.RenderPartial("../ClinicoInternacao/AdicionarAntecedentesPatologicos", Model.AntecedentesPatologicos);%>
                                <% Html.RenderPartial("../ClinicoInternacao/ListaAntecedentesPatologicos", Model.ListaAntecedentesPatologicos);%>
                                <% Html.RenderPartial("../ClinicoInternacao/AdicionarAntecedentesFamiliares", Model.AntecedentesFamiliares);%>
                                <% Html.RenderPartial("../ClinicoInternacao/ListaAntecedentesFamiliares", Model.ListaAntecedentesFamiliares);%>
                                <% Html.RenderPartial("../ClinicoInternacao/AdicionarClinicoInternacaoAlergias", Model.ClinicoInternacaoAlergias);%>
                                <% Html.RenderPartial("../ClinicoInternacao/ListaClinicoInternacaoAlergias", Model.ListaClinicoInternacaoAlergias);%>
                            </div>    
                        </div>
                        <div class="tab-pane" id="tab1-3">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../PercepcaoExpectativas/Edit", Model.PercepcaoExpectativas);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-4">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../Consciencia/Edit", Model.Consciencia);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-5">
                            <div class="tabbable">
                                <ul class="nav nav-tabs">    
                                    <li id="li51" class="active"><a href="#tab1-51" data-toggle="tab"><%: Resources.Mensagem.oxigenacao%></a></li>
                                    <li id="li52"><a href="#tab1-52" data-toggle="tab"><%: Resources.Mensagem.circulacao %></a></li>
                                    <li id="li53"><a href="#tab1-53" data-toggle="tab"><%: Resources.Mensagem.termorregulacao %></a></li>
                                    <li id="li54"><a href="#tab1-54" data-toggle="tab"><%: Resources.Mensagem.higiene %></a></li>
                                    <li id="li55"><a href="#tab1-55" data-toggle="tab"><%: Resources.Mensagem.nutricao %></a></li>
                                    <li id="li56"><a href="#tab1-56" data-toggle="tab"><%: Resources.Mensagem.integridade_tecidual %></a></li>
                                    <li id="li57"><a href="#tab1-57" data-toggle="tab"><%: Resources.Mensagem.eliminacao %></a></li>
                                    <li id="li58"><a href="#tab1-58" data-toggle="tab"><%: Resources.Mensagem.sensorial %></a></li>
                                    <li id="li59"><a href="#tab1-59" data-toggle="tab"><%: Resources.Mensagem.sexualidade %></a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab1-51">
                                        <div class="thumbnail">
                                            <% Html.RenderPartial("../Oxigenacao/Edit", Model.Oxigenacao);%>
                                        </div>    
                                    </div>
                                    <div class="tab-pane" id="tab1-52">
                                        <div class="thumbnail">
                                            <% Html.RenderPartial("../Circulacao/Edit", Model.Circulacao);%>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab1-53">
                                        <div class="thumbnail">
                                            <% Html.RenderPartial("../Termorregulacao/Edit", Model.Termorregulacao);%>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab1-54">
                                        <div class="thumbnail">
                                            <% Html.RenderPartial("../Higiene/Edit", Model.Higiene);%>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab1-55">
                                        <div class="thumbnail">
                                            <% Html.RenderPartial("../Nutricao/Edit", Model.Nutricao);%>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab1-56">
                                        <div class="thumbnail">
                                            <% Html.RenderPartial("../IntegridadeTecidual/Edit", Model.IntegridadeTecidual);%>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab1-57">
                                        <div class="thumbnail">
                                            <% Html.RenderPartial("../Eliminacao/Edit", Model.Eliminacao);%>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab1-58">
                                        <div class="thumbnail">
                                            <% Html.RenderPartial("../Sensorial/Edit", Model.Sensorial);%>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab1-59">
                                        <div class="thumbnail">
                                            <% Html.RenderPartial("../Sexualidade/Edit", Model.Sexualidade);%>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </div>
                        <div class="tab-pane" id="tab1-6">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../Comunicacao/Edit", Model.Comunicacao);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-7">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../PsicoEspiritual/Edit", Model.PsicoEspiritual);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-8">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../OutrasNecessidades/Edit", Model.OutrasNecessidades);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-9">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../DadosComplementares/Edit", Model.ConsultaVariavel);%>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab1-10">
                            <div class="thumbnail">
                                <% Html.RenderPartial("../OutrosAchados/Edit", Model.ConsultaVariavel);%>
                            </div>
                        </div>
                        <% } %>
                </div>
            </div>
        </div>
        <br />
        <div class="btn btn-large btn-primary">
            <%: Html.ActionLink(Resources.Mensagem.proximo, "Edit2", "Consulta", new { idConsultaVariavel = Model.ConsultaVariavel.IdConsultaVariavel }, new { @style = "color:White; font-size:small;" })%>
        </div>
        <% if (Session["_Roles"].Equals("tutor") && Session["_TutorVisualizaConsultas"].Equals(true))
           { %>
           &nbsp;
           <div class="btn btn-large btn-primary">
               <%: Html.ActionLink(Resources.Mensagem.enviar_para_correcao_do_aluno, "EnviarParaCorrecao", "CorrigirConsultas", new { idConsultaVariavel = Model.ConsultaVariavel.IdConsultaVariavel }, new { @style = "color:White; font-size:small;", onclick = ("return confirm('Deseja realmente Enviar esta Consulta para CORREÇÃO do Aluno?')") })%>
           </div>
           &nbsp;
           <div class="btn btn-large btn-primary">
               <%: Html.ActionLink(Resources.Mensagem.finalizar_correcao, "FinalizarCorrecao", "CorrigirConsultas", new { idConsultaVariavel = Model.ConsultaVariavel.IdConsultaVariavel }, new { @style = "color:White; font-size:small;", onclick = ("return confirm('Deseja realmente Finalizar esta consulta?')") })%>
           </div>
        <% } %>
        </div>
    </fieldset>
    <% } %>
    <!-- Código Javascript para desabilitar todos os campos do formulario caso seja tutor -->
    <!-- Passando o perfil do usuario e o id do estado da consulta, da viewbag para dentro do código javascript através do id -->
    <input type="hidden" value="<%: Session["_Roles"] %>" id="perfil" />
    <input type="hidden" value="<%: Session["_IdEstadoConsulta"] %>" id="IdEstadoConsulta" />
    <script type="text/javascript">
        var idEstadoConsulta = document.getElementById('IdEstadoConsulta').value;
        var perfil = document.getElementById('perfil').value;
        if (perfil == "tutor") {
            //método que habilita para tutor corrigir e comentarios do tutor
            $("#desabilitar *").attr("disabled", "disabled").off('click');
        } else if (perfil == "usuario") {
            //Os números 3, 4, 5 e 7, são os id dos estados da consulta os quais as descrições encontram-se no Models/Global.cs
            if (idEstadoConsulta == 3 || idEstadoConsulta == 4 || idEstadoConsulta == 5 || idEstadoConsulta == 7) {
                $("#desabilitar *").attr("disabled", "disabled").off('click');
            }
        }
    </script>
    <!-- Código Javascript para desabilitar o campo de comentários, caso seja tutor -->
    <script type="text/javascript">
        var idEstadoConsulta = document.getElementById('IdEstadoConsulta').value;
        var perfil = document.getElementById('perfil').value;
        if (!(perfil == "tutor" && idEstadoConsulta == 5)) {
            $("#desabilitarComentariosTutor *").attr("disabled", "disabled").off('click');
        } else if (perfil == "usuario") {
            $("#desabilitarComentariosTutor *").attr("disabled", "disabled").off('click');
        }
    </script>

    <!-- Posicionamento e estilos dos botões desta página. -->
    <style>
        #botoes
        {
            position: relative;
            margin-left: 35%;
        }
        #botaopos
        {
            position: relative;
            left: 96%;
            top: 80%;
            margin-left: -110px;
            margin-top: -40px;
        }
        #nomeConsulta
        {
            position: relative;
            font-size: x-large;
            color: Blue;
        }
    </style>

    <!-- Código javascript para as Abas dentro das outras abas de enfermagem -->
    <!-- Passando o valor das abas, da viewbag para dentro do código javascript através do id -->
    <input type="hidden" value="<%: ViewBag.AbasDentro %>" id="AbasDentro" />
    <script type="text/javascript">
        var abasDentro = document.getElementById('AbasDentro').value;
        if (abasDentro != 0) {
            if (abasDentro == 51) {
                $(document).ready(function () {
                    $("#li51").addClass("active"); $("#li52").removeClass("active"); $("#li53").removeClass("active"); $("#tab1-51").removeClass("tab-pane"); $("#tab1-51").addClass("tab-pane active"); $("#tab1-52").removeClass("tab-pane active"); $("#tab1-52").addClass("tab-pane"); $("#tab1-53").removeClass("tab-pane active"); $("#tab1-53").addClass("tab-pane");
                });
            } else if (abasDentro == 52) {
                $(document).ready(function () {
                    $("#li51").removeClass("active"); $("#li52").addClass("active"); $("#li53").removeClass("active"); $("#tab1-51").removeClass("tab-pane active"); $("#tab1-51").addClass("tab-pane"); $("#tab1-52").removeClass("tab-pane"); $("#tab1-52").addClass("tab-pane active"); $("#tab1-53").removeClass("tab-pane active"); $("#tab1-53").addClass("tab-pane");
                });
            } else if (abasDentro == 53) {
                $(document).ready(function () {
                    $("#li51").removeClass("active"); $("#li52").removeClass("active"); $("#li53").addClass("active"); $("#tab1-51").removeClass("tab-pane active"); $("#tab1-51").addClass("tab-pane"); $("#tab1-52").removeClass("tab-pane active"); $("#tab1-52").addClass("tab-pane"); $("#tab1-53").removeClass("tab-pane"); $("#tab1-53").addClass("tab-pane active");
                });
            } else if (abasDentro == 54) {
                $(document).ready(function () {
                    $("#li51").removeClass("active"); $("#li52").removeClass("active"); $("#li53").removeClass("active"); $("#li54").addClass("active"); $("#tab1-51").removeClass("tab-pane active"); $("#tab1-51").addClass("tab-pane"); $("#tab1-52").removeClass("tab-pane active"); $("#tab1-52").addClass("tab-pane"); $("#tab1-53").removeClass("tab-pane active"); $("#tab1-53").addClass("tab-pane"); $("#tab1-54").removeClass("tab-pane"); $("#tab1-54").addClass("tab-pane active");
                });
            } else if (abasDentro == 55) {
                $(document).ready(function () {
                    $("#li51").removeClass("active"); $("#li52").removeClass("active"); $("#li53").removeClass("active"); $("#li54").removeClass("active"); $("#li55").addClass("active"); $("#tab1-51").removeClass("tab-pane active"); $("#tab1-51").addClass("tab-pane"); $("#tab1-52").removeClass("tab-pane active"); $("#tab1-52").addClass("tab-pane"); $("#tab1-53").removeClass("tab-pane active"); $("#tab1-53").addClass("tab-pane"); $("#tab1-54").removeClass("tab-pane active"); $("#tab1-54").addClass("tab-pane"); $("#tab1-55").removeClass("tab-pane"); $("#tab1-55").addClass("tab-pane active");
                });
            } else if (abasDentro == 56) {
                $(document).ready(function () {
                    $("#li51").removeClass("active"); $("#li52").removeClass("active"); $("#li53").removeClass("active"); $("#li54").removeClass("active"); $("#li55").removeClass("active"); $("#li56").addClass("active"); $("#tab1-51").removeClass("tab-pane active"); $("#tab1-51").addClass("tab-pane"); $("#tab1-52").removeClass("tab-pane active"); $("#tab1-52").addClass("tab-pane"); $("#tab1-53").removeClass("tab-pane active"); $("#tab1-53").addClass("tab-pane"); $("#tab1-54").removeClass("tab-pane active"); $("#tab1-54").addClass("tab-pane"); $("#tab1-55").removeClass("tab-pane active"); $("#tab1-55").addClass("tab-pane"); $("#tab1-56").removeClass("tab-pane"); $("#tab1-56").addClass("tab-pane active");
                });
            } else if (abasDentro == 57) {
                $(document).ready(function () {
                    $("#li51").removeClass("active"); $("#li52").removeClass("active"); $("#li53").removeClass("active"); $("#li54").removeClass("active"); $("#li55").removeClass("active"); $("#li56").removeClass("active"); $("#li57").addClass("active"); $("#tab1-51").removeClass("tab-pane active"); $("#tab1-51").addClass("tab-pane"); $("#tab1-52").removeClass("tab-pane active"); $("#tab1-52").addClass("tab-pane"); $("#tab1-53").removeClass("tab-pane active"); $("#tab1-53").addClass("tab-pane"); $("#tab1-54").removeClass("tab-pane active"); $("#tab1-54").addClass("tab-pane"); $("#tab1-55").removeClass("tab-pane active"); $("#tab1-55").addClass("tab-pane"); $("#tab1-56").removeClass("tab-pane active"); $("#tab1-56").addClass("tab-pane"); $("#tab1-57").removeClass("tab-pane"); $("#tab1-57").addClass("tab-pane active");
                });
            } else if (abasDentro == 58) {
                $(document).ready(function () {
                    $("#li51").removeClass("active"); $("#li52").removeClass("active"); $("#li53").removeClass("active"); $("#li54").removeClass("active"); $("#li55").removeClass("active"); $("#li56").removeClass("active"); $("#li57").removeClass("active"); $("#li58").addClass("active"); $("#tab1-51").removeClass("tab-pane active"); $("#tab1-51").addClass("tab-pane"); $("#tab1-52").removeClass("tab-pane active"); $("#tab1-52").addClass("tab-pane"); $("#tab1-53").removeClass("tab-pane active"); $("#tab1-53").addClass("tab-pane"); $("#tab1-54").removeClass("tab-pane active"); $("#tab1-54").addClass("tab-pane"); $("#tab1-55").removeClass("tab-pane active"); $("#tab1-55").addClass("tab-pane"); $("#tab1-56").removeClass("tab-pane active"); $("#tab1-56").addClass("tab-pane"); $("#tab1-57").removeClass("tab-pane active"); $("#tab1-57").addClass("tab-pane"); $("#tab1-58").removeClass("tab-pane"); $("#tab1-58").addClass("tab-pane active");
                });
            } else if (abasDentro == 59) {
                $(document).ready(function () {
                    $("#li51").removeClass("active"); $("#li52").removeClass("active"); $("#li53").removeClass("active"); $("#li54").removeClass("active"); $("#li55").removeClass("active"); $("#li56").removeClass("active"); $("#li57").removeClass("active"); $("#li58").removeClass("active"); $("#li59").addClass("active"); $("#tab1-51").removeClass("tab-pane active"); $("#tab1-51").addClass("tab-pane"); $("#tab1-52").removeClass("tab-pane active"); $("#tab1-52").addClass("tab-pane"); $("#tab1-53").removeClass("tab-pane active"); $("#tab1-53").addClass("tab-pane"); $("#tab1-54").removeClass("tab-pane active"); $("#tab1-54").addClass("tab-pane"); $("#tab1-55").removeClass("tab-pane active"); $("#tab1-55").addClass("tab-pane"); $("#tab1-56").removeClass("tab-pane active"); $("#tab1-56").addClass("tab-pane"); $("#tab1-57").removeClass("tab-pane active"); $("#tab1-57").addClass("tab-pane"); $("#tab1-58").removeClass("tab-pane active"); $("#tab1-58").addClass("tab-pane"); $("#tab1-59").removeClass("tab-pane"); $("#tab1-59").addClass("tab-pane active");
                });
            }
        }
    </script>

    <!-- Solução das abas 1 com jquery -->
    <!-- Passando o valor das abas, da viewbag para dentro do código javascript através do id -->
    <input type="hidden" value="<%: ViewBag.Abas1 %>" id="abas1" />
    <input type="hidden" value="<%: ViewBag.TotalAbas %>" id="totalAbas" />
    <script type="text/javascript">
        var abas1 = document.getElementById('abas1').value;
        var totalAbas = document.getElementById('totalAbas').value;
        //método que concatena os nomes das abas para adicionar ou remover classes que ativam e desativam as abas
        $(document).ready(function () {
            if (abas1 != 1) {
                var aba = "#li";
                var cont = "#tab1-";
                for (var i = 1; i <= totalAbas; i++) {
                    if (i != abas1) {
                        var resultAba = aba.concat(i);
                        var resultCont = cont.concat(i);

                        $(resultAba).removeClass("active");
                        $(resultCont).removeClass("tab-pane active");
                        $(resultCont).addClass("tab-pane");
                    }
                }
                var resultAba = aba.concat(abas1);
                var resultCont = cont.concat(abas1);
                $(resultAba).addClass("active");
                $(resultCont).addClass("tab-pane active");
                $(resultCont).removeClass("tab-pane");
            }
        });
    </script>
    <script type="text/javascript">
        //função complementar para esconder a aba após os adicionamentos das classes tab-pane
        var abasEdit1 = document.getElementById('abas1').value;
        var totalAbas = document.getElementById('totalAbas').value;
        $(document).ready(function () {
            var aba2 = "#li";
            var cont2 = "#tab1-";
            for (var i = 0; i <= totalAbas; i++) {
                var resultAba2 = aba2.concat(i);
                $(resultAba2).click(function () {
                    var resultCont2 = cont2.concat(abas1);
                    $(resultCont2).hide();
                });
            }
            var resultAbaAtualEdit = aba2.concat(abas1);
            $(resultAbaAtualEdit).click(function () {
                var resultContAbaEdit = cont2.concat(abas1);
                $(resultContAbaEdit).show();
            });
        });
    </script>
    <!-- Código javascript para as Abas dos Relatos -->
    <!-- Passando o valor das abas, da viewbag para dentro do código javascript através do id -->
    <input type="hidden" value="<%: ViewBag.AbasRelato %>" id="abasRelato" />
    <script type="text/javascript">
        var abasRelato = document.getElementById('abasRelato').value
        //método que concatena os nomes das abas para adicionar ou remover classes que ativam e desativam as abas
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
    <!-- FIM do Código javascript para as Abas dos Relatos -->

    <!-- script para os campos que tem calendário -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".calendario").datepicker({
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
