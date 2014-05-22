<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.NutricaoModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit","Nutricao")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.nutricao %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <div class="editor-label">
                        <%: Resources.Mensagem.peso %> &nbsp
                        <%: Html.TextBoxFor(model => model.Peso, new { style =  "width:70px;"  })%>
                        <%: Html.ValidationMessageFor(model => model.Peso) %> &nbsp &nbsp
                        <%: Resources.Mensagem.altura %> &nbsp
                        <%: Html.TextBoxFor(model => model.Altura, new { style = "width:70px;" })%>
                        <%: Html.ValidationMessageFor(model => model.Altura) %>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.EstadoNutricional) %>
                    <%: Html.EnumDropDownListFor(model => model.EstadoNutricional, ListaEstadoNutricional.PesoNormal) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.NutricaoOral) %>
                    <%: Resources.Mensagem.nutricao_oral %>
                    <%: Html.ValidationMessageFor(model => model.NutricaoOral, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Disfagia) %>
                    <%: Resources.Mensagem.disfagia %>
                    <%: Html.ValidationMessageFor(model => model.Disfagia, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span5">
                    <%: Html.EditorFor(model => model.DificuldadeMastigar) %>
                    <%: Resources.Mensagem.dificuldade_mastigar %>
                    <%: Html.ValidationMessageFor(model => model.DificuldadeMastigar, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.SangramentoGengival) %>
                    <%: Resources.Mensagem.sangramento_gengival %>
                    <%: Html.ValidationMessageFor(model => model.SangramentoGengival, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.AusenciaDentes) %>
                    <%: Resources.Mensagem.ausencia_dentes %>
                    <%: Html.ValidationMessageFor(model => model.AusenciaDentes, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Nausea) %>
                    <%: Resources.Mensagem.nausea %>
                    <%: Html.ValidationMessageFor(model => model.Nausea, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Emese) %>
                    <%: Resources.Mensagem.emese %>
                    <%: Html.ValidationMessageFor(model => model.Emese, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Pirose) %>
                    <%: Resources.Mensagem.pirose %>
                    <%: Html.ValidationMessageFor(model => model.Pirose, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span9">
                    <%: Html.EditorFor(model => model.IngestaHidrica) %>
                    <%: Resources.Mensagem.ingesta_hidrica %>
                    <%: Html.ValidationMessageFor(model => model.IngestaHidrica, string.Empty, new { @class = "styleValidation" })%>
                    <%: Html.TextBoxFor(model => model.IngestaHidricaValor, new { style = "width:70px;" })%>ml/24h
                    <%: Html.ValidationMessageFor(model => model.IngestaHidricaValor, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <%: Html.EditorFor(model => model.RestricaoHidrica) %>
                <%: Resources.Mensagem.restricao_hidrica %>
                <%: Html.ValidationMessageFor(model => model.RestricaoHidrica, string.Empty, new { @class = "styleValidation" })%>
                <%: Html.TextBoxFor(model => model.RestricaoHidricaValor, new { style = "width:70px;" })%>ml/24h
                <%: Html.ValidationMessageFor(model => model.RestricaoHidricaValor, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <%: Html.EditorFor(model => model.SemRestricao) %>
                <%: Resources.Mensagem.sem_restricao %>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <%: Html.EditorFor(model => model.RestricaoAlimentar) %>
                <%: Resources.Mensagem.restricao_alimentar %>
                <%: Html.TextBoxFor(model => model.RestricaoAlimentarTexto, new { MaxLength = 100, style = "width:440px;" })%>
                <%: Html.ValidationMessageFor(model => model.RestricaoAlimentarTexto, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <%: Resources.Mensagem.habitos_alimentares %>
                <%: Html.TextBoxFor(model => model.HabitosAlimentares, new { MaxLength = 100, style = "width:440px;" })%>
                <%: Html.ValidationMessageFor(model => model.HabitosAlimentares, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.DispositivosAlimentacao) %>
                    <%: Html.EnumDropDownListFor(model => model.DispositivosAlimentacao, ListaDispositivosAlimentacao.NaoSeAplica) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.Instalada) %>
                    <%: Html.TextBoxFor(model => model.Instalada, new {  @Value = (String.Format("{0:dd/MM/yyyy}", Model.Instalada)), type = "text", @class = "calendario" , style = "width:176px;"}) %>
                    <%: Html.ValidationMessageFor(model => model.Instalada) %>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>
