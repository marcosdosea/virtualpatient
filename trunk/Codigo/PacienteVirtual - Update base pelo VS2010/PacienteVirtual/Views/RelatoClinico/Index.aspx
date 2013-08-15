﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.RelatoClinicoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.relato_clinico %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <h2>
            <%: Resources.Mensagem.relato_clinico %></h2>
        <p>
            <%: Html.ActionLink(Resources.Mensagem.criar, "Create")%>
        </p>
        <% using (Html.BeginForm("Index", "RelatoClinico", FormMethod.Post, null))
           { %>
        <%: Html.DropDownList("IdPaciente", null, Resources.Mensagem.listar_todos, new { onchange = "this.form.submit();" })%>
        <!-- %: Html.DropDownList("IdPaciente", null, Resources.Mensagem.selecione, new { @onchange = "this.form.action = Index = 1;" })%-->
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
                    <%: Resources.Mensagem.relato_clinico %>
                </th>
                <th>
                    <%: Resources.Mensagem.ordem_cronologica %>
                </th>
                <th>
                    <%: Resources.Mensagem.relato_textual %>
                </th>
                <th>
                    <%: Resources.Mensagem.nivel_dificuldade %>
                </th>
                <th>
                    video
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
                    <%: Html.DisplayFor(modelItem => item.OrdemCronologica) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.RelatoTextual) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.NivelDificuldade) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.RelatoVideo) %>
                </td>
                <td>
                    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdRelato }) %>
                    |
                    <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id=item.IdRelato }) %>
                    |
                    <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdRelato }) %>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</asp:Content>
