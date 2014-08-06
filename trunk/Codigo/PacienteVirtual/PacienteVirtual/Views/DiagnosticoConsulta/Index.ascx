<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiagnosticoConsultaModel>>" %>
<link rel="stylesheet" href="<%: Url.Content("~/Content/themes/pv/jquery-ui2.css") %>" />
<script src="<%: Url.Content("~/Scripts/jquery-1.10.2.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery-ui-PopUp.js") %>" type="text/javascript"></script>
<link rel="stylesheet" href="<%: Url.Content("~/Content/themes/pv/style-PopUp.css") %>" />
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
    <script src="<%: Url.Content("~/Scripts/jquery-1.9.1.min.js") %>" type="text/javascript"></script>
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
            <%: Resources.Mensagem.classe_diagnostico %>
        </th>
        <th><%: Resources.Mensagem.opcoes %></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoDiagnostico) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoClasseDiagnostico) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.visualizar, "Details", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico, idClasseDiagnostico = item.IdClasseDiagnostico }, null)%>
            |
            <%: Html.ActionLink(Resources.Mensagem.editar,"Edit", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico, idClasseDiagnostico = item.IdClasseDiagnostico }, null) %>
            |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico }, new { onclick = ("return confirm('Deseja realmente REMOVER este Diagnóstico?')") })%>
        </td>
    </tr>
<% } %>
</table>
