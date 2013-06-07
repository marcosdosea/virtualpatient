<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.RelatoClinicoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Relato Clínico
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Index</h2>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <div class="box-content"> <table class="table table-bordered table-striped">
        <tr>
            <th>
                Relato Clínico
            </th>
            <th>
                OrdemCronologia
            </th>
            <th>
                RelatoTextual
            </th>
            <th>
                NivelDificuldade
            </th>
            <th>
                video
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.NomePaciente) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.OrdemCronologica) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.RelatoTextual) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.NivelDificuldade) %>
            </td>
            <td>

            < object width="320" height="265">

            < param name="wmode" value="transparent" />
            < param name="allowFullScreen" value="true" />
        < embed src="../../Uploads/O Hobbit - Uma Jornada Inesperada.mp4" allowfullscreen="true" type="video/mp4" width="320" height="265" />
            < /object>    
            < object>
    
    < embed src='../../Uploads/O Hobbit - Uma Jornada Inesperada.mp4'    CONTROLLER='true' WIDTH='200' HEIGHT='260'
> < /embed>
    


    </ object>

< video width="320" height="240" controls autoplay="autoplay">

   < source src="../../Uploads/Minority.Report.2002.720p.BluRay.x264.YIFY.mp4" type="video/mp4">
         < video id="Video1" controls loop autoplay >
           < source src='<%: Url.Content("~/Uploads/O Hobbit - Uma Jornada Inesperada.mp4")%>' type="video/mp4" />           
       < /video>
  < /video>
  < video src="../../Uploads/Minority.Report.2002.720p.BluRay.x264.YIFY.mp4" controls autoplay >
   ../../Uploads/JanSvankmajer_.mp4

            <%: Html.Html5().Media.Video("JanSvankmajer_", Url.Action("GetVideo", "RelatoClinico", new { id= 15 }) , "your browser does not support", new { @width = "400px", @height = "300px", style = "border:solid 1px #FF0000;" })%>
            
              < %: Html.Html5().Media.Video("JanSvankmajer_", "../../Uploads/O Hobbit - Uma Jornada Inesperada.mp4", "your browser does not support", new { @width = "400px", @height = "300px", style = "border:solid 1px #FF0000;" })%>

               < %: Html.Html5().Media.Video("JanSvankmajer_", "~/Uploads/Minority.Report.2002.720p.BluRay.x264.YIFY.mp4", "your browser does not support", new { @width = "400px", @height = "300px", style = "border:solid 1px #FF0000;" })%>

                 < %: Html.Html5().Media.Video("JanSvankmajer_", "~/Uploads/Minority.Report.2002.720p.BluRay.x264.YIFY.mp4", "your browser does not support", new { @width = "400px", @height = "300px", style = "border:solid 1px #FF0000;" })%>


            @Html.Html5().Media.Video("video1","~/videofile1.mp4","Browser does not support", new { @width="500px", @height="500px"}) 

            
            </td>
            <td>
      
                <%: Html.ActionLink("Edit", "Edit", new { id=item.IdRelato }) %>
                |
                <%: Html.ActionLink("Details", "Details", new { id=item.IdRelato }) %>
                |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.IdRelato }) %>
            </td>
        </tr>
        <% } %>
    </table></div>
</asp:Content>
