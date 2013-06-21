<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.EstiloVidaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>EstiloVidaE</legend>

    <div class="display-label">TabacoConsumo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TabacoConsumo) %>
    </div>

    <div class="display-label">TabacoUso</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TabacoUso) %>
    </div>

    <div class="display-label">TabacoParou</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TabacoParou) %>
    </div>

    <div class="display-label">CafeConsumo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CafeConsumo) %>
    </div>

    <div class="display-label">CafeUso</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CafeUso) %>
    </div>

    <div class="display-label">CafeParou</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CafeParou) %>
    </div>

    <div class="display-label">AlcoolConsumo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AlcoolConsumo) %>
    </div>

    <div class="display-label">AlcoolUso</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AlcoolUso) %>
    </div>

    <div class="display-label">AlcoolTipoBebida</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AlcoolTipoBebida) %>
    </div>

    <div class="display-label">AlcoolParou</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AlcoolParou) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdConsultaVariavel }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
