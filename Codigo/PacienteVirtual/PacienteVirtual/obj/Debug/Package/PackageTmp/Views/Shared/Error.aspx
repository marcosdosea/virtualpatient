<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

   

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Error
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <%  if (Model != null && Model.Exception != null)
        { %>
    <br />
    <h2>
        
        <%: Model.Exception.Message %></h2>
    <br />
    <br />
    <%  }
        else
        {%>
    <h3>
        Desculpe, um erro enquando efetuavamos sua requisição. Favor informar ao administrador do sistema.
    </h3>
    <% } %>

     <script type="text/javascript">
         function goBack() {
             window.history.back()
         }
    </script>
     <button onclick="goBack()">Voltar</button>
</asp:Content>
