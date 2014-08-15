using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//importar librerias 
using System.Data;
using System.Data.SqlClient;

namespace Farmacia.Carrito
{
    public class Detalle
    {
        //definir un datatable: estructura del carrito
        private DataTable tabla;

        public Detalle()
        {
            //inicializar tabla
            tabla = new DataTable();

            //le agregamos columnas
            tabla.Columns.Add("Código", Type.GetType("System.Int32")); //le damos un nombre y un tipo de datos
            tabla.Columns.Add("Nombre", Type.GetType("System.String"));
            tabla.Columns.Add("Precio", Type.GetType("System.Decimal"));
            tabla.Columns.Add("Cantidad", Type.GetType("System.Int32"));
            tabla.Columns.Add("Descuento", Type.GetType("System.Decimal"));
  

            //columna calculada
            if (Pago.DatosCarrito.descuento == 0)
            {
                tabla.Columns.Add("Total", Type.GetType("System.Decimal"), "Precio*Cantidad");
            }
            else
            {
                tabla.Columns.Add("Total", Type.GetType("System.Decimal"), "Descuento*Cantidad");
            }
           // tabla.Columns.Add("Aplicando descuento", Type.GetType("System.Decimal"), "Descuento*Cantidad");
            //definir clave
            tabla.PrimaryKey = new DataColumn[] { tabla.Columns[0] };
        }

        //retornar tabla
        public DataTable getTabla
        {
            get
            {
                return tabla;
            }
        }
    }
}