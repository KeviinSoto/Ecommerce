using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmacia.Carrito
{
    public partial class listaProductos : System.Web.UI.Page
    {
        //instanciar producto
        productoBL p = new productoBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //si la pagina no ha ido al servidor
            if (!IsPostBack)
            {
                //listar
                gvMedicamentos.DataSource = p.listado();
                gvMedicamentos.DataBind();

            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {



        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text == "")
            {
                lblError.Text = "Debe introducir el nombre del medicamento que desea buscar";
            }
            else
            {
                gvMedicamentos.DataSource = p.filtro(txtNombre.Text);
                gvMedicamentos.DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            gvMedicamentos.DataSource = p.porTipo(Button3.Text);
            gvMedicamentos.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            gvMedicamentos.DataSource = p.porTipo(Button4.Text);
            gvMedicamentos.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            gvMedicamentos.DataSource = p.porTipo(Button5.Text);
            gvMedicamentos.DataBind();
        }

        protected void gvMedicamentos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           
        }

        protected void gvMedicamentos_SelectedIndexChanged(object sender, EventArgs e)
        {

            
        }

        protected void gvMedicamentos_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //obtenemos el indice de la fila seleccionada 
            int f = gvMedicamentos.SelectedIndex;

            //recuperamos datos
            string nomb = gvMedicamentos.Rows[f].Cells[1].Text;
            string tipo = gvMedicamentos.Rows[f].Cells[2].Text;
            string pre = gvMedicamentos.Rows[f].Cells[3].Text;

            //cookie que envie los datos
            HttpCookie dato = new HttpCookie("dato");
            dato.Values["nombre"] = nomb;
            dato.Values["tipo"] = tipo;


            //enviar al cookie
            Response.Cookies.Add(dato);

            //redireccionar
            Response.Redirect("/Carrito/detallesProducto.aspx");
        }

        protected void gvMedicamentos_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            //al cambiar de pagina
            gvMedicamentos.PageIndex = e.NewPageIndex;

            //listar
            gvMedicamentos.DataSource = p.listado();
            gvMedicamentos.DataBind();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            gvMedicamentos.DataSource = p.porTipo(Button6.Text);
            gvMedicamentos.DataBind();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            gvMedicamentos.DataSource = p.porTipo(Button7.Text);
            gvMedicamentos.DataBind();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            gvMedicamentos.DataSource = p.porTipo(Button8.Text);
            gvMedicamentos.DataBind();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            gvMedicamentos.DataSource = p.porTipo(Button9.Text);
            gvMedicamentos.DataBind();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            gvMedicamentos.DataSource = p.porTipo(Button10.Text);
            gvMedicamentos.DataBind();
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            gvMedicamentos.DataSource = p.porTipo(Button11.Text);
            gvMedicamentos.DataBind();
        }

    }
}