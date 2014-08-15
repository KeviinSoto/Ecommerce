using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Farmacia.Carrito
{
    public class conexionBL
    {
        //establecer conexion
        private SqlConnection cn;

        public conexionBL()
        {
            //inicializar la conexion
            cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString());
        }

        //retornar la conexion
        public SqlConnection getcn
        {
            get
            {
                return cn;
            }
        }
    }
}