<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="ModificarCuentaContrasenia.aspx.cs" Inherits="Farmacia.ModificarCuentaContrasenia" %>
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
    
        <asp:Label ID="Label1" runat="server" Text="Modificar contraseña" style="font-weight: 700; font-size: large"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Escriba contraseña actual:"></asp:Label>
        <br />
        &nbsp;&nbsp;
        <asp:TextBox ID="txtViejaContra" runat="server" TextMode="Password" Width="160px" MaxLength="24"></asp:TextBox>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Escriba contraseña nueva:"></asp:Label>
        <br />
        &nbsp;&nbsp;
        <asp:TextBox ID="txtNuevaContra" runat="server" TextMode="Password" Width="160px" MaxLength="24"></asp:TextBox>
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Repita nueva contraseña:"></asp:Label>
        <br />
        &nbsp;&nbsp;
        <asp:TextBox ID="txtRepNuevaContra" runat="server" TextMode="Password" Width="160px" MaxLength="24"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNuevaContra" ControlToValidate="txtRepNuevaContra" ErrorMessage="CompareValidator" ForeColor="Red">Las contrasenias no coinciden.</asp:CompareValidator>
        <br />
         <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="botonGuardar" runat="server" OnClick="botonGuardar_Click" Text="Guardar" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="botonCancelar" runat="server" OnClick="botonCancelar_Click" style="margin-left: 25px" Text="Cancelar" />
    
         <br />
    
    </div>

</asp:Content>
