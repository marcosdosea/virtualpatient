<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.RelatoClinicoModel>>" %>

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
        <% } %>
    </div>
    <div class="span2">
        <div class="thumbnail">
            <img class="media" id="Img1" src="<%: Url.Action("GetImage", "Paciente", new RouteValueDictionary(new { id = ViewBag.codigo})) %>"
                alt="Definir Imagem Padrão" style="width: 100px; height: 100px;" />
        </div>
    </div>
    
    <%@ Import Namespace="GridMvc.Html" %>
    <%@ Import Namespace="GridMvc.Sorting" %>

<div class="box-content">

<%= Html.Grid(Model).Columns(columns =>
    {
        
        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomePaciente)
                .Titled(Resources.Mensagem.relato_clinico)
                .ThenSortByDescending(o => o.NomePaciente)
                .Filterable(true)
                .SetWidth(380);

        columns.Add(o => o.OrdemCronologica)
                .Titled(Resources.Mensagem.ordem_cronologica)
                .ThenSortByDescending(o => o.OrdemCronologica)
                .Filterable(true);

        columns.Add(o => o.NivelDificuldade)
                .Titled(Resources.Mensagem.nivel_dificuldade)
                .ThenSortByDescending(o => o.NivelDificuldade)
                .Filterable(true);
        
        columns.Add(o => o.AreaAtuacao)
                .Titled(Resources.Mensagem.area_atuacao)
                .ThenSortByDescending(o => o.AreaAtuacao)
                .Filterable(true);

        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.editar)
                .Encoded(false)
                .Sanitized(false)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = o.IdRelato }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.detalhes)
                .Encoded(false)
                .Sanitized(false)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = o.IdRelato }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.remover)
                .Encoded(false)
                .Sanitized(false)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = o.IdRelato }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.atribuir)
                .Encoded(false)
                .Sanitized(false)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.atribuir, "Atribuir", new { idRelato = o.IdRelato, idPaciente = o.IdPaciente, ordemCronologica = o.OrdemCronologica }, new { @class = "modal-link" }));

    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>

</asp:Content>

