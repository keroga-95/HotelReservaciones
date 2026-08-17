using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class ReservacionActualizada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idPersona"] == null)
            { Response.Redirect("~/Pages/Login.aspx"); }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Boolean empleado = Convert.ToBoolean(Session["esEmpleado"]);
            if (empleado == true)
            {
                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
            }
            else
            {
                Response.Redirect("~/Pages/MisReservaciones.aspx");
            }//Fin If
        }//Fin btnRegresar
    }
}