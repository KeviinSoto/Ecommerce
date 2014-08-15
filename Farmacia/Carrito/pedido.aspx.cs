using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Farmacia.Carrito
{
    public partial class pedido : System.Web.UI.Page
    {
        string Correo;
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());
        double sub;
        double itb;
        double total;

        protected void Page_Load(object sender, EventArgs e)
        {
            Correo = (string)(Session["Correo"]);
            if (!IsPostBack)
            {
                
                //instancia DetalleBL
                DetalleBL tabla = new DetalleBL((DataTable)Session["carrito"]);

                //listar
                GridView1.DataSource = tabla.getRegistro;
                GridView1.DataBind();

                //mostrar el total
                sub = Convert.ToDouble(tabla.totaliza());
                itb = sub * 0.18;
                total = sub + itb;
                lblSubtotal.Text = sub.ToString();
                lblItbis.Text = itb.ToString();
                lblTotal.Text = total.ToString();
                Pago.DatosCarrito.monto = total;
                Label2.Text = Pago.DatosCarrito.nombre;
                //Label1.Text = Correo;

            }
        }

       
        protected void btnPagar_Click(object sender, EventArgs e)
        {
           Response.Redirect("/Pago/formapago.aspx");
          
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("detallesProducto.aspx");
        }
    }
}