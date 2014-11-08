<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ProductCatalog>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<table cellpadding="0" cellspacing="4" border="0">
    <tr>
        <td>Domínio&nbsp;</td>
        <td>&nbsp;:</td>
        <td><%: Html.Partial("CategoriesUserControl", Model) %></td>
    </tr>
    <tr>
        <td>Classe Domínio&nbsp;</td>
        <td>&nbsp;:</td>
        <td><div id="SubCategories"><%: Html.Partial("SubCategoriesUserControl", Model) %></div></td>
    </tr>
    <tr>
        <td>Diagnóstico&nbsp;</td>
        <td>&nbsp;:</td>
        <td><div id="Products"><%: Html.Partial("ProductsUserControl", Model) %></div></td>
    </tr>
</table>

</asp:Content>
