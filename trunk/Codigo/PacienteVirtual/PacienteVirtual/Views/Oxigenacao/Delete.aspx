<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.tb_oxiginecao>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>tb_oxiginecao</legend>

    <div class="display-label">FrequeciaRespiratoria</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.FrequeciaRespiratoria) %>
    </div>

    <div class="display-label">Ritmo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Ritmo) %>
    </div>

    <div class="display-label">Dispineia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Dispineia) %>
    </div>

    <div class="display-label">Taquipneia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Taquipneia) %>
    </div>

    <div class="display-label">Bradipneia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Bradipneia) %>
    </div>

    <div class="display-label">Kussmaul</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Kussmaul) %>
    </div>

    <div class="display-label">CheyneStokes</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CheyneStokes) %>
    </div>

    <div class="display-label">Epistaxe</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Epistaxe) %>
    </div>

    <div class="display-label">ObstrucaoNasal</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ObstrucaoNasal) %>
    </div>

    <div class="display-label">Coriza</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Coriza) %>
    </div>

    <div class="display-label">DesvioDeSepto</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DesvioDeSepto) %>
    </div>

    <div class="display-label">Palidez</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Palidez) %>
    </div>

    <div class="display-label">LabioCianotico</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.LabioCianotico) %>
    </div>

    <div class="display-label">SimetriaToracica</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.SimetriaToracica) %>
    </div>

    <div class="display-label">Barril</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Barril) %>
    </div>

    <div class="display-label">PeitoDePombo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.PeitoDePombo) %>
    </div>

    <div class="display-label">Funil</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Funil) %>
    </div>

    <div class="display-label">Lordose</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Lordose) %>
    </div>

    <div class="display-label">Cifose</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Cifose) %>
    </div>

    <div class="display-label">Escoliose</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Escoliose) %>
    </div>

    <div class="display-label">TiragemIntercostal</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TiragemIntercostal) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
