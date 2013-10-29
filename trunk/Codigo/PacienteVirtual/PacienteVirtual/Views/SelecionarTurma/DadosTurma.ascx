<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.Turma.TurmaPessoaModel>" %>
<% if (Model != null)
   { %>
<div class="direita">
    <div>
        <p class="cabecalho"><%: Resources.Mensagem.turma %>:</p>
        <p class="conteudo"><%: Model.NomeTurma %></p>
    </div>
    <div>
        <p class="cabecalho"><%: Resources.Mensagem.perfil %>:</p>
        <p class="conteudo"><%: Model.NomeRole %></p>
    </div>
    <div class="btn btn-primary" id="botao">
        <%: Html.ActionLink(Resources.Mensagem.alterar_turma, "Index", "SelecionarTurma", null, new { @style = "color:White; font-size:small; "}) %>
    </div>
    <br />
    <br />
</div>
<% } %>

<style>
    #botao
    {
        float: right;
    }
    .cabecalho, conteudo
    {
        display: block;
        float: left;
    }
    .cabecalho
    {
        font-size: medium;
        font-family: Tahoma;
        font-weight: bold;
    }
    .conteudo
    {
        position:relative;
        left: 15px;
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
        position: relative;
        right: 20px;
    }
</style>