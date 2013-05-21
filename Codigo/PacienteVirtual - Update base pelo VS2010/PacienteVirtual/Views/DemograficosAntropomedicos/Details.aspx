<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DemograficosAntropometricosModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>tb_demograficos_antropometricos</legend>

    <div class="display-label">Nome</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Nome) %>
    </div>

    <div class="display-label">Genero</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Genero) %>
    </div>

    <div class="display-label">DataNascimento</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataNascimento) %>
    </div>

    <div class="display-label">MedicosAtendem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.MedicosAtendem) %>
    </div>

    <div class="display-label">MoradiaFamilia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.MoradiaFamilia) %>
    </div>

    <div class="display-label">OndeAdquireMedicamentos</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OndeAdquireMedicamentos) %>
    </div>

    <div class="display-label">tb_escolaridade</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_escolaridade.Nivel) %>
    </div>

    <div class="display-label">tb_ocupacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_ocupacao.Descricao) %>
    </div>

    <div class="display-label">tb_plano_saude</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_plano_saude.Nome) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdConsultaFixo }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
