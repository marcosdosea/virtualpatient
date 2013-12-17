<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Paciente Virtual
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: ViewBag.Message %></h2>
    <p>
        <br />  
        <h5>
        O paciente virtual é um ambiente virtual de aprendizagem que permite que alunos dos cursos das ciências da saúde
        exercitem suas habilidades. Através de relatos clínicos disponibilizados pelo tutor da turma o aluno coleta informações
        e registra quais as intervenções seriam mais adequadas. 
        <br />
        <p > </p>
        Para aprender mais sobre a utilização software leia o <a href="#" title="Manual do Paciente Virtual">Manual do Paciente Virtual</a>.
        <br />
        <p></p>
        Abaixo também segue a lista de publicações realizadas através do software:
        </h5>

    </p>

</asp:Content>
