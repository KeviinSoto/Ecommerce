<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="codigoconfirmacion.aspx.cs" Inherits="Farmacia.codigoconfirmacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            font-size: large;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

    
    <link rel="stylesheet" href="Estilos/estiloRegistro.css" type="text/css" media="screen" />


    <div id="lineaCodigo">

        &nbsp;&nbsp;&nbsp; Confirmar</div>

        <div id="codigo">

            &nbsp;
            <br />
&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Times New Roman" Font-Size="X-Large" ForeColor="Blue" style="font-size: large"></asp:Label>
        <br />
        <br />
        &nbsp;
        <asp:Label ID="Label2" runat="server" Text="Introduzca el codigo:"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtCodigo" runat="server"  style="margin-left: 0px" Width="160px"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Button ID="botonContinuar" runat="server" Text="Continuar" OnClick="botonContinuar_Click"  />


            <br />
            <br />


        </div>

</asp:Content>
