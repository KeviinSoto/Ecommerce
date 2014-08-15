using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Text;


namespace Farmacia.Pago
{
    public partial class paypal : System.Web.UI.Page
    {
        string Correo, nombre;
        double monto;
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //instancia DetalleBL
                Carrito.DetalleBL tabla = new Carrito.DetalleBL((DataTable)Session["carrito"]);

                //listar
                GridView2.DataSource = tabla.getRegistro;
                GridView2.DataBind();
            }
            Correo = (string)(Session["Correo"]);
            monto = Pago.DatosCarrito.monto;
            SqlCommand comando = new SqlCommand("Select Nom_cliente, Ape_cliente from Clientes where Email_cliente='" + Correo + "'", conexion);
            conexion.Open();
            SqlDataReader leer = comando.ExecuteReader();
            if (leer.Read())
            {
                nombre = leer.GetString(0).Trim() + " " + leer.GetString(1).Trim();
                txtCorreo.Text = Correo;
                conexion.Close();
            }
            conexion.Close();
        }

        protected void botonTransaccion_Click(object sender, EventArgs e)
        {
            double capital;
            SqlCommand comando = new SqlCommand("Select * from PayPal where Correo='"+txtCorreo.Text+"' AND Contrasenia='"+txtContrasenia.Text+"'",conexion);
            conexion.Open();
            SqlDataReader leer = comando.ExecuteReader();
            if (leer.Read())
            {
                capital = leer.GetDouble(2);
                if (Pago.DatosCarrito.monto > leer.GetDouble(2))
                {
                    Label1.Text = "No tiene fondos suficiente para realizar esta transaccion.";
                    conexion.Close();
                }
                else
                {
                    conexion.Close();
                    SqlCommand comando1 = new SqlCommand("Insert into tb_pedido(Nombre_cliente, Email_cliente, Monto, Fecha) values (@nom, @email, @monto, GETDATE())", conexion);
                    comando1.Parameters.AddWithValue("nom", nombre);
                    comando1.Parameters.AddWithValue("email", Correo);
                    comando1.Parameters.AddWithValue("monto", monto);
                    conexion.Open();
                    comando1.ExecuteNonQuery();
                    conexion.Close();

                    double resta = capital - monto;
                    SqlCommand comando2 = new SqlCommand("UPDATE PayPal set Monto=@resta where Correo='"+Correo+"'", conexion);
                    conexion.Open();
                    comando2.Parameters.AddWithValue("resta", resta);
                    comando2.ExecuteNonQuery();
                    Label1.Text = "Su transaccion ha sido procesada correctamente";
                    conexion.Close();
                    foreach (GridViewRow row in GridView2.Rows)
                    {
                        string nombre1 = row.Cells[1].Text;
                        int cantidad = Convert.ToInt32(row.Cells[3].Text);
                        int resultado = 0;

                        SqlCommand comando4 = new SqlCommand("Select Cant_med from Medicamentos where Nom_med='" + nombre1 + "'", conexion);
                        conexion.Open();
                        SqlDataReader leeer3 = comando4.ExecuteReader();
                        if (leeer3.Read())
                        {
                            resultado = leeer3.GetInt32(0) - cantidad;
                            conexion.Close();
                        }
                        conexion.Close();
                        SqlCommand comando3 = new SqlCommand("Update Medicamentos set Cant_med=@cant where Nom_med='" + nombre1 + "'", conexion);
                        comando3.Parameters.AddWithValue("cant", resultado);
                        conexion.Open();
                        comando3.ExecuteNonQuery();
                        conexion.Close();
                    }


                    Response.Redirect("/Carrito/listaProductos.aspx");
                    //ENVIAR FACTURA
                }
            }
            else
            {
                Label1.Text = "Correo/contrasenia introducidos son incorrectos. \n Verifique sus datos.";
            }
            conexion.Close();
        }

        protected void botonCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pago/formapago.aspx");
        }
    }
}