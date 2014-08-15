<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="registrarse.aspx.cs" Inherits="Farmacia.registrarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style2 {
            font-size: large;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

        <link rel="stylesheet" href="Estilos/estiloRegistro.css" type="text/css" media="screen" />


    <div id="lineaRegistro">
        &nbsp;&nbsp;&nbsp;
        Registrarse</div>

    <div id="registro">
        
        <br />
        &nbsp;
        <asp:Label ID="Label2" runat="server" Text="Nombres:*"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtNombres" runat="server" style="margin-left: 0px" Width="243px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtNombres" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[A-Za-z]+$">Solo se aceptan letras.</asp:RegularExpressionValidator>
        <br />
        <br />
        &nbsp;
        <asp:Label ID="Label3" runat="server" Text="Apellidos:*"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtApellidos" runat="server" style="margin-left: 0px" Width="249px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtApellidos" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[A-Za-z]+$">Solo se aceptan letras.</asp:RegularExpressionValidator>
            <br />
        <br />
        &nbsp;
        <asp:Label ID="Label13" runat="server" Text=" Cedula de identidad:*"></asp:Label>
       <br />
        &nbsp;
        <asp:TextBox ID="txtCedula" runat="server" style="margin-left: 0px" Width="243px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCedula" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9]+$">Solo se aceptan numeros</asp:RegularExpressionValidator>
            <br />
        <br />
        &nbsp;
        <asp:Label ID="Label4" runat="server" Text="Telefono:*"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtTelefono" runat="server" style="margin-left: 0px" TextMode="Phone" Width="243px" MaxLength="11"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9]+$">Solo se aceptan numeros</asp:RegularExpressionValidator>
        <br />
        <br />
        &nbsp;
        <asp:Label ID="Label5" runat="server" Text="Celular:*"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtCelular" runat="server" style="margin-left: 0px" TextMode="Phone" Width="243px" MaxLength="11"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtCelular" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9]+$">Solo se aceptan numeros</asp:RegularExpressionValidator>
            <br />
        <br />
        &nbsp;
        <asp:Label ID="Label6" runat="server" Text="Direccion:*"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtDireccion" runat="server" style="margin-left: 0px" Width="300px" Height="73px"></asp:TextBox>
        <br />
        &nbsp;
        <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="A esta direccion le seran enviados los productos comprados."></asp:Label>
        <br />
        <br />
        &nbsp;
        <asp:Label ID="Label8" runat="server" Text="Correo electronico:*"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtCorreo" runat="server" style="margin-left: 0px" TextMode="Email" Width="243px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCorreo" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Formato del email no es correcto.</asp:RegularExpressionValidator>
        <br />
        <br />
        &nbsp;
        <asp:Label ID="Label9" runat="server" Text="Contraseña:*"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtContrasena" runat="server" style="margin-left: 0px" TextMode="Password" Width="243px"></asp:TextBox>
        <br />
        <br />
        &nbsp;
        <asp:Label ID="Label10" runat="server" Text="Repita contraseña:*"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtRepContrasenia" runat="server" TextMode="Password" Width="243px"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtContrasena" ControlToValidate="txtRepContrasenia" ErrorMessage="CompareValidator" ForeColor="Red">Las contraseñas no coinciden.</asp:CompareValidator>
        <br />
        <br />
        &nbsp;
        <asp:Label ID="Label11" runat="server" Text="Numero de tarjeta de credito:*"></asp:Label>
        <br />
        &nbsp;
        <asp:TextBox ID="txtTarjeta" runat="server" Width="243px" MaxLength="16"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtTarjeta" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9]+$">Solo se aceptan numeros</asp:RegularExpressionValidator>
        <br />
            <br />
            <br />
            &nbsp;
            <asp:Label ID="Label12" runat="server" Font-Size="Small" ForeColor="Red" Text="*Todos los campos son obligatorios."></asp:Label>
        <br />
        <br />
        <asp:Button ID="botonRegistrarse" runat="server" Text="Registrarse" style="margin-left: 130px" OnClick="botonRegistrarse_Click"/>
        <asp:Button ID="botonCancelar" runat="server" style="margin-left: 128px" Text="Cancelar" OnClick="botonCancelar_Click" />
            <br />
            <br />

    </div>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Label ID="lblStatus" runat="server"></asp:Label>

</asp:Content>
