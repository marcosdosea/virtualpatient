<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DisciplinaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Disciplina
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Disciplina</h2>

<h3>Você tem certeza que deseja excluir esta Disciplina?</h3>
<fieldset>
    <legend>Excluir Disciplina</legend>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeDisciplina) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeDisciplina) %>
    </div>

     <p>
        <input type="submit" value="Excluir"> 
   
    </p>

</fieldset>
<% using (Html.BeginForm()) { %>
        <%: Html.ActionLink("Voltar", "Index") %>
<% } %>

</asp:Content>
