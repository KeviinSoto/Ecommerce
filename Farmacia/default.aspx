<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" %>
<%@ Register Assembly="FlashControl" Namespace="Bewise.Web.UI.WebControls" TagPrefix="Bewise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            font-size: xx-large;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

    <div id="featured" >  
    <ul class="ui-tabs-nav">  
        <li class="ui-tabs-nav-item ui-tabs-selected" id="nav-fragment-1"><a href="#fragment-1"><img src="images/d4.jpg" width="80" height="50" alt="" /><span>Ofertas de temporada</span></a></li>  
        <li class="ui-tabs-nav-item" id="nav-fragment-2"><a href="#fragment-2"><img src="images/calcibone_d.jpg" width="80" height="50" alt="" /><span>Productos recien llegados</span></a></li>  
        <%--<li class="ui-tabs-nav-item" id="nav-fragment-3"><a href="#fragment-3"><img src="images/image3.jpg" width="80" height="50" alt="" /><span>35 Amazing Logo Designs</span></a></li>  
        <li class="ui-tabs-nav-item" id="nav-fragment-4"><a href="#fragment-4"><img src="images/image4.jpg" width="80" height="50" alt="" /><span>Create a Vintage Photograph in Photoshop</span></a></li>  --%>
    </ul>  

    <!-- First Content -->  
    <div id="fragment-1" class="ui-tabs-panel" style="">  
        <img src="images/d4.jpg" width="600" height="300" alt="" />  
        <div class="info" >  
        <h2><a href="#" >Ofertas de temporada</a></h2>  
        <p>Tenemos nuevas ofertas esperando por ti...<a href="ofertas.aspx" >Ver más</a></p>  
        </div>  
    </div>  
    <!-- Second Content -->  
    <div id="fragment-2" class="ui-tabs-panel ui-tabs-hide" style="">  
        <img src="images/calcibone_d.jpg" width="600" height="300" alt="" />  
        <div class="info" >  
        <h2><a href="#" >Productos recien llegados</a></h2>  
        <p>Tenemos una gran variedad de medicinas y productos nuevos...<a href="/Carrito/listaProductos.aspx" >Ver más</a></p>  
        </div>  
    </div>  
    <!-- Third Content -->  
    <%--<div id="fragment-3" class="ui-tabs-panel ui-tabs-hide" style="">  
        <img src="images/image3.jpg" width="600" height="300" alt="" />  
        <div class="info" >  
        <h2><a href="#" >35 Amazing Logo Designs</a></h2>  
        <p>liquam erat volutpat. Proin id volutpat nisi. Nulla facilisi. Curabitur facilisis sollicitudin ornare....<a href="#" >read more</a></p>  
        </div>  
    </div>  --%>
    <!-- Fourth Content -->  
    <%--<div id="fragment-4" class="ui-tabs-panel ui-tabs-hide" style="">  
        <img src="images/image4.jpg" width="600" height="300" alt="" />  
        <div class="info" >  
        <h2><a href="#" >Create a Vintage Photograph in Photoshop</a></h2>  
        <p>Quisque sed orci ut lacus viverra interdum ornare sed est. Donec porta, erat eu pretium luctus, leo augue sodales....<a href="#" >read more</a></p>  
        </div>  --%>
    <%--</div>--%>  
</div>

    <div id="abajoPortada">

        <div id="centroPor">

            <Bewise:FlashControl ID="FlashControl1" runat="server" Align="Top" Height="80px" Loop="True" MovieUrl="~/images/flashvortex.swf" Scale="Noborder" Width="960px" />

        </div>
        <div id="abajoPor">

          
            <br />
&nbsp; <span class="auto-style3">Especiales y promociones</span><br />

          
&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/images/ofertas_slider.jpg" Width="800px" Height="500px" style="margin-left: 79px" />
            <br />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <a href="ofertas.aspx">Ver más</a><br />

        &nbsp;&nbsp;&nbsp;

        </div>

    </div>

</asp:Content>
