<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ConsultaVariavelModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.consulta%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row-fluid">
    <div class="span9">
        <h2>
            <%: Resources.Mensagem.consulta %></h2>
        <% using (Html.BeginForm("Index", "Consulta", FormMethod.Post, null))
           { %>
        <%: Html.DropDownList("IdPaciente", null, Resources.Mensagem.listar_todos, new { onchange = "this.form.submit();" })%>
        <% } %>
    </div>
    <div class="span3">
        <div class="thumbnail">
            <img class="media" id="Img1" src="<%: Url.Action("GetImage", "Paciente", new RouteValueDictionary(new { id = ViewBag.codigo})) %>"
                alt="Definir Imagem Padrão" style="width: 100px; height: 100px;" />
        </div>
    </div>
</div>
<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<% if (Session["_Roles"].Equals("tutor")) { %>
<div class="box-content">

<%= Html.Grid(Model).Columns(columns =>
    {
        
        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomePaciente)
                .Titled(Resources.Mensagem.paciente);

        columns.Add(o => o.NomePessoa)
            .Titled(Resources.Mensagem.usuario)
            .ThenSortByDescending(o => o.NomePessoa)
            .Filterable(true);
        
        columns.Add(o => o.OrdemCronologica)
            .Titled(Resources.Mensagem.ordem_cronologica)
            .ThenSortByDescending(o => o.OrdemCronologica)
            .Filterable(true);
        
        columns.Add(o => o.NivelDificuldade)
            .Titled(Resources.Mensagem.nivel_dificuldade)
            .ThenSortByDescending(o => o.NivelDificuldade)
            .Filterable(true);

        columns.Add(o => o.DescricaoEstadoConsulta)
            .Titled(Resources.Mensagem.status_preenchimento)
            .ThenSortByDescending(o => o.DescricaoEstadoConsulta)
            .Filterable(true);

        columns.Add(o => o.NomeTurma)
            .Titled(Resources.Mensagem.turma)
            .ThenSortByDescending(o => o.NomeTurma)
            .Filterable(true);
        
        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.opcoes)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.visualizar, "Edit", new { idConsultaVariavel = o.IdConsultaVariavel }));
                
    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>
<% } else if (Session["_Roles"].Equals("usuario")) { %>
<div class="box-content">
<%= Html.Grid(Model).Columns(columns =>
    {
        
        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomePaciente)
                .Titled(Resources.Mensagem.paciente);

        columns.Add(o => o.NomePessoa)
            .Titled(Resources.Mensagem.usuario)
            .ThenSortByDescending(o => o.NomePessoa)
            .Filterable(true);
        
        columns.Add(o => o.OrdemCronologica)
            .Titled(Resources.Mensagem.ordem_cronologica)
            .ThenSortByDescending(o => o.OrdemCronologica)
            .Filterable(true);
        
        columns.Add(o => o.NivelDificuldade)
            .Titled(Resources.Mensagem.nivel_dificuldade)
            .ThenSortByDescending(o => o.NivelDificuldade)
            .Filterable(true);

        columns.Add(o => o.DescricaoEstadoConsulta)
            .Titled(Resources.Mensagem.status_preenchimento)
            .ThenSortByDescending(o => o.DescricaoEstadoConsulta)
            .Filterable(true);

        columns.Add(o => o.NomeTurma)
            .Titled(Resources.Mensagem.turma)
            .ThenSortByDescending(o => o.NomeTurma)
            .Filterable(true);
        
        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.opcoes)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.preencher, "Edit", new { idConsultaVariavel = o.IdConsultaVariavel }));
                
    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>
<% } else { %>
<div class="box-content">
<%= Html.Grid(Model).Columns(columns =>
    {
        
        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomePaciente)
                .Titled(Resources.Mensagem.paciente);

        columns.Add(o => o.NomePessoa)
            .Titled(Resources.Mensagem.usuario)
            .ThenSortByDescending(o => o.NomePessoa)
            .Filterable(true);
        
        columns.Add(o => o.OrdemCronologica)
            .Titled(Resources.Mensagem.ordem_cronologica)
            .ThenSortByDescending(o => o.OrdemCronologica)
            .Filterable(true);
        
        columns.Add(o => o.NivelDificuldade)
            .Titled(Resources.Mensagem.nivel_dificuldade)
            .ThenSortByDescending(o => o.NivelDificuldade)
            .Filterable(true);

        columns.Add(o => o.DescricaoEstadoConsulta)
            .Titled(Resources.Mensagem.status_preenchimento)
            .ThenSortByDescending(o => o.DescricaoEstadoConsulta)
            .Filterable(true);

        columns.Add(o => o.NomeTurma)
            .Titled(Resources.Mensagem.turma)
            .ThenSortByDescending(o => o.NomeTurma)
            .Filterable(true);
        
        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.opcoes)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.preencher_gabarito, "Edit", new { idConsultaVariavel = o.IdConsultaVariavel }));
                
    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>
<% } %>


    

</asp:Content>