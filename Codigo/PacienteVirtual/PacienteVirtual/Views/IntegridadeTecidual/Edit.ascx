<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.IntegridadeTecidualModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit", "IntegridadeTecidual")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.integridade_tecidual %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <div class="row-fluid">
            <div id="turgor" class="span12">
                <div class="editor-field">
                    <div class="span3">
                        <%: Html.Label(Resources.Mensagem.turgor) %>
                        <%: Html.EnumDropDownListFor(model => model.Turgor, ListaTurgor.Presente) %>
                        <%: Html.ValidationMessageFor(model => model.Turgor) %>
                    </div>
                </div>
            </div>
            <div id="check1" class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Equimose) %>
                    <%: Resources.Mensagem.equimose %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Hematoma) %>
                    <%: Resources.Mensagem.hematoma %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Letericia) %>
                    <%: Resources.Mensagem.letericia %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Descorada) %>
                    <%: Resources.Mensagem.descorada %>
                </div>
            </div>
            <div id="check1" class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.EstadoHidratacao) %>
                    <%: Html.EnumDropDownListFor(model => model.EstadoHidratacao, ListaEstadoHidratacao.Hidratada) %>
                    <%: Html.ValidationMessageFor(model => model.EstadoHidratacao) %>
                </div>
            </div>
            <div id="check2" class="span12">
                <div class="editor-field">
                    <div class="span3">
                        <%: Html.EditorFor(model => model.Purido) %>
                        <%: Resources.Mensagem.purido %>
                    </div>
                    <div class="span3">
                        <%: Html.EditorFor(model => model.Hiperemia) %>
                        <%: Resources.Mensagem.hiperemia %>
                    </div>
                    <div class="span3">
                        <%: Html.EditorFor(model => model.Nodulo) %>
                        <%: Resources.Mensagem.nodulo %>
                    </div>
                    <div class="span3">
                        <%: Html.EditorFor(model => model.Descamacao) %>
                        <%: Resources.Mensagem.descamacao %>
                    </div>
                </div>
            </div>
            <div id="check2" class="span12">
                <div class="editor-field">
                    <div class="span4">
                        <%: Html.EditorFor(model => model.PerdaSensibilidade) %>
                        <%: Resources.Mensagem.perda_sensibilidade %>
                    </div>
                    <div class="span3">
                        <%: Html.EditorFor(model => model.Eritema) %>
                        <%: Resources.Mensagem.eritema %>
                    </div>
                    <div class="span3">
                        <%: Html.EditorFor(model => model.Rubor) %>
                        <%: Resources.Mensagem.rubor %>
                    </div>
                </div>
            </div>
            <div id="check2" class="span12">
                <div class="editor-field">
                    <%: Resources.Mensagem.localizar_alteracao %>:&nbsp;&nbsp;
                    <%: Html.TextBoxFor(model => model.LocalAlteracaoPele, new { MaxLength = 100 ,style = "width:410px;" })%>
                </div>
            </div>
            <div id="check2" class="span12">
                <div class="editor-field">
                    <div class="span2">
                        <%: Resources.Mensagem.lesoes %>:
                    </div>
                    <div class="span3">
                        <%: Html.EditorFor(model => model.Pediabetico) %>
                        <%: Resources.Mensagem.pe_diabetico %>
                    </div>
                    <div class="span3">
                        <%: Html.EditorFor(model => model.Escoriacao) %>
                        <%: Resources.Mensagem.escoriacao %>
                    </div>
                </div>
            </div>
            <div id="check3" class="span13">
                <div class="editor-field">
                    <div class="span3">
                        <%: Html.EditorFor(model => model.UlceraPressao) %>
                        <%: Resources.Mensagem.ulcera_pressao %>
                    </div>
                    <div class="span9">
                        <%: Resources.Mensagem.estagio %>:&nbsp;
                        <%: Html.TextBoxFor(model => model.UlceraPressaoEstagio, new { MaxLength = 5, style = "width:70px;" })%>
                    </div>  
                </div>
            </div>
            <div id="check3" class="span12">
                <div class="editor-field">
                    <div class="span12">
                        <%: Resources.Mensagem.local %>:&nbsp;
                        <%: Html.TextBoxFor(model => model.UlceraPressaoLocal, new { MaxLength = 100, style = "width:490px;" })%>
                    </div>
                </div>
            </div>
            <div id="check3" class="span12">
                <div class="editor-field">
                    <div class="span3">
                        <%: Html.EditorFor(model => model.Queimadura) %>
                        <%: Resources.Mensagem.queimadura %>
                    </div>
                    <div class="span9">
                        <%: Resources.Mensagem.grau %>
                        <%: Html.TextBoxFor(model => model.QueimaduraGrau, new { MaxLength = 5, style = "width:70px;" })%>
                    </div>
                </div>
            </div>
            <div id="check3" class="span12">
                <div class="editor-field">
                    <div class="span12">
                        <%: Resources.Mensagem.local %>:&nbsp;
                        <%: Html.TextBoxFor(model => model.QueimaduraLocal, new { MaxLength = 100, style = "width:487px;" })%>
                    </div>
                </div>
            </div>
            <div id="check3" class="span12">
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
            <div id="check3" class="span12">
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

    <style>
        #turgor
        {
            position: relative;
            left:15px;
        }
        #check1
        {
            position: relative;
            top: 12px;
        }
        #check2
        {
            position: relative;
            top: 15px;
        }
        #check3
        {
            position: relative;
            top: 18px;
        }
    </style>
<% } %>
