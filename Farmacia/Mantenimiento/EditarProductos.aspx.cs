using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Farmacia.Mantenimiento
{
    public partial class EditarProductos : System.Web.UI.Page
    {
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());
        string Id;
        string Id1;
        protected void Page_Load(object sender, EventArgs e)
        {
            Id1 = Request.QueryString["id"];
            if(!IsPostBack)
            {
                Id = Request.QueryString["id"];
                SqlCommand comando = new SqlCommand("SELECT * FROM Medicamentos WHERE Id_med= '" + Id + "'", conexion);
                conexion.Open();
                SqlDataReader leer = comando.ExecuteReader();
                if (leer.Read())
                {
                    lblIdProductos.Text = Convert.ToString(leer.GetInt32(0));
                    lblNombre.Text = leer.GetString(1);
                    lblDescripcion.Text = leer.GetString(2);
                    lblTipo.Text = leer.GetString(3);
                    lblFuncion.Text = leer.GetString(4);
                    txtCosto.Text = Convert.ToString(leer.GetDouble(5));
                    txtFechaVencimiento.Text = Convert.ToString(leer.GetDateTime(6));
                    lblLote.Text = leer.GetString(7);
                    lblSerial.Text = leer.GetString(8);
                    txtCantidad.Text = Convert.ToString(leer.GetInt32(9));
                    txtPrecio.Text = Convert.ToString(leer.GetDouble(13));
                    imgProductos.ImageUrl = "/images/" + leer.GetString(12).Trim();
                    txtDescuento.Text = Convert.ToString(leer.GetDouble(15));
                }
                conexion.Close();
            }
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if (txtCantidad.Text == " " || txtCosto.Text == " " || txtDescuento.Text == " " || txtFechaVencimiento.Text == " " || txtPrecio.Text == " " || !uploadImage.HasFile)
            {
                Label13.Text = "No puede dejar ningun campo vacio, incluyendo el de la foto.";
            }
            else
            {
                SqlCommand cantidadcomando = new SqlCommand("Select Cant_med from Medicamentos where Id_med='" + Id1 + "'", conexion);
                conexion.Open();
                SqlDataReader leercantidad = cantidadcomando.ExecuteReader();
                if (leercantidad.Read())
                {
                    int cantidadmod = Convert.ToInt32(txtCantidad.Text) + leercantidad.GetInt32(0);
                    conexion.Close();
                    if (cantidadmod >= 50)
                    {
                        if (cantidadmod <= 500)
                        {
                            if (Convert.ToDouble(txtCosto.Text) <= Convert.ToDouble(txtPrecio.Text))
                            {
                                conexion.Open();
                                SqlCommand comando = new SqlCommand("UPDATE Medicamentos set Cant_med=@cant, Costo_med=@costo, Precio_med=@precio, Fecha_vence=@fecha, Foto_med=@foto, Descuento=@desc WHERE Nom_med='" + lblNombre.Text + "'", conexion);
                                comando.Parameters.AddWithValue("cant", cantidadmod);
                                comando.Parameters.AddWithValue("costo", txtCosto.Text);
                                comando.Parameters.AddWithValue("precio", txtPrecio.Text);
                                comando.Parameters.AddWithValue("fecha", Convert.ToDateTime(txtFechaVencimiento.Text));
                                comando.Parameters.AddWithValue("foto", uploadImage.FileName);
                                comando.Parameters.AddWithValue("desc", txtDescuento.Text);
                                comando.ExecuteNonQuery();
                                conexion.Close();
                                Label13.Text = "Medicamento actualizado correctamente";
                                Response.Redirect("/Mantenimiento/mantenimientoproduct.aspx");
                            }
                            else
                            {
                                Label13.Text = "El costo del medicamento no puede ser mayor que el precio.";
                                conexion.Close();
                            }
                        }
                        else
                        {
                            Label13.Text = "No esta permitido que la cantidad ingresada mas la cantidad actual sumen mas de 500 unidades. ";
                        }
                    }
                    else
                    {
                        Label13.Text = "La cantidad del medicamento no puede ser menor a 50.";
                    }

                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Mantenimiento/mantenimientoproduct.aspx");
        }
    }
}