<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.PacienteModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.paciente %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.paciente %></h2>
    <p>
        <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
    </p>

    <div>
         <% using (Html.BeginForm("Index", "Paciente", FormMethod.Post, null))
               { %>
            <%: Html.DropDownList("IdPaciente", null, Resources.Mensagem.listar_todos, new { onchange = "this.form.submit();" })%>
            <% } %>
    </div>

    <div class="box-content">
        <table class="table table-bordered table-striped">
            <tr>
                <th>
                    <%: Resources.Mensagem.nome %>
                </th>
                <th>
                    <%: Resources.Mensagem.foto %>
                </th>
                <th style="width:270px;">
                    <%: Resources.Mensagem.opcoes %>
                </th>
            </tr>

            <tbody>
                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.NomePaciente) %>
                    </td>
                    <td>
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img src='<%: Url.Action("GetImage", "Paciente", new { id= item.IdPaciente }) %>'
                                    width="100" height="110" alt="<%: Url.Action("GetImage", "Paciente", new { id= item.IdPaciente }) %>" />
                            </a>
                        </div>
                    </td>
                    <td>
                        <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdPaciente }) %>
                        |
                        <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id=item.IdPaciente }) %>
                        |
                        <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdPaciente }) %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</asp:Content>
