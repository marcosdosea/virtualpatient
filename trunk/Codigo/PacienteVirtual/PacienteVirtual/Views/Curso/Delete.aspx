<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.CursoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Deletar Curso
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Excluir Curso</h2>

<h3>Você tem certeza que deseja excluir este curso?</h3>
<fieldset>
    <legend>Exluir Curso</legend>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeCurso) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeCurso) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeInstituicao) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeInstituicao) %> 
    </div>

     <p>
        <input type="submit" value="Deletar" />
    </p>
</fieldset>
<!--% using (Html.BeginForm()) { %-->
    <p>
        <!--input type="submit" value="Deletar" /-->
        <%: Html.ActionLink("Voltar", "Index") %>
    </p>
<!--% } %-->

</asp:Content>
