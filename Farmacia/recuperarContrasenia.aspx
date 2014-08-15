<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="recuperarContrasenia.aspx.cs" Inherits="Farmacia.recuperarContrasenia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

    <link rel="stylesheet" href="Estilos/estiloRegistro.css" type="text/css" media="screen" />


    <div id="lineaRegistro">
        &nbsp;&nbsp;&nbsp;
        Recuperar contraseña</div>

    <div id="recuperar">

        &nbsp;&nbsp;

        <asp:Label ID="Label1" runat="server" Font-Size="Larger"></asp:Label>
        <br />
        <br />
        &nbsp;
        <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" Width="268px"></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCorreo" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Formato del email no es correcto.</asp:RegularExpressionValidator>
        <br />
        <br />
        &nbsp;
        <asp:Button ID="botonEnviar" runat="server" Text="Enviar" OnClick="botonEnviar_Click" style="height: 26px" />
        <br />
        <br />

    </div>

    <br style="clear:both;"/>

</asp:Content>
