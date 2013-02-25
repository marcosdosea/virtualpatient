<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VirtualPatient.Models.DiscenteModel>" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About</h2>
    <p>
        Put content here.
    </p>

    <div>
        <%: // Destinado a retornar os valores do Model DiscenteModel
    Html.DisplayForModel()%>
    </div>




</asp:Content>
