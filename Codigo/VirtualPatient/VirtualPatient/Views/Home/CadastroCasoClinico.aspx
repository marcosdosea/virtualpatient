<%@ Page Title="Título da página" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ajuda
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Cadastro de Caso Clínico</h2>


    <fieldset id="fieldset">
        <legend id="legend">Intervenções farmacêuticas </legend>
        <table style="width: 60%;">
            <!-- 1-->
            <tr>
                <th></th>
                <th>Título da Tabela </th>
                <th>Comunicação </th>
            </tr>
            <tr>
                <td>
                    <input id="Checkbox1" type="checkbox" /></td>
                <td>Sob prescrição</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>
            </tr>

            <tr>
                <td>
                    <input id="Checkbox2" type="checkbox" /></td>
                <td>Venda livre</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>

            <!-- 2-->
            <tr>
                <th></th>
                <th>Modificar farmacoterapia </th>

            </tr>
            <tr>
                <td>
                    <input id="Checkbox3" type="checkbox" /></td>
                <td>Alterar produto</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>
            </tr>

            <tr>
                <td>
                    <input id="Checkbox4" type="checkbox" /></td>
                <td>Alterar dose</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>

              <tr>
                <td>
                    <input id="Checkbox11" type="checkbox" /></td>
                <td>Alterar dose</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>

              <tr>
                <td>
                    <input id="Checkbox12" type="checkbox" /></td>
                <td>Alterar forma farmacêutica</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>

              <tr>
                <td>
                    <input id="Checkbox13" type="checkbox" /></td>
                <td>Alterar intervalo</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>
            <!-- 3-->
            <tr>
                <th></th>
                <th>Descontinuar farmacoterapia </th>
            </tr>
            <tr>
                <td>
                    <input id="Checkbox5" type="checkbox" /></td>
                <td>Medicamento descontinuado</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>
            </tr>

            <tr>
                <td>
                    <input id="Checkbox6" type="checkbox" /></td>
                <td>Substituição por genérico</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>

                  <tr>
                <td>
                    <input id="Checkbox14" type="checkbox" /></td>
                <td>Substituição terapêutica</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>


            <!-- 4-->
            <tr>
                <th></th>
                <th>Educação </th>
            </tr>
            <tr>
                <td>
                    <input id="Checkbox7" type="checkbox" /></td>
                <td>Sobre medicamento</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>
            </tr>

            <tr>
                <td>
                    <input id="Checkbox8" type="checkbox" /></td>
                <td>Sobre problemas de saúde</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>

                  <tr>
                <td>
                    <input id="Checkbox15" type="checkbox" /></td>
                <td>Sobre dispositivos médicos</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>

            <!-- 5-->
            <tr>
                <th></th>
                <th>Monitorização</th>
            </tr>
            <tr>
                <td>
                    <input id="Checkbox9" type="checkbox" /></td>
                <td>Iniciar monitorização laboratorial</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>
            </tr>

            <tr>
                <td>
                    <input id="Checkbox10" type="checkbox" /></td>
                <td>Iniciar outro tipo de monitorização</td>
                <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>

            </tr>

        </table>
        

         <table style="width: 60%;">
    <tr>
 
                <th style=" -delay:initial;">Outros</th>
            </tr>

        <tr>
            <td><input id="Text2" type="text" /></td>
            <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>
        </tr>
        <tr>
            <td><input id="Text3" type="text" /></td>
         <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>
      
            
        </tr>
        <tr>
            <td><input id="Text4" type="text" /></td>
             <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>
  
        </tr>

                  <tr>
            <td><input id="Text5" type="text" /></td>
             <td>
                    <select name="comunicacao">
                        <option value="paciente" selected>Paciente</option>
                        <option value="tutor">Tutor</option>
                    </select></td>
  
        </tr>
    </table>
        <hr />
    </fieldset>
    <input id="Submit1" type="submit" value="Enviar" />
     <input id="Submit2" type="submit" value="Cancelar" />
   
    <% 
        for (var i = 10; i < 2; i++) %>
    <% {%><p>Line </p>
    
    <% } %>
</asp:Content>
