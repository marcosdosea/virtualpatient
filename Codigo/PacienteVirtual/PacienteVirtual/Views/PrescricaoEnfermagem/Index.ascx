<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.PrescricaoEnfermagemModel>>" %>
<div id="minhaBarra">
    <div class="box-content">
        <table class="table table-bordered">
            <tr>
                <th>
                    <%: Resources.Mensagem.prescricao_enfermagem %>
                </th>
                <th>
                    <%: Resources.Mensagem.horarios %>
                </th>
                <th>
                    <%: Resources.Mensagem.checar_cuidado %>
                </th>
                <th>
                    <%: Resources.Mensagem.opcoes %>
                </th>
            </tr>
            <% foreach (var item in Model)
               { %>
            <% if (item.Realizada.Equals(true))
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoPrescricao)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.Horario)%>
                </td>
                <td  class="linhaRealizada">
                    <% if (!(Session["_Roles"].Equals("tutor"))) {
                        if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) ||
                           Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) ||
                           Session["_IdEstadoConsulta"].Equals(7)))){ %>
                            <%: Html.ActionLink(Resources.Mensagem.realizado, "MarcarComoNaoRealizado", "PrescricaoEnfermagem",
                                new { idPrescricaoEnfermagem = item.IdPrescricaoEnfermagem }, null)%>
                        <% }
                       else
                       { %>
                        <%: Html.Label(Resources.Mensagem.realizado) %>
                        <% }%>
                    <% } else{%>
                    <%: Html.Label(Resources.Mensagem.realizado) %>
                    <% } %>
                </td>
                <td>
                    <% if (!(Session["_Roles"].Equals("tutor"))) {
                        if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) ||
                           Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) ||
                           Session["_IdEstadoConsulta"].Equals(7))))
                       { %>
                    <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "PrescricaoEnfermagem", new { idPrescricaoEnfermagem =
                        item.IdPrescricaoEnfermagem }, null)%>
                    <% } %>
                    <% } %>
                </td>
            </tr>
            <% }
               else
               { %>
               <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoPrescricao)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.Horario)%>
                </td>
                <td  class="linhaNaoRealizada">
                    <% if (!(Session["_Roles"].Equals("tutor"))) {
                        if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) ||
                           Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) ||
                           Session["_IdEstadoConsulta"].Equals(7)))){ %>
                            <%: Html.ActionLink(Resources.Mensagem.nao_realizado, "MarcarComoRealizado", "PrescricaoEnfermagem",
                                new { idPrescricaoEnfermagem = item.IdPrescricaoEnfermagem }, null)%>
                        <% }
                       else
                       { %>
                        <%: Html.Label(Resources.Mensagem.nao_realizado)%>
                        <% }%>
                    <% } else{%>
                    <%: Html.Label(Resources.Mensagem.nao_realizado)%>
                    <% } %>
                </td>
                <td>
                    <% if (!(Session["_Roles"].Equals("tutor"))) {
                        if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) ||
                           Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) ||
                           Session["_IdEstadoConsulta"].Equals(7))))
                       { %>
                    <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "PrescricaoEnfermagem", new { idPrescricaoEnfermagem =
                        item.IdPrescricaoEnfermagem }, null)%>
                    <% } %>
                    <% } %>
                </td>
            </tr>
            <% } %>
            <% } %>
        </table>
    </div>
</div>
<style type="text/css">
    .linhaRealizada
    {
        background-color: Green;
    }
    
    .linhaNaoRealizada
    {
        background-color: Red;
    } 
</style>