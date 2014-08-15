<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="ingresar.aspx.cs" Inherits="Farmacia.InicioSesion.ingresar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">

     <link rel="stylesheet" href="../Estilos/estiloIngresar.css" type="text/css" media="screen" />

    <div id="ingresar">
    
        <div id="lineaIngresar">

            Iniciar sesión</div>
        <br />
          <asp:Label ID="Label3" runat="server" Text="Esta registado? De no estar registado:"></asp:Label>
        <asp:Button ID="btnRegistrar" runat="server" BackColor="#F2F9FE" BorderStyle="None" ForeColor="#0033CC" Height="16px" OnClick="Button1_Click" style="margin-left: 6px" Text="Resgitrate aqui" Width="104px" />
        <br />
        <br />
        <asp:Label ID="lblCorreo" runat="server" Text="Correo Electronico:"></asp:Label>
        &nbsp;
        <asp:TextBox ID="textCorreo" runat="server" style="margin-left: 63px" Width="180px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblCon" runat="server" Text="Contraseña:"></asp:Label>
        <asp:TextBox ID="textCon" runat="server" style="margin-left: 116px" Width="180px" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="chkAdministrador" runat="server" Text="Administrador" />
        <br />
        <br />
        <asp:Button ID="botonIniciar" runat="server" style="margin-left: 102px" Text="Iniciar Sesion" Width="116px" OnClick="botonIniciar_Click" />
    
        <asp:Button ID="botonCancelar" runat="server" style="margin-left: 98px" Text="Cancelar" Width="94px" OnClick="botonCancelar_Click" />
    
    &nbsp;
    
        <br />
        <asp:Button ID="botonOlvidaCon" runat="server" BackColor="#F2F9FE" BorderStyle="None" ForeColor="#6699FF" style="margin-left: 147px" Text="Ha olvidado su contraseña?" Width="215px" OnClick="botonOlvidaCon_Click" />
    
    </div>

</asp:Content>
