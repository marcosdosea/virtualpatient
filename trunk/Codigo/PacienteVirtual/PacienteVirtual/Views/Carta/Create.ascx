<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.CartaModel>" %>

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
                    <%: Html.TextBoxFor(model => model.NomeProfissional, new { style = "width:579px;", MaxLength = 45 })%>
                    <%: Html.ValidationMessageFor(model => model.NomeProfissional) %>
                </div>
            </div>
        </div>
        <p id="recomendacoes">•<%: Resources.Mensagem.recomendacoes %></p>
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
                        <%: Html.TextBoxFor(model => model.NomePaciente, new { style = "width:579px;", MaxLength = 45 })%>
                        <%: Html.ValidationMessageFor(model => model.NomePaciente) %>
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
                        <%: Html.ValidationMessageFor(model => model.DataNascimento)%>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span3">
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.TelefonePaciente) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.TelefonePaciente, new {  MaxLength = 15 })%>
                        <%: Html.ValidationMessageFor(model => model.TelefonePaciente) %>
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
                    <%: Html.ValidationMessageFor(model => model.MotivoReferenciaConsulta) %>
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
                    <%: Html.ValidationMessageFor(model => model.Alternativas) %>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.Farmaceutico) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Farmaceutico, new { style = "width:579px;", MaxLength = 45 })%>
                    <%: Html.ValidationMessageFor(model => model.Farmaceutico) %>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.CRFUF) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.CRFUF, new { style = "width:579px;", MaxLength = 45 })%>
                    <%: Html.ValidationMessageFor(model => model.CRFUF) %>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.TelefoneFarmaceutico) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.TelefoneFarmaceutico, new { MaxLength = 15 })%>
                    <%: Html.ValidationMessageFor(model => model.TelefoneFarmaceutico)%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.Referências) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.Referências, new { style = "width:579px;" })%>
                    <%: Html.ValidationMessageFor(model => model.Referências)%>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.IdCurso) %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("IdCurso", Resources.Mensagem.selecione)%>
                    <%: Html.ValidationMessageFor(model => model.IdCurso) %>
                </div>
            </div>
        </div>

        <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
    </fieldset>
<% } %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#recomendacoes").click(function () {
            $("#mostrarReco").slideToggle(1200);
        });
    });
</script>
<style>
    #paciente
    {
        font-weight: bolder;
    }
    #mostrarReco
    {
        display: none;
        text-align: justify;
    }
    #recomendacoes
    {
        text-align: right;
        cursor: pointer;
    }
</style>
