<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ProductCatalog>" %>

<%: Html.DropDownList("Products", new SelectList(Model.Diagnostico, "IdDiagnostico", "DescricaoDiagnostico"), Resources.Mensagem.selecione)%>
