﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiagnosticoConsultaModel>>" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
  <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script type="text/javascript" src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script type="text/javascript">
          $(function () {
              $("#dialog").dialog({
                  autoOpen: false,
                  show: {
                      effect: "drop",
                      duration: 1000
                  },
                  hide: {
                      effect: "fold",
                      duration: 1000
                  }
              });

              $("#opener").click(function () {
                  $("#dialog").dialog("open");
              });
          });
  </script>
  <% if (Session["_DiagDetalhes"].Equals(true))
     { %>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $("#opener").click();
        });
    </script>
    <% }  %>
<input type="hidden" id="opener" />     
    
  
<table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.diagnostico %>
        </th>
        <th>
            <%: Resources.Mensagem.grupo_diagnostico %>
        </th>
        <th><%: Resources.Mensagem.opcoes %></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoDiagnostico) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoGrupoDiagnostico) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.visualizar, "Details", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico, idGrupoDiagnostico = item.IdGrupoDiagnostico }, null)%>
            |
            <%: Html.ActionLink(Resources.Mensagem.editar,"Edit", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico, idGrupoDiagnostico = item.IdGrupoDiagnostico }, null) %>
            |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico }, new { onclick = ("return confirm('Deseja realmente REMOVER este Diagnóstico?')") })%>
        </td>
    </tr>
<% } %>
</table>