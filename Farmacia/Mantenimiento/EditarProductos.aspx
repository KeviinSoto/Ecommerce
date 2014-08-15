<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="EditarProductos.aspx.cs" Inherits="Farmacia.Mantenimiento.EditarProductos" %>
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

     <table class="TableBorder">
        <tr>
            <td class="TableHeader" colspan="3" style="font-size: x-large">
                <strong>Edicion Producto  
            </strong>  
            </td>
        </tr>
        <tr><td colspan="3" class="auto-style1"></td></tr>
        <tr>
            <td style="width:50px">
                <asp:Label ID="Label1" runat="server" Text="Id" style="font-size: large"></asp:Label>
                <br />
            </td>
            <td >
                <asp:Label ID="lblIdProductos" runat="server"/>
            </td>
            <td >
                <asp:Label ID="Label4" runat="server" Text="Imagen" style="font-size: large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Nombre" style="font-size: large"></asp:Label>
                <br />
            </td>
            <td>
                <asp:Label ID="lblNombre" runat="server"/>
            </td>
            <td rowspan="3">
                <asp:Image ID="imgProductos" runat="server" Width="100px" Height="100px"/>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Descripcion" style="font-size: large"></asp:Label>
                <br />
            </td>
            <td>
                <asp:Label ID="lblDescripcion" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>
               <asp:Label ID="Label5" runat="server" Text="Fecha Vencimiento" Width="140px" style="font-size: large"></asp:Label>     
                <br />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtFechaVencimiento" Width="128px" ReadOnly="false"/>
<%--                <asp:ImageButton runat="Server" ID="imgCalendar" ImageUrl="~/images/Calendar_schedule.png" AlternateText="" /><br />--%>
                <%--<ajaxToolkit:CalendarExtender ID="dtpCalendar" runat="server" TargetControlID="txtFechaVencimiento" 
                            PopupButtonID="imgCalendar" />--%>
              <%--  <asp:RequiredFieldValidator ID="rfvFechaVencimiento" runat="server" 
                        ErrorMessage="El Campo Fecha es obligatorio" 
                        ControlToValidate="txtFechaVencimiento" Display="Dynamic"></asp:RequiredFieldValidator>--%>
            </td>
        </tr>
        
        <tr>
            <td>
               <asp:Label ID="Label6" runat="server" Text="Tipo" Width="140px" style="font-size: large"></asp:Label>     
                <br />
            </td>
            <td>
                <asp:Label  ID="lblTipo" runat="server"/>
            </td>
            <td>
                <asp:FileUpload ID="uploadImage" runat="server" />
            </td>
        </tr>

        <tr>
            <td>
               <asp:Label ID="Label7" runat="server" Text="Funcion" Width="140px" style="font-size: large"></asp:Label>     
                <br />
            </td>
            <td>
                <asp:Label ID="lblFuncion" runat="server"/>
            </td>
        </tr>

         <tr>
            <td>
               <asp:Label ID="Label8" runat="server" Text="Lote" Width="140px" style="font-size: large"></asp:Label>     
                <br />
            </td>
            <td>
                <asp:Label ID="lblLote" runat="server"/>
            </td>
        </tr>

        <tr>
            <td>
               <asp:Label ID="Label9" runat="server" Text="Serial" Width="140px" style="font-size: large"></asp:Label>     
                <br />
            </td>
            <td>
                <asp:Label ID="lblSerial" runat="server"/>
            </td>
        </tr>

        <tr>
            <td>
               <asp:Label ID="Label10" runat="server" Text="Cantidad" Width="140px" style="font-size: large"></asp:Label>     
                <br />
            </td>
            <td>
                <asp:TextBox ID="txtCantidad" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCantidad" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9.]+$">Solo se aceptan numeros.</asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr>
            <td>
               <asp:Label ID="Label11" runat="server" Text="Costo" Width="140px" style="font-size: large"></asp:Label>     
                <br />
            </td>
            <td>
                <asp:TextBox ID="txtCosto" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCosto" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9.]+$">Solo se aceptan numeros.</asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr>
            <td>
               <asp:Label ID="Label12" runat="server" Text="Precio" Width="140px" style="font-size: large"></asp:Label>     
                <br />
            </td>
            <td>
                <asp:TextBox ID="txtPrecio" runat="server"/>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPrecio" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9.]+$">Solo se aceptan numeros.</asp:RegularExpressionValidator>
            </td>
        </tr>

          <tr>
             <td>
                 <asp:Label ID="Label14" runat="server" Text="Descuento" Width="140px"></asp:Label> 
             </td>
             <td>
                 <asp:TextBox ID="txtDescuento" runat="server"/>
                 <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtDescuento" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9.]+$">Solo se aceptan numeros.</asp:RegularExpressionValidator>
             </td>
             <td>
                 &nbsp;</td>
         </tr>
        
       <%-- <tr>
            <td valign="top">
               <asp:Label ID="Label6" runat="server" Text="Estudios" Width="140px"></asp:Label>     
            </td>
            <td colspan="3">
                <asp:CheckBoxList ID="chkEstudios" runat="server">
                </asp:CheckBoxList>
            </td>
        </tr>--%>
        <tr>
            <td colspan="3">
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="Label13" runat="server"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="3" >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnGrabar" runat="server" Text="Actualizar" 
                    onclick="btnGrabar_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                    onclick="btnCancelar_Click" Height="26px" />
            </td>
        </tr>
    </table>

            </div>

    </div>

</asp:Content>
