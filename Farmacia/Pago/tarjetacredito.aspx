<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="tarjetacredito.aspx.cs" Inherits="Farmacia.Pago.tarjetacredito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

        <link rel="stylesheet" href="../Estilos/estiloPago.css" type="text/css" media="screen" />

    <div id="lineaPago">

         &nbsp;&nbsp;&nbsp;
        Productos

    </div>

    <div>

    <div id="tarjeta">

        <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
            <td>Numero de tarjeta:</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:TextBox ID="txtTarjeta" runat="server" Width="251px" Enabled="False"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Contraseña:</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:TextBox ID="txtContrasenia" runat="server" Width="251px" TextMode="Password"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="botonTransaccion" runat="server" Text="Realizar Transaccion" OnClick="botonTransaccion_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="botonCancelar" runat="server" Text="Cancelar" OnClick="botonCancelar_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

    </div>
        <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="1%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Visible="False" Height="53px">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
        </div>

</asp:Content>
