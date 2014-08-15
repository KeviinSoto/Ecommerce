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
    public partial class AgregarProductos : System.Web.UI.Page
    {
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile || txtNombre.Text == "" || txtDescripcion.Text == "" || txtTipo.Text == "" || txtFuncion.Text == "" || txtCosto.Text == "" || txtFechaVencimiento.Text == "" || txtLote.Text == "" || txtSerial.Text == "" || txtCantidad.Text == "" || txtPrecio.Text == "")
            {
                Label12.Text = "Debe de llenar todos los campos";
            }
            else
            {
                if (Convert.ToInt32(txtCantidad.Text) >= 50)
                {
                    if (Convert.ToInt32(txtCantidad.Text) <= 500)
                    {
                        if (Convert.ToInt32(txtCosto.Text) <= Convert.ToInt32(txtPrecio.Text))
                        {
                            conexion.Open();
                            SqlCommand comando = new SqlCommand("Insert into Medicamentos(Nom_med, Des_med, Tipo_med, Funcion_med, Costo_med, Fecha_vence, No_lote, Serial_med, Cant_med, Cant_maxima, Cant_minima, Precio_med, Foto_med) values(@nombre,@descripcion, @tipo, @funcion, @costo, @vence, @lote, @serial, @cantidad, 500, 50, @precio, @fotomdd)", conexion);
                            comando.Parameters.AddWithValue("nombre", txtNombre.Text);
                            comando.Parameters.AddWithValue("descripcion", txtDescripcion.Text);
                            comando.Parameters.AddWithValue("tipo", txtTipo.Text);
                            comando.Parameters.AddWithValue("funcion", txtFuncion.Text);
                            comando.Parameters.AddWithValue("costo", txtCosto.Text);
                            comando.Parameters.AddWithValue("vence", txtFechaVencimiento.Text);
                            comando.Parameters.AddWithValue("lote", txtLote.Text);
                            comando.Parameters.AddWithValue("serial", txtSerial.Text);
                            comando.Parameters.AddWithValue("cantidad", txtCantidad.Text);
                            comando.Parameters.AddWithValue("precio", txtPrecio.Text);
                            comando.Parameters.AddWithValue("fotomdd", FileUpload1.FileName);
                            comando.ExecuteNonQuery();
                            conexion.Close();
                            //FileUpload1.SaveAs();
                            Label12.Text = "Medicamento almacenado correctamente";
                            txtNombre.Text = "";
                            txtDescripcion.Text = "";
                            txtTipo.Text = "";
                            txtFuncion.Text = "";
                            txtCosto.Text = "";
                            txtFechaVencimiento.Text = "";
                            txtLote.Text = "";
                            txtSerial.Text = "";
                            txtCantidad.Text = "";
                            txtPrecio.Text = "";
                        }
                        else
                        {
                            Label12.Text = "El costo del medicamento no puede ser mayor que el precio de venta.";
                        }
                    }
                    else
                    {
                        Label12.Text = "La cantidad del medicamento no puede exceder las 500 unidades.";
                    }
                }
                else
                {
                    Label12.Text = "La cantidad del medicamento no puedo ser menor que 50 unidades.";
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Mantenimiento/mantenimientoproduct.aspx");
        }
    }
}