<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="AgregarProductos.aspx.cs" Inherits="Farmacia.Mantenimiento.AgregarProductos" %>
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
            <td class="TableHeader" colspan="2" style="font-size: large">
                <strong><span style="font-size: x-large">Agregar Producto</span> </strong>  
            </td>
        </tr>
        <tr><td colspan="2" class="auto-style1"></td></tr>
        <tr>
            <td style="width: 164px" >
                <asp:Label ID="Label1" runat="server" Text="Imagen" Font-Size="20pt" style="font-size: large"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" Width="309px" />
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 164px">
                <asp:Label ID="Label2" runat="server" Text="Nombre" Font-Size="20pt" style="font-size: large"></asp:Label>
            </td>
            <td>
                <asp:Textbox ID="txtNombre" runat="server" Width="184px"/>
                <br />
            </td>
           
        </tr>

        <tr>
            <td style="width: 164px">
                <asp:Label ID="Label3" runat="server" Text="Descripcion" Font-Size="20pt" style="font-size: large"></asp:Label>
            </td>
            <td>
                <asp:Textbox ID="txtDescripcion" runat="server" Height="72px" Width="231px"/>
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 164px">
               <asp:Label ID="Label4" runat="server" Text="Fecha Vencimiento" Width="140px" Font-Size="20pt" style="font-size: large"></asp:Label>     
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtFechaVencimiento" Width="121px" ReadOnly="false"/>
<%--                <asp:ImageButton runat="Server" ID="imgCalendar" ImageUrl="~/images/Calendar_schedule.png" AlternateText="" /><br />--%>
                <%--<ajaxToolkit:CalendarExtender ID="dtpCalendar" runat="server" TargetControlID="txtFechaVencimiento" 
                            PopupButtonID="imgCalendar" />--%>
                <%--<asp:RequiredFieldValidator ID="rfvFechaVencimiento" runat="server" 
                        ErrorMessage="El Campo Fecha es obligatorio" 
                        ControlToValidate="txtFechaVencimiento" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <br />
            </td>
        </tr>
        
        <tr>
            <td valign="top" style="width: 164px">
               <asp:Label ID="Label5" runat="server" Text="Tipo" Width="140px" Font-Size="20pt" style="font-size: large"></asp:Label>     
            </td>
            <td>
                <asp:Textbox  ID="txtTipo" runat="server"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtFuncion" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[A-Z a-z]+$">Solo se aceptan letras.</asp:RegularExpressionValidator>
                <br />
            </td>
            
        </tr>

        <tr>
            <td style="width: 164px">
               <asp:Label ID="Label6" runat="server" Text="Funcion" Width="140px" Font-Size="20pt" style="font-size: large"></asp:Label>     
            </td>
            <td>
                <asp:Textbox ID="txtFuncion" runat="server"/>
                <br />
            </td>
        </tr>

         <tr>
            <td style="width: 164px">
               <asp:Label ID="Label7" runat="server" Text="Lote" Width="140px" Font-Size="20pt" style="font-size: large"></asp:Label>     
            </td>
            <td>
                <asp:textbox ID="txtLote" runat="server"/>
                <br />
            </td>
        </tr>

        <tr>
            <td style="height: 26px; width: 164px;">
               <asp:Label ID="Label8" runat="server" Text="Serial" Width="140px" Font-Size="20pt" style="font-size: large"></asp:Label>     
            </td>
            <td style="height: 26px">
                <asp:Textbox ID="txtSerial" runat="server"/>
                <br />
            </td>
        </tr>

        <tr>
            <td style="width: 164px">
               <asp:Label ID="Label9" runat="server" Text="Cantidad" Width="140px" Font-Size="20pt" style="font-size: large"></asp:Label>     
            </td>
            <td>
                <asp:TextBox ID="txtCantidad" runat="server"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCantidad" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9.]+$">Solo se aceptan numeros.</asp:RegularExpressionValidator>
                <br />
            </td>
        </tr>

        <tr>
            <td style="height: 26px; width: 164px;">
               <asp:Label ID="Label10" runat="server" Text="Costo" Width="140px" Font-Size="20pt" style="font-size: large"></asp:Label>     
            </td>
            <td style="height: 26px">
                <asp:TextBox ID="txtCosto" runat="server"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCosto" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9.]+$">Solo se aceptan numeros.</asp:RegularExpressionValidator>
                <br />
            </td>
        </tr>

        <tr>
            <td style="width: 164px">
               <asp:Label ID="Label11" runat="server" Text="Precio" Width="140px" Font-Size="20pt" style="font-size: large"></asp:Label>     
            </td>
            <td>
                <asp:TextBox ID="txtPrecio" runat="server"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPrecio" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[0-9.]+$">Solo se aceptan numeros.</asp:RegularExpressionValidator>
                <br />
            </td>
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
            <td colspan="2"> 
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2"> 
                <asp:Label ID="Label12" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2" >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnGueardar" runat="server" Text="Guardar" 
                    onclick="btnGuardar_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                    onclick="btnCancelar_Click" Height="26px" />
            </td>
        </tr>
    </table>

            </div>

    </div>

</asp:Content>
