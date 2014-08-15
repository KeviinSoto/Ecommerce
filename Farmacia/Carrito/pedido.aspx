<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="pedido.aspx.cs" Inherits="Farmacia.Carrito.pedido" %>
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
&nbsp;&nbsp;&nbsp;
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="98%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                <br />
&nbsp;<table style="width:100%; height: 71px;">
        <tr>
            <td style="width: 488px">
                <asp:Label ID="Label2" runat="server" ValidateRequestMode="Enabled" ViewStateMode="Enabled"></asp:Label>
            </td>
            <td style="width: 127px">Subtotal:</td>
            <td>
                    <asp:Label ID="lblSubtotal" runat="server"></asp:Label>
                </td>
        </tr>
        <tr>
            <td style="width: 488px">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
            <td style="width: 127px">Itbis</td>
            <td>
                <asp:Label ID="lblItbis" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 488px">&nbsp;</td>
            <td style="width: 127px">Importe total:</td>
            <td>
                <asp:Label ID="lblTotal" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 488px">&nbsp;</td>
            <td style="width: 127px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnPagar" runat="server" Text="Pagar" OnClick="btnPagar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnVolver" runat="server" Text="Vover" OnClick="btnVolver_Click" />
<%--        <a href="javascript:window.history.back();">&laquo; Volver atrás</a>--%>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />

            </div>

    </div>

</asp:Content>
