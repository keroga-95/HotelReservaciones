using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class ExitoReservacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idPersona"] == null)
            { Response.Redirect("~/Pages/Login.aspx"); }

            lblMensage.Text = "Su reserva fue creada exitosamente, aquí esta su nuevo número de reserva: " + Request.QueryString["id"];

        }//Fin Page load

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