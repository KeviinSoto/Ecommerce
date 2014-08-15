<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="mantenimientoclient.aspx.cs" Inherits="Farmacia.Mantenimiento.mantenimientoclient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMan" runat="server">

        <link rel="stylesheet" href="../Estilos/estiloProductos.css" type="text/css" media="screen" />

     <div id="lineaLista">

         &nbsp;&nbsp;&nbsp;
        Productos

    </div>

    <div id="lista">
        <div id="lateralLista">
             <ul>
                        <li><a href="/Mantenimiento/mantenimientoclient.aspx">Clientes</a></li>
                        <li><a href="/Mantenimiento/mantenimientoproduct.aspx">Productos</a></li>
                        
                    </ul>
            </div>
        <div id="principalLista">

    <br />
&nbsp;
    <asp:Button ID="btnactivos" runat="server" OnClick="btnactivos_Click" Text="Clientes activos" />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btninactivos" runat="server" Text="Usuarios inactivos" />
    <br />
&nbsp;&nbsp;

    <asp:GridView ID="mantenimientoc" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" Width="820px" >
        <Columns>
            <asp:BoundField DataField="Nom_cliente" HeaderText="Nombre" />
            <asp:BoundField DataField="Ape_cliente" HeaderText="Apellido" />
            <asp:BoundField DataField="Tel_cliente" HeaderText="Telefono" />
            <asp:BoundField DataField="Dir_cliente" HeaderText="Direccion" />
            <asp:BoundField DataField="Email_cliente" HeaderText="Email" />
        </Columns>
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

    </div>

</asp:Content>
