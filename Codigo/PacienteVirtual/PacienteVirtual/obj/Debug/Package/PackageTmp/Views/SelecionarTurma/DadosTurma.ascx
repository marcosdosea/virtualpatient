<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.TurmaPessoaModel>" %>
<% if (Model != null)
   { %>
<div class="row-fluid">
    <div class="span3">
        <div class="editor-field">
            <p class="cabecalho">
                <%: Resources.Mensagem.turma %></p>
            <p class="conteudo">
                <%: Model.NomeTurma %></p>
        </div>
    </div>
    <% if (Model.NomeRole.Contains("administrador_"))
       { %>
    <div class="span2">           
    <% }
       else
       { %>
    <div class="span1">
    <% } %>
        <div class="editor-field">
            <p class="cabecalho">
                <%: Resources.Mensagem.perfil %></p>
            <p class="conteudo">
                <%: Model.NomeRole.Replace("_"," ") %></p>
        </div>
    </div>
    <div id="posCurso" class="span3">
        <div class="editor-field">
            <p class="cabecalho">
                <%: Resources.Mensagem.curso %></p>
            <p class="conteudo">
                <%: Model.Curso %></p>
        </div>
    </div>
    <% if (ViewBag.QtdTurmaPessoa > 1)
       { %>
    <br />
    <div id="posBotao">
        <div class="btn btn-primary">
            <%: Html.ActionLink(Resources.Mensagem.alterar_turma, "Index", "SelecionarTurma", null, new { @style = "color:White; font-size:small; " })%>
        </div>
    </div>
    <% } %>
</div>
</div>
<% } %>

<style>
    .cabecalho
    {
        font-size: medium;
        font-family: Tahoma;
        font-weight: bold;
        text-align: center;
    }
    .conteudo
    {
        float: left;
        text-align: center;
        font-size: small;
        font-family: Tahoma;
        text-transform:capitalize;
    }
    .br
    {
        clear: left;
    }
    #posBotao
    {
        position: relative;
        left: 10%;
    }    
    #posCurso
    {
        position: relative;
        left: 3%;
    }
</style>