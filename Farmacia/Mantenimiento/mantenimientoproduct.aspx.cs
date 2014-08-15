using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Farmacia.Mantenimiento
{
    public partial class mantenimientoproduct : System.Web.UI.Page
    {
        listados p = new listados();
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            //si la pagina no ha ido al servidor
            if (!IsPostBack)
            {
                gvProductos.DataSource = p.medicinas();
                gvProductos.DataBind();
            }
        }

        protected void mantenimientop_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
            //al cambiar de pagina
            gvProductos.PageIndex = e.NewPageIndex;

            gvProductos.DataSource = p.medicinas();
            gvProductos.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarProductos.aspx");
        }

        protected void gvProductos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            EditarProductos producto = new EditarProductos();
            string idproducto = Convert.ToString(gvProductos.DataKeys[e.NewSelectedIndex].Value);
            Response.Redirect(string.Format("EditarProductos.aspx?id=" + idproducto));
        }

        protected void gvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idproducto = Convert.ToInt32(gvProductos.DataKeys[e.RowIndex].Value);
            SqlCommand comando = new SqlCommand("Delete from Medicamentos where Id_med =@id", conexion);
            comando.Parameters.AddWithValue("id", idproducto);

            conexion.Open();
            comando.ExecuteNonQuery();
            conexion.Close();
        }
    }
}