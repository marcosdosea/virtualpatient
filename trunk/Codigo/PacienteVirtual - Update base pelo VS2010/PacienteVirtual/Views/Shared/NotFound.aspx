<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    NotFound
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <% if (Model != null) { %>
        <h2 class="error">Model.Exception</h2>
   <% } else { %>
        <h2>
            Ops! 404 (Page Not Found)!
            <br />
            A página não foi encontrada, provavelmente o 
            endereço foi movido ou removido. 
            Contate seu administrador
            de redes.
        </h2>
   <% } %>
</asp:Content>
