<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.TurmaPessoaModel>" %>
<% if (Model != null)
   { %>
<div class="direita">
    <div class="row-fluid">
        <% if (Model.NomeRole != ("administrador"))
           { %>
           <div class="span6">
            <div class="editor-label">
                <p class="cabecalho"><%: Resources.Mensagem.turma%>:</p>
            </div>
        </div>
        <div class="span5">
            <div class="editor-label">
                <p class="conteudo"><%: Model.NomeTurma%></p>
            </div>
        </div>
        <% } %>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <p class="cabecalho"><%: Resources.Mensagem.perfil %>:</p>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <p class="conteudo"><%: Model.NomeRole %></p>
            </div>
        </div>
    </div>
    <% if (ViewBag.QtdTurmaPessoa > 1)
       { %>
       <div class="row-fluid">
            <div class="span12">
               <div class="btn btn-primary">
                    <%: Html.ActionLink(Resources.Mensagem.alterar_turma, "Index", "SelecionarTurma", null, new { @style = "color:White; font-size:small; "}) %>
                </div>
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
        text-align: right;
        font-size: small;
        font-family: Tahoma;
        text-transform:capitalize;
    }
    .br
    {
        clear: left;
    }
    .direita
    {
        float: right;
        text-align: right;
    }
</style>