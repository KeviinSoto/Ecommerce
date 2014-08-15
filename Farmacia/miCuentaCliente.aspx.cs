using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Farmacia
{
    public partial class miCuentaCliente : System.Web.UI.Page
    {

        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());
        string correo;
        Carrito.productoBL c = new Carrito.productoBL();

        protected void Page_Load(object sender, EventArgs e)
        {

            correo = (string)(Session["Correo"]);
            if (correo != "administrador@farmagilmary.somee.com")
            {
                gvOrdenes.DataSource = c.ordenes(correo);
                gvOrdenes.DataBind();
            }
            else
            {
                //gvOrdenes.AutoGenerateColumns = true;
                gvOrdenes.DataSource = c.todasLasOrdenes();
                gvOrdenes.DataBind();
                Button3.Visible = false;
            }

        }

        protected void botonModificarCuenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarCuenta.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Carrito/pedido.aspx");
        }

    }
}