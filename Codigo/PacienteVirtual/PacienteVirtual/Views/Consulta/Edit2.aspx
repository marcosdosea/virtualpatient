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
                <div class="thumbnail">
                    <% Html.RenderAction("DetailsConsulta", "RelatoClinico", new RouteValueDictionary(new { model = Model.RelatoClinico }));%>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="thumbnails">
                <div class="thumbnail">
                    <% Html.RenderPartial("../DiarioPessoal/Create", Model.DiarioPessoal);%>
                    <% Html.RenderPartial("../DiarioPessoal/Index", Model.ListaDiarioPessoal);%>
                </div>
                <div class="thumbnail">
                    <% Html.RenderPartial("../ConsultaVariavelQueixa/Create", Model.ConsultaVariavelQueixa);%>
                    <% Html.RenderPartial("../ConsultaVariavelQueixa/Index", Model.ListaConsultaVariavelQueixa);%>
                    <div class="mostrarQueixa">
                        <% Html.RenderPartial("../QueixaMedicamento/Create", Model.QueixaMedicamento);%>
                    </div>
                    <% Html.RenderPartial("../QueixaMedicamento/Index", Model.ListaQueixaMedicamento);%>
                </div>
                <div class="thumbnail">
                    <% Html.RenderPartial("../IntervencaoConsulta/Create", Model.IntervencaoConsulta);%>
                    <% Html.RenderPartial("../IntervencaoConsulta/Index", Model.ListaIntervencaoConsulta);%>
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
        <%: Html.ActionLink(Resources.Mensagem.concluir, "Concluir", "Consulta", Model.ConsultaVariavel.IdConsultaVariavel, new { @style = "color:White; font-size:small;" })%>
    </div>
</asp:Content>
