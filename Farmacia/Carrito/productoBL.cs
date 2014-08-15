using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//importar librerias
using System.Data;
using System.Data.SqlClient;

namespace Farmacia.Carrito
{
    public class productoBL
    {
        //instanciar conexion
        conexionBL cn = new conexionBL();

        //definir una vista que filtre los productos
        private DataView dv;

        public productoBL()
        {
            //definir al dataview como vista de producto
            dv = listado().DefaultView;
        }

        //listar productos
        public DataTable listado()
        {
            SqlDataAdapter da = new SqlDataAdapter("Select Id_med, Tipo_med, Nom_med, Precio_med, '~/images/'+Foto_med as Foto_med from Medicamentos ORDER BY Nom_med ASC", cn.getcn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        //filtar productos por su nombre
        public DataView filtro(string nom)
        {
            //filtrar por las iniciales del nombre
            dv.RowFilter = "Nom_med LIKE '" + nom + "%'";
            //retornar lista

            return dv;
        }

        public DataTable porTipo(string nombre)
        {
            SqlDataAdapter da = new SqlDataAdapter("Select Id_med, Nom_med, Tipo_med, Precio_med, '~/images/'+Foto_med as Foto_med from Medicamentos where Funcion_med ='" + nombre + "' ORDER BY Nom_med ASC", cn.getcn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable ordenes(string correo)
        {
            SqlDataAdapter da = new SqlDataAdapter("Select Fecha, Monto from tb_pedido where Email_cliente ='" + correo + "'", cn.getcn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable todasLasOrdenes()
        {
            SqlDataAdapter da = new SqlDataAdapter("Select Nombre_cliente, Email_cliente, Fecha, Monto from tb_pedido", cn.getcn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dt.Columns.Add("Nombre", Type.GetType("System.String"));
            dt.Columns.Add("Email", Type.GetType("System.String"));
            return dt;
        }
    }
}