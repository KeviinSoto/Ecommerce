using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmacia
{
    public partial class principalAdm : System.Web.UI.MasterPage
    {
        string Correo;
        protected void Page_Load(object sender, EventArgs e)
        {
            Correo = (string)(Session["Correo"]);
            if (Correo != null)
            {
                Button1.Text = "Cerrar Sesion";
            }
            else
            {
                Button1.Text = "Iniciar Sesion";
            }
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
            Response.Redirect("/miCuentaCliente.aspx");
        }
    }
}