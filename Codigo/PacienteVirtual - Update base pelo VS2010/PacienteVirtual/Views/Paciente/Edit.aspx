<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacienteModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.paciente %></legend>

        <%: Html.HiddenFor(model => model.IdPaciente) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomePaciente) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomePaciente) %>
            <%: Html.ValidationMessageFor(model => model.NomePaciente) %>
        </div>
         <asp:Image ID="Image2" runat="server" 
            ImageUrl='<%# "ImageHandler.ashx?ImgID="+ Eval("id") %>' Height="150px" 
            Width="150px"/>

        <asp:Image   Height="150px"  Width="150px" ID="Image1" runat="server" />
        <p>
            <input type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </p>
    </fieldset>
    
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</div>

</asp:Content>
