using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Farmacia.Mantenimiento
{
    public class listados
    {

        //establecer la conexion

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString()); //cambiar la conexion

        public DataTable medicinas()
        {

            SqlDataAdapter da = new SqlDataAdapter("Select Id_med, Nom_med, Tipo_med, '~/images/'+Foto_med as Foto_med from Medicamentos", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;

        }

        public DataTable clientes()
        {

            SqlDataAdapter da = new SqlDataAdapter("Select Nom_cliente, Ape_cliente, Tel_cliente, Dir_cliente, Email_cliente from Clientes", cn); //poner los campos del cliente
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;

        }

    }
}