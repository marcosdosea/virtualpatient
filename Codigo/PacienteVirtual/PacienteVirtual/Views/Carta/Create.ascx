<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.CartaModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>

<% using (Html.BeginForm("Create", "Carta")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.carta %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.HiddenFor(model => model.IdCarta) %>

        <div class="row-fluid">
            <div class="span3">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.NomeProfissional) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.NomeProfissional, new { style = "width:579px;")%>
                    <%: Html.ValidationMessageFor(model => model.NomeProfissional, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <div id="mostrarReco">A Fármacia PV-CARE está oferecendo aos seus usuários um novo serviço farmacêutico. Este serviço, denominado Atenção Farmacêutica, tem como objetivo trabalhar em conjunto com outros profissionais de saúde com o intuito de garantir que as necessidades farmacoterapêuticas de seus pacientes sejam atendidas. Isto é realizado por meio da prevenção, identificação e resolução de problemas relacionados ao uso de medicamentos. Deste modo, encaminhamos esta carta para que possa avaliar o caso abaixo descrito:</div>
        <br />
            <p id="paciente"><%: Resources.Mensagem.dados_paciente%></p>
            <legend></legend>
            <div class="row-fluid">
                <div class="span3">
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.NomePaciente) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.NomePaciente, new { style = "width:579px;")%>
                        <%: Html.ValidationMessageFor(model => model.NomePaciente, string.Empty, new { @class = "styleValidation" })%>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span6">
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.DataNascimento) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.DataNascimento, new {  @Value = (String.Format("{0:dd/MM/yyyy}", Model.DataNascimento)), type = "text", id = "calendario" , style = "width:176px;"}) %>
                        <%: Html.ValidationMessageFor(model => model.DataNascimento, string.Empty, new { @class = "styleValidation" })%>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span3">
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.TelefonePaciente) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.TelefonePaciente)%>
                        <%: Html.ValidationMessageFor(model => model.TelefonePaciente, string.Empty, new { @class = "styleValidation" })%>
                    </div>
                </div>
            </div>
            <legend></legend>
        <div class="row-fluid">
            <div class="span6">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.MotivoReferenciaConsulta) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.MotivoReferenciaConsulta, new { style = "width:579px;" })%>
                    <%: Html.ValidationMessageFor(model => model.MotivoReferenciaConsulta, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.Alternativas) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.Alternativas, new { style = "width:579px;" })%>
                    <%: Html.ValidationMessageFor(model => model.Alternativas, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.Farmaceutico) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Farmaceutico, new { style = "width:579px;")%>
                    <%: Html.ValidationMessageFor(model => model.Farmaceutico, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.CRFUF) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.CRFUF, new { style = "width:579px;" })%>
                    <%: Html.ValidationMessageFor(model => model.CRFUF, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.TelefoneFarmaceutico) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.TelefoneFarmaceutico)%>
                    <%: Html.ValidationMessageFor(model => model.TelefoneFarmaceutico, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.Referências) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.Referências, new { style = "width:579px;", ID = "mudarCaracter" })%>
                    <%: Html.ValidationMessageFor(model => model.Referências, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.IdEspecialidade) %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("IdEspecialidade", Resources.Mensagem.selecione)%>
                    <%: Html.ValidationMessageFor(model => model.IdEspecialidade, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" onclick="AlterarCaracteres()" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </fieldset>
    <div class="styleValidation">
        <%: Html.QuebraLinhaFor(model => model.ErroCarta) %>
    </div>
<% } %>

<style type="text/css">
    #mostrarReco
    {
        text-align: justify;
    }
</style>

<script type="text/javascript">
    function AlterarCaracteres() {
        var str = document.getElementById("mudarCaracter").value;
        var res = str.replace(/>/gi, "&gt;");

        res = res.replace(/</gi, "&lt;");
        document.getElementById("mudarCaracter").value = res;
    }
</script>
