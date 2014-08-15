using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Farmacia
{
    public partial class recuperarContrasenia : System.Web.UI.Page
    {
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            String Valor = Request.QueryString["valor"];
            if (Valor != "")
            {
                Label1.Text = "Se le va a enviar un correo el elctronico para recuperar su contrasenia a la siguiente direccion:";
                txtCorreo.Text = Valor;
                txtCorreo.Enabled = false;
            }
            else
            {
                Label1.Text = "Escrba su direccion de correo electronico con la cual esta registrado para poder recuperar su contrasenia.";
            } 
        }

        protected void botonEnviar_Click(object sender, EventArgs e)
        {
            if (txtCorreo.Text != "")
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand("Select Con_cliente from Clientes where Email_cliente=@email", conexion);
                comando.Parameters.AddWithValue("email", txtCorreo.Text);
                SqlDataReader leer1 = comando.ExecuteReader();
                if (leer1.Read())
                {
                    System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                    message.To.Add(txtCorreo.Text);
                    message.Subject = "Recuperar contrasenia";
                    message.From = new System.Net.Mail.MailAddress("administrador@farmagilmary.somee.com");
                    message.Body = "Su contrasenia es: " + leer1.GetString(0) + "";
                    System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.farmagilmary.somee.com", 26);
                    smtp.Credentials = new System.Net.NetworkCredential("administrador@farmagilmary.somee.com", "verificacion");
                    smtp.Send(message);
                    Response.Redirect("/InicioSesion/ingresar.aspx");
                }
                else
                {
                    Response.Write("<script>alert('" + "No existe ese correo electronico en nuestra base de datos. Verifique porfavor." + "');</script>");
                }
            }
        }
    }
}