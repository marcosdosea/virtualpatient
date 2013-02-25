<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VirtualPatient.Models.DiscenteModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Bem vindo, 
    </h3>
    <p>
        To learn more about ASP.NET MVC visit <a href="http://asp.net/mvc" title="ASP.NET MVC Website">http://asp.net/mvc</a>. 

        
    </p>
    <!--Teste simples com um único atributo -->
    <b>Primeiro nome: </b><%: Html.EditorFor(mm=>mm.PrimeiroNome) %>


    <!--Destinado a capturar todos os componentes necessário da classe "DiscenteModel", Observe o "Inherits" na descriçao da página-->
    <%using (Html.BeginForm())
      {
    %>
    <%:Html.EditorForModel() %>
    <input type="submit" name="Save" />
    <%} %>

</asp:Content>
