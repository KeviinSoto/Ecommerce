<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="ModificarCuenta.aspx.cs" Inherits="Farmacia.ModificarCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

        <link rel="stylesheet" href="Estilos/estiloRegistro.css" type="text/css" media="screen" />

    <div id="lineaRegistro">
        &nbsp;&nbsp;&nbsp;
        Mi cuenta</div>

    <div id="registro">
    
        <br />
&nbsp;&nbsp;
    
        <asp:Label ID="Label1" runat="server" Text="Modificar datos de tu cuenta" style="font-weight: 700; font-size: large"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Nombre:"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" Height="17px" style="margin-left: 33px" Width="160px" MaxLength="25"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[A-Z a-z]+$">Solo se puede introducir letras.</asp:RegularExpressionValidator>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Apellido:"></asp:Label>
        <asp:TextBox ID="txtApellido" runat="server" style="margin-left: 33px" Width="160px" MaxLength="25"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtApellido" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[A-Z a-z]+$">Solo se puede introudicr letras.</asp:RegularExpressionValidator>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Direccion:"></asp:Label>
        <asp:TextBox ID="txtDireccion" runat="server" style="margin-left: 27px" Width="160px" MaxLength="50"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Telefono:"></asp:Label>
        <asp:TextBox ID="txtCelular" runat="server" style="margin-left: 33px" Width="160px" MaxLength="11"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCelular" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9]+$">Solo se puede introducir numeros.</asp:RegularExpressionValidator>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Text="Tarjeta:"></asp:Label>
        <asp:TextBox ID="txtTarjeta" runat="server" MaxLength="16" style="margin-left: 43px" Width="160px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtTarjeta" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9]+$">Solo se puede introducr numeros</asp:RegularExpressionValidator>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Email:"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" Enabled="False" style="margin-left: 54px" Width="160px"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Text="Contrasenia:"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 0px" Text="Editar contraseña" BackColor="White" BorderColor="Blue" BorderWidth="1px" />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="margin-left: 0px" Text="Modificar" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="margin-left: 40px" Text="Cancelar" />
    
        <br />
        <br />
    
    </div>

</asp:Content>

