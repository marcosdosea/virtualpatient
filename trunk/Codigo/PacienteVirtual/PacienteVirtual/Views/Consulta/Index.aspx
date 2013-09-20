﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ConsultaVariavelModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.consulta%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <h2>
            <%: Resources.Mensagem.consulta %></h2>
        <% using (Html.BeginForm("Index", "Consulta", FormMethod.Post, null))
           { %>
        <%: Html.DropDownList("IdPaciente", null, Resources.Mensagem.listar_todos, new { onchange = "this.form.submit();" })%>
        <% } %>
    </div>
    <div class="span2">
        <div class="thumbnail">
            <img class="media" id="Img1" src="<%: Url.Action("GetImage", "Paciente", new RouteValueDictionary(new { id = ViewBag.codigo})) %>"
                alt="Definir Imagem Padrão" style="width: 100px; height: 100px;" />
        </div>
    </div>
    <div class="box-content">
        <table class="table table-bordered table-striped">
            <tr>
                <th>
                    <%: Resources.Mensagem.paciente %>
                </th>
                <th>
                    <%: Resources.Mensagem.ordem_cronologica %>
                </th>
                <th>
                    <%: Resources.Mensagem.nivel_dificuldade %>
                </th>
                <th>
                    <%: Resources.Mensagem.status_preenchimento %>
                </th>
                <th>
                    <%: Resources.Mensagem.turma_codigo %>
                </th>
                <th>
                    <%: Resources.Mensagem.consulta %>
                </th>
            </tr>
            <% if (Model != null)
                   foreach (var item in Model)
                   { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.NomePaciente) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.OrdemCronologica)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.NivelDificuldade)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoEstadoConsulta)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.IdTurma)%>
                </td>
                <td>
                    <%: Html.ActionLink(Resources.Mensagem.preencher, "Edit", new { idConsultaVariavel = item.IdConsultaVariavel })%> 
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</asp:Content>
