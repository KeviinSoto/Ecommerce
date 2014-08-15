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
    public partial class ModificarCuenta : System.Web.UI.Page
    {
        string Correo;
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            conexion.Open();
            Correo = (string)(Session["Correo"]);
            SqlCommand comando = new SqlCommand("SELECT Nom_cliente, Ape_cliente, Dir_cliente, Celular_cliente, Con_cliente, Numero_tarjeta FROM Clientes WHERE Email_cliente =@email", conexion);
            comando.Parameters.AddWithValue("email", Correo);
            SqlDataReader lectura = comando.ExecuteReader();
            if (lectura.Read())
            {
                txtNombre.Text = lectura.GetString(0).Trim();
                txtApellido.Text = lectura.GetString(1).Trim();
                txtDireccion.Text = lectura.GetString(2).Trim();
                txtCelular.Text = lectura.GetString(3).Trim();
                txtEmail.Text = Correo.Trim(); ;
                txtTarjeta.Text = lectura.GetString(5).Trim(); ;
                //txtContra.Text = lectura.GetString(4);
            }
            conexion.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            conexion.Open();
            SqlCommand comando = new SqlCommand("UPDATE Clientes set Nom_cliente=@nom, Ape_cliente=@ape, Dir_cliente=@dir, Celular_cliente=@cell, Numero_tarjeta=@tarjeta WHERE Email_cliente='" + Correo + "'", conexion);
            comando.Parameters.AddWithValue("nom", txtNombre.Text);
            comando.Parameters.AddWithValue("ape", txtApellido.Text);
            comando.Parameters.AddWithValue("dir", txtDireccion.Text);
            comando.Parameters.AddWithValue("cell", txtCelular.Text);
            comando.Parameters.AddWithValue("tarjeta", txtTarjeta.Text);
            //comando.Parameters.AddWithValue("con", txtContra.Text);
            comando.ExecuteNonQuery();
            conexion.Close();
            Response.Write("<script>alert('" + "Datos modificados correctamente." + "');</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("/miCuentaCliente.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email1 = txtEmail.Text;
            Session.Add("Email1", email1);
            Response.Redirect("/ModificarCuentaContrasenia.aspx");
        }
    }
}