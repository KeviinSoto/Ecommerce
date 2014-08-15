using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Farmacia
{
    public partial class ModificarCuentaContrasenia : System.Web.UI.Page
    {
        string Email1;
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            Email1 = (string)(Session["Email1"]);
        }

        protected void botonGuardar_Click(object sender, EventArgs e)
        {
            if (txtViejaContra.Text == "" || txtNuevaContra.Text == "" || txtRepNuevaContra.Text == "")
            {
                Response.Write("<script>alert('" + "Debe llenar todos los campos para poder cambiar su contrasenia." + "');</script>");
            }
            else
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand("SELECT Con_cliente FROM Clientes WHERE Email_cliente= @email", conexion);
                comando.Parameters.AddWithValue("email", Email1);
                SqlDataReader leer = comando.ExecuteReader();
                if (leer.Read())
                {
                    if (txtViejaContra.Text == leer.GetString(0).Trim() && txtNuevaContra.Text == txtRepNuevaContra.Text)
                    {
                        SqlCommand comand = new SqlCommand("UPDATE Clientes set Con_cliente =@con WHERE Email_cliente=@correo", conexion);
                        comand.Parameters.AddWithValue("con", txtRepNuevaContra.Text);
                        comand.Parameters.AddWithValue("correo", Email1);
                        conexion.Close();
                        conexion.Open();
                        comand.ExecuteNonQuery();
                        conexion.Close();
                        Response.Redirect("/ModificarCuenta.aspx");
                    }
                    else
                    {
                        lblError.Text = "Contrasenia ingresada no es correcta.";
                    }
                }
            }
        }

        protected void botonCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ModificarCuenta.aspx");
        }
    }
}