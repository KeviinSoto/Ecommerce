<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="mantenimientoproduct.aspx.cs" Inherits="Farmacia.Mantenimiento.mantenimientoproduct" %>
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

    <table class="TableBorder" >
        <tr><td colspan="2">
                &nbsp;</td></tr>
        <tr><td colspan="2">
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" 
                    onclick="btnNuevo_Click" style="margin-left: 0px" />
                <br />
            </td></tr>
        <tr>
            <td class="auto-style1">
                <asp:GridView ID="gvProductos" runat="server" CellPadding="4" ForeColor="Black" 
                    GridLines="Horizontal" DataKeyNames="Id_med" AutoGenerateColumns="False" 
                    onselectedindexchanging="gvProductos_SelectedIndexChanging" 
                    onrowdeleting="gvProductos_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="655px" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                            SelectImageUrl="~/images/editar.jpg" HeaderText="Edicion" 
                             DeleteImageUrl="~/images/Delete.gif" 
                            ShowDeleteButton="True" InsertVisible="False" ShowCancelButton="False" >
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="Nom_med" HeaderText="Nombre" />
                        <asp:BoundField DataField="Tipo_med" HeaderText="Tipo" />
                        <asp:ImageField DataImageUrlField="Foto_med" HeaderText="Imagen" NullDisplayText="Este medicamento no contiene imagen.">
                            <ControlStyle Height="100px" Width="100px" />
                            <FooterStyle Height="100px" Width="100px" />
                        </asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <br />
            </td>
            <td >
                &nbsp;</td>
        </tr>

    </table>

</div>

    </div>

   

</asp:Content>
