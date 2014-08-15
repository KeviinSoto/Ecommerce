using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Farmacia
{
    public partial class codigoconfirmacion : System.Web.UI.Page
    {
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());
        string nombre;
        string apellido;
        string cedula;
        string telefono;
        string celular;
        string direccion;
        string email;
        string contra;
        string tarjeta;

        protected void Page_Load(object sender, EventArgs e)
        {
            String Valor = Request.QueryString["valor"];
            Label1.Text = "Se le ha enviado un correo de confirmacion a " + Valor + " con el codigo de verificacion que debe introducir mas abajo \n \n Nota: Si no encuentra su email en la bandeja de entrada puede ser porque se encuentra en la bandeja de correos no deseados.";
            nombre = (string)(Session["Nombre"]);
            apellido = (string)(Session["Apellido"]);
            cedula = (string)(Session["Cedula"]);
            telefono = (string)(Session["Telefono"]);
            celular = (string)(Session["Celular"]);
            direccion = (string)(Session["Direccion"]);
            email = (string)(Session["Email"]);
            contra = (string)(Session["Contra"]);
            tarjeta = (string)(Session["Tarjeta"]);
        }

        protected void botonContinuar_Click(object sender, EventArgs e)
        {
            SqlCommand comando = new SqlCommand("SELECT * FROM Codigos_confirmacion", conexion);
            conexion.Open();
            SqlDataReader leer = comando.ExecuteReader();
            if (leer.Read())
            {
                if (txtCodigo.Text.Trim() == leer.GetString(0).Trim())
                {
                    conexion.Close();
                    SqlCommand comando1 = new SqlCommand("DELETE FROM Codigos_confirmacion WHERE Codigo_confirmacion= @codigo", conexion);
                    conexion.Open();
                    comando1.Parameters.AddWithValue("codigo", txtCodigo.Text.Trim());
                    comando1.ExecuteNonQuery();
                    conexion.Close();
                    SqlCommand comando2 = new SqlCommand("INSERT INTO Clientes (Nom_cliente, Ape_cliente, Ced_cliente, Tel_cliente, Celular_cliente, Dir_cliente, Email_cliente, Con_cliente, Numero_tarjeta,Fecha_ingreso ) values (@nombre, @apellido, @cedula, @telefono, @celular, @direccion, @email, @password, @tarjeta, GETDATE())", conexion);
                    conexion.Open();
                    comando2.Parameters.AddWithValue("nombre", nombre);
                    comando2.Parameters.AddWithValue("apellido", apellido);
                    comando2.Parameters.AddWithValue("cedula", cedula);
                    comando2.Parameters.AddWithValue("telefono", telefono);
                    comando2.Parameters.AddWithValue("celular", celular);
                    comando2.Parameters.AddWithValue("direccion", direccion);
                    comando2.Parameters.AddWithValue("email", email);
                    comando2.Parameters.AddWithValue("password", contra);
                    comando2.Parameters.AddWithValue("tarjeta", tarjeta);
                    comando2.ExecuteNonQuery();
                    conexion.Close();
                    SqlCommand comando3 = new SqlCommand("INSERT INTO PayPal (Correo, Contrasenia, Monto) values(@correo, @contra, @monto)", conexion);
                    conexion.Open();
                    comando3.Parameters.AddWithValue("correo", email);
                    comando3.Parameters.AddWithValue("contra", contra);
                    comando3.Parameters.AddWithValue("monto", 10000);
                    comando3.ExecuteNonQuery();
                    conexion.Close();
                    SqlCommand comando4 = new SqlCommand("INSERT INTO Tarjeta (Tarjeta, Contrasenia, Monto) values(@tarjeta, @contra, @monto)", conexion);
                    conexion.Open();
                    comando4.Parameters.AddWithValue("tarjeta", tarjeta);
                    comando4.Parameters.AddWithValue("contra", contra);
                    comando4.Parameters.AddWithValue("monto", 10000);
                    comando4.ExecuteNonQuery();
                    conexion.Close();
                    Response.Write("<script>alert('" + "Registro correcto." + "');</script>");
                    Response.Redirect("/InicioSesion/ingresar.aspx");
                }
                else
                {
                    Response.Write("<script>alert('" + "El codigo ingresado es incorrecto." + "');</script>");
                }

            }
        }
    }
}