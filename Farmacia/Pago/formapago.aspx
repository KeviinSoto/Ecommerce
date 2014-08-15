<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="formapago.aspx.cs" Inherits="Farmacia.Pago.formapago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

    <link rel="stylesheet" href="../Estilos/estiloPago.css" type="text/css" media="screen" />

    <div id="formapago">

        <br />
&nbsp; <strong><span class="auto-style3">Selecciones la forma de pago:</span></strong><br />
        <br />
&nbsp;&nbsp;

        <asp:ImageButton ID="PayPal" runat="server" ImageUrl="~/images/paypal.jpg" Height="200px" Width="200px" OnClick="PayPal_Click" />
        <br />
        <br />
        <br />
        &nbsp;
        <asp:ImageButton ID="Tarjeta" runat="server" ImageUrl="~/images/3 logos tc.gif" Height="200px" Width="200px" OnClick="Tarjeta_Click" />

        <br />
        <br />

    </div>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style3 {
            font-size: large;
        }
    </style>
</asp:Content>

