using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmacia.Pago
{
    public partial class formapago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PayPal_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Pago/paypal.aspx");
        }

        protected void Tarjeta_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Pago/tarjetacredito.aspx");
        }
    }
}