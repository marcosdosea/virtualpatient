<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ExperienciaMedicamentosModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.criar%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.criar%></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.experiencia_medicamentos%></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdConsultaFixo) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdConsultaFixo", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdConsultaFixo) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaEsperaTratamento) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaEsperaTratamento", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaEsperaTratamento) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaPreocupacoes) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaPreocupacoes", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaPreocupacoes) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaGrauEntendimento) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaGrauEntendimento", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaGrauEntendimento) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaCultural) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaCultural", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaCultural) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaComportamento) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaComportamento", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaComportamento) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaIncorporadoPlano) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaIncorporadoPlano", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaIncorporadoPlano) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoEsperaTratamento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoEsperaTratamento) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoEsperaTratamento) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoPreocupacoes) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoPreocupacoes) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoPreocupacoes) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoGrauEntendimento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoGrauEntendimento) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoGrauEntendimento) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoCultural) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoCultural) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoCultural) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoComportamento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoComportamento) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoComportamento) %>
        </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value= "<%: Resources.Mensagem.criar%>" />
    </div>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </div>
</asp:Content>
