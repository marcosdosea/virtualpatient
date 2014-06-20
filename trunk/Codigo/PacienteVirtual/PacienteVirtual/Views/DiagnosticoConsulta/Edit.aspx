<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiagnosticoConsultaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<% using (Html.BeginForm("Edit", "DiagnosticoConsulta"))
   { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.diagnostico %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.HiddenFor(model => model.IdDiagnostico) %>
        
        <div class="row-fluid">
            <div class="span2">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.DescricaoGrupoDiagnostico) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.DescricaoGrupoDiagnostico, new { id = "textbox" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span2">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.DescricaoDiagnostico) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.DescricaoDiagnostico, new { id = "textbox2" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span2">
                 <div class="editor-label">
                    <% if (Session["_Risco"].Equals(false))
                       { %>
                        <%: Resources.Mensagem.fatores_relacionados %>
                    <% }else{ %>
                        <%: Resources.Mensagem.fatores_risco %>
                    <% } %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.Fatores, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.Fatores) %>
                </div>
            </div>
        </div>
        <br />
        <% if (Session["_Risco"].Equals(false))
           { %>
        <div class="row-fluid">
            <div class="span3">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.CaracteristicasDefinidoras) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.CaracteristicasDefinidoras, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.CaracteristicasDefinidoras) %>
                </div>
            </div>
        </div>
        <br />
        <% }
           else
           { %>
        <%: Html.HiddenFor(model => model.CaracteristicasDefinidoras)%>
        <% } %>
        <br />
        <div class="row-fluid">
            <div class="span2">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.ResultadoEsperado) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.ResultadoEsperado, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.ResultadoEsperado) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span2">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.PrescricaoCuidado) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.PrescricaoCuidado, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.PrescricaoCuidado) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span2">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.AvaliacaoResultados) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.AvaliacaoResultados, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.AvaliacaoResultados) %>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>

<div class="btn btn-primary">
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit2", "Consulta", Model.IdConsultaVariavel, new { @style = "color:White; font-size:small;"})%>
</div>

<script type="text/javascript">
    document.getElementById('textbox').disabled = true;
</script>
<script type="text/javascript">
    document.getElementById('textbox2').disabled = true;
</script>
</asp:Content>
