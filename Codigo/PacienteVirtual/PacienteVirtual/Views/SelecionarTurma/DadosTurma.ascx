<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.TurmaPessoaModel>" %>
<% if (Model != null)
   { %>
<div class="row-fluid">
        <% if (Model.NomeRole != ("administrador")) { %>
        <div class="span2">
            <div class="editor-label">
                <p class="cabecalho"><%: Resources.Mensagem.turma%>:</p>
                <p class="conteudo"><%: Model.NomeTurma%></p>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <p class="cabecalho"><%: Resources.Mensagem.perfil %>:</p>
                <p class="conteudo"><%: Model.NomeRole %></p>
            </div>
        </div>
        <% } %>
        <% if (Model.NomeRole == ("administrador")) { %>
        <div class="span3">
            <div class="editor-label">
                <p class="cabecalho"><%: Resources.Mensagem.perfil %>:</p>
                <p class="conteudo"><%: Model.NomeRole %></p>
            </div>
        </div>  
        <% } %>
        <div class="span5">
            <div class="editor-label">
                <p class="cabecalho"><%: Resources.Mensagem.curso %>:</p>
                <p class="conteudo"><%: Model.Curso %></p>
            </div>
        </div>
        <% if (ViewBag.QtdTurmaPessoa > 1)
       { %>
            <div>
            <br />
            <div class="btn btn-primary">
                <%: Html.ActionLink(Resources.Mensagem.alterar_turma, "Index", "SelecionarTurma", null, new { @style = "color:White; font-size:small; "}) %>
            </div>
            </div>
      <% } %>
    </div>
<% } %>

<style>
    .cabecalho
    {
        font-size: medium;
        font-family: Tahoma;
        font-weight: bold;
    }
    .conteudo
    {
        float: left;
        text-align: right;
        font-size: small;
        font-family: Tahoma;
        text-transform:capitalize;
    }
    .br
    {
        clear: left;
    }
    
</style>