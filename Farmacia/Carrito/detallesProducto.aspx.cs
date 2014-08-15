using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Farmacia.Carrito
{
    public partial class detallesProducto : System.Web.UI.Page
    {
        //instanciar producto
        productoBL p = new productoBL();
        conexionBL c = new conexionBL();
        string Correo;
        protected void Page_Load(object sender, EventArgs e)
        {
            Correo = (string)(Session["Correo"]);
            //si la pagina no ha sido llamada 
            if (!IsPostBack)
            {
                //si no hay cookie
                if (Request.Cookies["dato"] == null)
                {
                    Response.Redirect("listaProductos.aspx");
                }

                else
                {
                    //recuperar los datos
                    c.getcn.Open();
                    lblNombre.Text = Request.Cookies["dato"].Values["nombre"];
                    SqlCommand comando = new SqlCommand("Select Id_med, Foto_med, Precio_med from Medicamentos where Nom_med='" + lblNombre.Text + "'", c.getcn);
                    SqlDataReader leer = comando.ExecuteReader();

                    if (leer.Read())
                    {
                        lblcodigo.Text = Convert.ToString(leer.GetInt32(0));
                        Image1.ImageUrl = "/images/" + leer.GetString(1).Trim();
                        lblPrecio.Text = Convert.ToString(leer.GetDouble(2));
                        c.getcn.Close();
                    }
                    c.getcn.Close();
                    lblTipo.Text = Request.Cookies["dato"].Values["tipo"];

                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (Correo == null)
            {
                Response.Write("<script>alert('" + "Debe de inicar sesion para poder annadir productos a su carrito. " + "');</script>");
                //Response.Redirect("/portadaCliente.aspx");
            }
            else
            {
                if (txtCantidad.Text != "")
                {
                    if (Convert.ToInt32(txtCantidad.Text) <= 0)
                    {
                        lblError.Text = "La cantidad debe ser mayor que 0.";
                    }
                    else
                    {
                       
                        double desc=0;
                        double totaldesc;
                        double resta=0;
                        lblError.Text = "";
                        //inicializar DetalleBL y le psasamos como parametro la sesion
                        DetalleBL tabla = new DetalleBL((DataTable)Session["carrito"]);
                        SqlCommand comando = new SqlCommand("Select Descuento from Medicamentos where Nom_med='"+lblNombre.Text+"'", c.getcn);
                        c.getcn.Open();
                        SqlDataReader leer = comando.ExecuteReader();
                        if(leer.Read())
                        {
                            desc = leer.GetDouble(0); 
                        }
                         c.getcn.Close();
                        //ejecuto y muestro el mensaje
                         if (desc == 0)
                         {
                             Pago.DatosCarrito.descuento = desc;
                         }
                         else
                         {
                             Pago.DatosCarrito.descuento = desc;
                             totaldesc = desc * double.Parse(lblPrecio.Text);
                             resta = double.Parse(lblPrecio.Text) - totaldesc;
                         }
                        string mensaje = tabla.agregar(int.Parse(lblcodigo.Text), lblNombre.Text, decimal.Parse(lblPrecio.Text), int.Parse(txtCantidad.Text), resta);
                         lblMensaje.Text = mensaje;
                        // ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('" + (mensaje) + "');</script");
                        
                        //actualizamos la sesion
                        Session["carrito"] = tabla.getRegistro;
                    }
                }
                else
                {
                    lblError.Text = "Debe ingresar la cantidad.";
                }

            }


        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            if (Correo == null)
            {
                Response.Write("<script>alert('" + "Debe de inicar sesion para poder ver su carrito. " + "');</script>");
                //Response.Redirect("/portadaCliente.aspx");
            }
            else
            {
                Response.Redirect("pedido.aspx");
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaProductos.aspx");
        }
    }
}