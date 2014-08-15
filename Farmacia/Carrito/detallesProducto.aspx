<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="detallesProducto.aspx.cs" Inherits="Farmacia.Carrito.detallesProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

            <link rel="stylesheet" href="../Estilos/estiloProductos.css" type="text/css" media="screen" />

     <div id="lineaLista">

         &nbsp;&nbsp;&nbsp;
        Productos

    </div>

    <div id="lista">
        <div id="lateralLista">
            </div>
        <div id="principalLista">

    <br />


    <br />
    <table style="width:100%;">
        <tr>
            <td rowspan="6" style="width: 187px">
                    <asp:Image ID="Image1" runat="server" Height="300px" Width="300px" />
                </td>
            <td style="width: 89px">Código:</td>
            <td>
                <asp:Label ID="lblcodigo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 89px">Nombre:</td>
            <td>
                <asp:Label ID="lblNombre" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 89px">Tipo:</td>
            <td>
                <asp:Label ID="lblTipo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 89px">Precio:</td>
            <td>
                <asp:Label ID="lblPrecio" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 89px">Cantidad:</td>
            <td>
                <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 89px"></td>
            <td>
                <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar al carrito" Width="119px" OnClick="btnAgregar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnComprar" runat="server" Text="Carrito" OnClick="btnComprar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnRegresar" runat="server" Text="Seguir comprando" Width="136px" OnClick="btnRegresar_Click" />
<br />
    <br />

            </div>

    </div>

</asp:Content>
