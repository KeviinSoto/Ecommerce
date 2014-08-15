using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Farmacia.Mantenimiento
{
    public partial class mantenimientoclient : System.Web.UI.Page
    {
        listados p = new listados();
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());


        protected void Page_Load(object sender, EventArgs e)
        {
            //si la pagina no ha ido al servidor
            if (!IsPostBack)
            {
                mantenimientoc.DataSource = p.clientes();
                mantenimientoc.DataBind();
            }
        }

        protected void mantenimientoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //al cambiar de pagina
            mantenimientoc.PageIndex = e.NewPageIndex;

            mantenimientoc.DataSource = p.clientes();
            mantenimientoc.DataBind();
        }

        protected void btnactivos_Click(object sender, EventArgs e)
        {
            //SqlCommand comando = new SqlCommand("S")

        }
    }
}