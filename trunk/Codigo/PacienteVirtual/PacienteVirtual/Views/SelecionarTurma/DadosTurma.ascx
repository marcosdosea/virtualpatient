<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.Turma.TurmaPessoaModel>" %>

<% if (Model != null)
   { %>
   <%: Resources.Mensagem.turma %> <%: Model.NomeTurma %>
   <p></p>
   <%: Resources.Mensagem.perfil %> <%: Model.NomeRole %>
   <p></p>
   <div class="btn btn-primary">
        <%: Html.ActionLink("alterarturma", "Index", "SelecionarTurma", null, new { @style = "color:White; font-size:small;"}) %>
    </div>
    <p></p>
    <p></p>
<% } %>

