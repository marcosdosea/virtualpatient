<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.IntegridadeTecidualModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>
<% using (Html.BeginForm("Edit", "IntegridadeTecidual"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.integridade_tecidual %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <div class="span3">
                    <%: Html.Label(Resources.Mensagem.turgor) %>
                    <%: Html.EnumDropDownListFor(model => model.Turgor, ListaTurgor.Presente) %>
                    <%: Html.ValidationMessageFor(model => model.Turgor, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span2">
                <%: Html.EditorFor(model => model.Equimose) %>
                <%: Resources.Mensagem.equimose %>
                <%: Html.ValidationMessageFor(model => model.Equimose, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span2">
                <%: Html.EditorFor(model => model.Hematoma) %>
                <%: Resources.Mensagem.hematoma %>
                <%: Html.ValidationMessageFor(model => model.Hematoma, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span2">
                <%: Html.EditorFor(model => model.Letericia) %>
                <%: Resources.Mensagem.letericia %>
                <%: Html.ValidationMessageFor(model => model.Letericia, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.Descorada) %>
                <%: Resources.Mensagem.descorada %>
                <%: Html.ValidationMessageFor(model => model.Descorada, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <%: Html.LabelFor(model => model.EstadoHidratacao) %>
                <%: Html.EnumDropDownListFor(model => model.EstadoHidratacao, ListaEstadoHidratacao.Hidratada) %>
                <%: Html.ValidationMessageFor(model => model.EstadoHidratacao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <div class="span2">
                    <%: Html.EditorFor(model => model.Purido) %>
                    <%: Resources.Mensagem.purido %>
                    <%: Html.ValidationMessageFor(model => model.Purido, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span2">
                    <%: Html.EditorFor(model => model.Hiperemia) %>
                    <%: Resources.Mensagem.hiperemia %>
                    <%: Html.ValidationMessageFor(model => model.Hiperemia, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span2">
                    <%: Html.EditorFor(model => model.Nodulo) %>
                    <%: Resources.Mensagem.nodulo %>
                    <%: Html.ValidationMessageFor(model => model.Nodulo, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Descamacao) %>
                    <%: Resources.Mensagem.descamacao %>
                    <%: Html.ValidationMessageFor(model => model.Descamacao, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <div class="span4">
                    <%: Html.EditorFor(model => model.PerdaSensibilidade) %>
                    <%: Resources.Mensagem.perda_sensibilidade %>
                    <%: Html.ValidationMessageFor(model => model.PerdaSensibilidade, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span2">
                    <%: Html.EditorFor(model => model.Eritema) %>
                    <%: Resources.Mensagem.eritema %>
                    <%: Html.ValidationMessageFor(model => model.Eritema, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Rubor) %>
                    <%: Resources.Mensagem.rubor %>
                    <%: Html.ValidationMessageFor(model => model.Rubor, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <%: Resources.Mensagem.localizar_alteracao %>:&nbsp;&nbsp;
                <%: Html.TextBoxFor(model => model.LocalAlteracaoPele, new { MaxLength = 100 ,style = "width:410px;" })%>
                <%: Html.ValidationMessageFor(model => model.LocalAlteracaoPele, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <div class="span2">
                    <%: Resources.Mensagem.lesoes %>:
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Pediabetico) %>
                    <%: Resources.Mensagem.pe_diabetico %>
                    <%: Html.ValidationMessageFor(model => model.Pediabetico, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Escoriacao) %>
                    <%: Resources.Mensagem.escoriacao %>
                    <%: Html.ValidationMessageFor(model => model.Escoriacao, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span13">
            <div class="editor-field">
                <div class="span3">
                    <%: Html.EditorFor(model => model.UlceraPressao) %>
                    <%: Resources.Mensagem.ulcera_pressao %>
                    <%: Html.ValidationMessageFor(model => model.UlceraPressao, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span9">
                    <%: Resources.Mensagem.estagio %>:&nbsp;
                    <%: Html.TextBoxFor(model => model.UlceraPressaoEstagio, new { MaxLength = 5, style = "width:70px;" })%>
                    <%: Html.ValidationMessageFor(model => model.UlceraPressaoEstagio, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <div class="span12">
                    <%: Resources.Mensagem.local %>:&nbsp;
                    <%: Html.TextBoxFor(model => model.UlceraPressaoLocal, new { MaxLength = 100, style = "width:490px;" })%>
                    <%: Html.ValidationMessageFor(model => model.UlceraPressaoLocal, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Queimadura) %>
                    <%: Resources.Mensagem.queimadura %>
                    <%: Html.ValidationMessageFor(model => model.Queimadura, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span9">
                    <%: Resources.Mensagem.grau %>
                    <%: Html.TextBoxFor(model => model.QueimaduraGrau, new { MaxLength = 5, style = "width:70px;" })%>
                    <%: Html.ValidationMessageFor(model => model.QueimaduraGrau, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <div class="span12">
                    <%: Resources.Mensagem.local %>:&nbsp;
                    <%: Html.TextBoxFor(model => model.QueimaduraLocal, new { MaxLength = 100, style = "width:487px;" })%>
                    <%: Html.ValidationMessageFor(model => model.QueimaduraLocal, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <div class="span3">
                    <%: Html.EditorFor(model => model.FeridaCirurgica) %>
                    <%: Resources.Mensagem.ferida_cirurgica %>
                </div>
                <div class="span9">
                    <%: Resources.Mensagem.local %>:&nbsp;
                    <%: Html.TextBoxFor(model => model.FeridaCirurgicaLocal, new { style = "width:337px;" })%>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <%: Resources.Mensagem.aspecto %>:
                <%: Html.TextBoxFor(model => model.LesaoAspecto, new { style = "width:473px;" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
