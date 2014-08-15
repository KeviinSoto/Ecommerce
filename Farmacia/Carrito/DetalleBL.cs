using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//impotar librerias 
using System.Data;
using System.Data.SqlClient;

namespace Farmacia.Carrito
{
    public class DetalleBL
    {
        //definir un datatable que trabajara con todos los registros del carrito
        private DataTable registro;

        //crear un construtor que reciba el contenido del carrito
        public DetalleBL(DataTable carrito)
        {
            this.registro = carrito;
        }

        //retornar o enviar
        public DataTable getRegistro
        {
            get
            {
                return registro;
            }
        }

        //metodo que agrega un produto al carrito y retorna la configuracion del proceso
        public String agregar(int cod, string nom, decimal pre, int cant, double descuento)
        {
            string msg = " ";

            //buscar registro por su codigo: clave
            DataRow fila = registro.Rows.Find(cod);

            //si lo encuentra 
            if (fila != null)
            {
                msg = "Ya existe en el carrito";
            }

            else
            {
                fila = registro.NewRow(); //nueva fila

                //agregamos 
                fila[0] = cod;
                fila[1] = nom;
                fila[2] = pre;
                fila[3] = cant;
                fila[4] = descuento;


                //agregamos fila al registro
                registro.Rows.Add(fila);
                msg = "Agregado al carrito";
            }

            return msg;
        }

        //metodo que retorne el total del pedido
        public decimal totaliza()
        {
            decimal t = 0;
            if (registro.Rows.Count > 0)
            {
                t = (decimal)registro.Compute("sum(total)", "");
            }

            return t;
        }

        //metodo autogenerar
        public int autogenera()
        {
            //instanciar la conexion 
            conexionBL cn = new conexionBL();

            //comando que selecciona el count de tb_pedido
            SqlCommand cmd = new SqlCommand("select count(*) from tb_pedido", cn.getcn);
            cn.getcn.Open(); //abrir la conexion
            int i = (int)cmd.ExecuteScalar() + 1; //ejecuto y retorno count
            cn.getcn.Close();

            //retorno el nuevo id del producto
            return (i);
        }

        //metodo que registra el pedido y sus detalles
        public string grabar(DataPedido dp)
        {
            string msg = "";

            //autogenerado 
            int np = autogenera();

            //instancia la conexion
            conexionBL cn = new conexionBL();
            //abrir conexion
            cn.getcn.Open();

            //definir que es una transaccion
            SqlTransaction tr = cn.getcn.BeginTransaction(IsolationLevel.Serializable);

            //comando que ejecuta el insert en la tabla tb_pedido
            SqlCommand cmd = new SqlCommand("Insert into tb_pedido values(@n, @f, @c, @m)", cn.getcn, tr);

            //lista de parametros
            cmd.Parameters.Add("@n", SqlDbType.Int).Value = np;
            cmd.Parameters.Add("@f", SqlDbType.DateTime).Value = dp.Fpedido;
            cmd.Parameters.Add("@c", SqlDbType.VarChar).Value = dp.Cliente;
            cmd.Parameters.Add("@m", SqlDbType.Decimal).Value = dp.Monto;

            try
            {
                //ejecuto
                cmd.ExecuteNonQuery();

                //grabar el detalle
                foreach (DataRow fila in registro.Rows)
                {
                    //comando que ejecuta el insert en la tabla tb_pedido
                    SqlCommand cmd2 = new SqlCommand("Insert into tb_pedido values(@n, @prod, @pred, @cant)", cn.getcn, tr);

                    //lista de parametros
                    cmd2.Parameters.Add("@n", SqlDbType.Int).Value = np;
                    cmd2.Parameters.Add("@prod", SqlDbType.Int).Value = fila[0];
                    cmd2.Parameters.Add("@pred", SqlDbType.Decimal).Value = fila[2];
                    cmd2.Parameters.Add("@cant", SqlDbType.Int).Value = fila[3];
                }

                tr.Commit(); //actualiza base de datos

                msg = "Pedido agregar";
            }

            catch (Exception ex)
            {
                //de haber un error lo capturo
                msg = ex.Message;

                //deshacemos la operacion
                tr.Rollback();
            }

            finally
            {
                cn.getcn.Close(); //cerramos la conexion
            }

            return msg;

        }
    }
}