using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Farmacia.InicioSesion
{
    public partial class ingresar : System.Web.UI.Page
    {
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/registrarse.aspx");
        }

        protected void botonIniciar_Click(object sender, EventArgs e)
        {
                //Se declara la variable usuario de tipo string y se le inidica que reemplace los caracteres que son: ; y -- 
                //para evitar sql inyeccion lo mismo para la contrasenia.
                string usuario = this.textCorreo.Text.Replace(";", "").Replace("--", "");
                string contrasenia = this.textCon.Text.Replace(";", "").Replace("--", "");
                //Se manda a llamar el metodo Autenticas que esta parametrizado y se le pasan los valores correspondientes.
                if (InicioSesion.LoginService.Autenticar(usuario, contrasenia) == true)
                {
                    //Se verifica en la base de datos el correo del usuario y se almacena en la variable tblusuario
                    DataTable tblusuario = InicioSesion.LoginService.prConsultaUsuario(usuario, contrasenia);
                    //Como seguridad se alamcena en la base de datos el corro electronico, la fecha de ingreso y el numero de veces
                    //que el usuario ha ingresado de manera correcta
                    //Login.LoginService.Security(Convert.ToInt32(tblusuario.Rows[0]["Id_cliente"]), usuario, DateTime.Now, Request.ServerVariables["REMOTE_ADDR"]);
                    //Se declara y se le davalor a la variable sesion usuario
                    Session["Id_Cliente"] = tblusuario.Rows[0]["Id_cliente"].ToString();
                    string correo = usuario;
                    Session.Add("Correo", correo);
                    //Manda a la principal de ser correcto el login
                    Response.Redirect("/default.aspx");
                    //Response.Redirect("MiCuenta.aspx");
                }
                else
                {
                    if (textCorreo.Text == "" || textCon.Text == "")
                    {
                        lblMensaje.Text = "Debe de introducir ambos datos para poder iniciar sesion";
                    }
                    else
                    {
                        //Mensaje de error en caso de no ser usuario registrado
                        lblMensaje.Text = "Correo electronico/contrasenia incorrectas. Verifique por favor.";
                        textCorreo.Text = "";
                        textCon.Text = "";
                    }
                }
        }

        protected void botonCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/portadaCliente.aspx");
        }

        protected void botonOlvidaCon_Click(object sender, EventArgs e)
        {
            String valor = textCorreo.Text;
            Response.Redirect("/recuperarContrasenia.aspx?valor=" + valor);
        }
    }
}