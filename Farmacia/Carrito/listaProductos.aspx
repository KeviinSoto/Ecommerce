<%@ Page Title="" Language="C#" MasterPageFile="~/principalCliente.Master" AutoEventWireup="true" CodeBehind="listaProductos.aspx.cs" Inherits="Farmacia.Carrito.listaProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

        <link rel="stylesheet" href="../Estilos/estiloProductos.css" type="text/css" media="screen" />

    <div id="lineaLista">
        &nbsp;&nbsp;&nbsp;
        Productos

    </div>

    <div id="lista">
        <div id="lateralLista">

            &nbsp;&nbsp;
            <br />
&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" BackColor="#c8fbf2" BorderStyle="None" Text="Analgesico" Width="155px" OnClick="Button3_Click" />
            <br />
&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" BackColor="#c8fbf2" BorderStyle="None" Text="Antigripal" Width="155px" OnClick="Button4_Click" />
            <br />
            <br />
&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" BackColor="#c8fbf2" BorderStyle="None" Text="Anticuagulante" Width="155px" OnClick="Button5_Click" />
            <br />
            <br />
&nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" BackColor="#c8fbf2" BorderStyle="None" Text="Antiflamatorio" Width="155px" OnClick="Button6_Click" />
            <br />
            <br />
&nbsp;&nbsp;
            <asp:Button ID="Button7" runat="server" BackColor="#c8fbf2" BorderStyle="None" Text="Antialergico" Width="155px" OnClick="Button7_Click" />
            <br />
            <br />
&nbsp;&nbsp;
            <asp:Button ID="Button8" runat="server" BackColor="#c8fbf2" BorderStyle="None" Text="Diabetico" Width="155px" OnClick="Button8_Click" />
            <br />
            <br />
&nbsp;&nbsp;
            <asp:Button ID="Button9" runat="server" BackColor="#c8fbf2" BorderStyle="None" Text="Diuretico" Width="155px" OnClick="Button9_Click" />
            <br />
            <br />
&nbsp;&nbsp;
            <asp:Button ID="Button10" runat="server" BackColor="#c8fbf2" BorderStyle="None" Text="Desparasitante" Width="155px" OnClick="Button10_Click" />
            <br />
            <br />
&nbsp;&nbsp;
            <asp:Button ID="Button11" runat="server" BackColor="#c8fbf2" BorderStyle="None" Text="Suplemento vitaminico" Width="155px" OnClick="Button11_Click" />
            <br />
            <br />

        </div>
        <div id="principalLista">

              <br />
&nbsp; Ingrese el nombre del medicamento:&nbsp; &nbsp;<asp:TextBox ID="txtNombre" runat="server" Width="205px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"/>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtNombre" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[A-Za-z]+$">Solo se aceptan letras.</asp:RegularExpressionValidator>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <br />
&nbsp;<asp:GridView ID="gvMedicamentos" runat="server" CellPadding="4" ForeColor="Black" 
                    GridLines="Horizontal" DataKeyNames="Id_med" AutoGenerateColumns="False" 
                   
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="100%" OnPageIndexChanging="gvMedicamentos_PageIndexChanging1" OnSelectedIndexChanged="gvMedicamentos_SelectedIndexChanged1" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Ver" >
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
                &nbsp;<br />


        </div>

    </div>

</asp:Content>
