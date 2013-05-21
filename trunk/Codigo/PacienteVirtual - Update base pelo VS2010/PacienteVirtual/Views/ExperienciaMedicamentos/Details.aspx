<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ExperienciaMedicamentosModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>tb_experiencia_medicamentos</legend>

    <div class="display-label">tb_resposta</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_resposta.Resposta) %>
    </div>

    <div class="display-label">tb_resposta1</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_resposta1.Resposta) %>
    </div>

    <div class="display-label">tb_resposta2</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_resposta2.Resposta) %>
    </div>

    <div class="display-label">tb_resposta3</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_resposta3.Resposta) %>
    </div>

    <div class="display-label">tb_resposta4</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_resposta4.Resposta) %>
    </div>

    <div class="display-label">tb_resposta5</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_resposta5.Resposta) %>
    </div>

    <div class="display-label">AtencaoEsperaTratamento</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoEsperaTratamento) %>
    </div>

    <div class="display-label">AtencaoPreocupacoes</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoPreocupacoes) %>
    </div>

    <div class="display-label">AtencaoGrauEntendimento</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoGrauEntendimento) %>
    </div>

    <div class="display-label">AtencaoCultural</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoCultural) %>
    </div>

    <div class="display-label">AtencaoComportamento</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoComportamento) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdConsultaFixo }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
