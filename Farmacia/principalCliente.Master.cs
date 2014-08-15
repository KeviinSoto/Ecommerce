using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Farmacia
{
    public partial class principal : System.Web.UI.MasterPage
    {
        string Correo;
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        { 
            Correo= (string)(Session["Correo"]);
            if (Correo != null)
            {
                Button1.Text = "Cerrar Sesion";
                Button2.Visible = true;
            }
            else
            {
                Button1.Text = "Iniciar Sesion";
                Button2.Visible = false;
            }
            SqlCommand comando = new SqlCommand("Select Nom_cliente, Ape_cliente from Clientes where Email_cliente='" + Correo + "'", cn);
            cn.Open();
            SqlDataReader leer = comando.ExecuteReader();
            if (leer.Read())
            {
                Button2.Text = leer.GetString(0).Trim() + " " + leer.GetString(1).Trim();
            }
            else
            {
                Button2.Text = "Mi cuenta";
            }
            cn.Close();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Correo == null)
            {
                Response.Redirect("/InicioSesion/ingresar.aspx");
            }
            else 
            {
                Session.Abandon();
                Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                Response.Redirect("/default.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Correo != null)
            {
                Response.Redirect("/miCuentaCliente.aspx");
            }
            else
            {
                Response.Redirect("/InicioSesion/ingresar.aspx");
            }
        }
    }
}