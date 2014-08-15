using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Farmacia.Carrito
{
    public class DataPedido
    {
        //declaracion de variables
        private int nped;
        private string cliente;
        private DateTime fpedido;
        private decimal monto;

        public int Nped
        {
            get { return nped; }
            set { nped = value; }
        }

        public string Cliente
        {
            get { return cliente; }
            set { cliente = value; }
        }

        public DateTime Fpedido
        {
            get { return fpedido; }
            set { fpedido = value; }
        }

        public decimal Monto
        {
            get { return monto; }
            set { monto = value; }
        }
    }
}