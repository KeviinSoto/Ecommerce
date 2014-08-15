using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmacia.InicioSesion
{
    public static class LoginService
    {
        public static bool Autenticar(string usuario, string password)
        {
            //Declaramos la sentencia SQL
            string sql = @"SELECT COUNT (*) FROM Clientes WHERE Email_cliente = @usuario AND Con_cliente = @contrasenia";

            //Utilizamos string para indicar al compilador que dentro de este bloque se llama al metodo Dispose.
            //para asi liberar recursos cuento antes mejor. en este caso nos ocupamos de decirle a la base de dato que cierre la conexion.
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString()))
            {
                con.Open();
                SqlCommand comando = new SqlCommand(sql, con);
                comando.Parameters.AddWithValue("@usuario", usuario);
                //string hash = Helper.EncodePassword(string.Concat(usuario, password));
                comando.Parameters.AddWithValue("@contrasenia", password);

                int count = Convert.ToInt32(comando.ExecuteScalar());

                if (count == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }

            }
        }

        public static void Security(int userId, string usuario, DateTime ultimoAcc, string ip)
        {
            string sql = @"INSERT INTO UsuarioSecurity(Id_cliente, Email_cliente, Utlimo_acceso, IPAcceso) VALUES (@userId, @usuario, @ultimoAcc, @ip) SELECT SCOPE_IDENTITY()";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString()))
            {
                SqlCommand comand = new SqlCommand(sql, con);
                comand.Parameters.AddWithValue("@Id_cliente", userId);
                comand.Parameters.AddWithValue("@Email_cliente", usuario);
                comand.Parameters.AddWithValue("@Utlimo_acceso", ultimoAcc);
                comand.Parameters.AddWithValue("@IPAcceso", ip);

                con.Open();

                int resultado = Convert.ToInt32(comand.ExecuteScalar());
            }
        }

        public static DataTable prConsultaUsuario(string usuario, string password)
        {
            string sql = @"SELECT Id_cliente FROM Clientes WHERE Email_cliente = @usuario AND Con_cliente = @password";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString()))
            {

                SqlCommand comando = new SqlCommand(sql, con);
                comando.Parameters.AddWithValue("@usuario", usuario);
                //string hash = Helper.EncodePassword(string.Concat(usuario, password));
                comando.Parameters.AddWithValue("@password", password);
                con.Open();

                SqlDataAdapter dataAdapter = new SqlDataAdapter(comando);
                DataTable dtDatos = new DataTable();
                dataAdapter.Fill(dtDatos);
                return dtDatos;
            }

        }
    }
}