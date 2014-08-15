using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace Farmacia
{
    public partial class registrarse : System.Web.UI.Page
    {
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void botonRegistrarse_Click(object sender, EventArgs e)
        {
            int renglon = 0;
            if (txtNombres.Text == "" || txtApellidos.Text == "" || txtCedula.Text == "" || txtTelefono.Text == "" || txtCelular.Text == "" || txtDireccion.Text == "" || txtCorreo.Text == "" || txtContrasena.Text == "" || txtRepContrasenia.Text == "" || txtTarjeta.Text == "")
            {
                Response.Write("<script>alert('" + "Debe llenar todos los campos" + "');</script>");
            }
            else
            {
                conexion.Open();

                SqlCommand comando = new SqlCommand("SELECT Email_cliente FROM Clientes where Email_cliente='" + txtCorreo.Text + "'", conexion);
                SqlDataReader leer = comando.ExecuteReader();

                if (leer.Read())
                {

                    if (txtCorreo.Text.Trim() == leer.GetString(renglon).Trim())
                    {
                        Response.Write("<script>alert('" + "El correo electronico ingresado ya esta registrado." + "');</script>");
                    }
                    else
                    {

                    }
                }
                else
                {
                    string nombre = txtNombres.Text;
                    string apellido = txtApellidos.Text;
                    string cedula = txtCedula.Text;
                    string telefono = txtTelefono.Text;
                    string celular = txtCelular.Text;
                    string direccion = txtDireccion.Text;
                    string email = txtCorreo.Text;
                    string contra = txtRepContrasenia.Text;
                    string tarjeta = txtTarjeta.Text;
                    Session.Add("Nombre", nombre);
                    Session.Add("Apellido", apellido);
                    Session.Add("Cedula", cedula);
                    Session.Add("Telefono", telefono);
                    Session.Add("Celular", celular);
                    Session.Add("Direccion", direccion);
                    Session.Add("Email", email);
                    Session.Add("Contra", contra);
                    Session.Add("Tarjeta", tarjeta);
                    conexion.Close();

                    String valor = txtCorreo.Text;
                    conexion.Open();
                    SqlCommand comando1 = new SqlCommand("SELECT * FROM Codigos_confirmacion", conexion);
                    SqlDataReader leer1 = comando1.ExecuteReader();
                    if (leer1.Read())
                    {
                        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                        message.To.Add(txtCorreo.Text);
                        message.Subject = "Confirmar registro";
                        message.From = new System.Net.Mail.MailAddress("administrador@farmagilmary.somee.com");
                        message.Body = "Su codigo de confirmacion es: "+leer1.GetString(0)+"";
                        System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.farmagilmary.somee.com", 26);
                        smtp.Credentials = new System.Net.NetworkCredential("administrador@farmagilmary.somee.com", "verificacion");
                        smtp.Send(message);
                        lblStatus.Text = "Correo de confirmacion enviado";
                        conexion.Close();
                        Response.Redirect("codigoconfirmacion.aspx?valor=" + valor);

                    }
                }
             
            }
        }

        protected void botonCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/default.aspx");
        }
    }
}