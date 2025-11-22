using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class gestionarReservaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Boolean Empleado = Convert.ToBoolean(Session["esEmpleado"]);
                if (Session["idPersona"] != null && Empleado == true)
                {
                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                    {
                        var reservacion = db.SpReservacionesParaEmpleado().ToList();
                        grdReservaciones.DataSource = reservacion;
                        grdReservaciones.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("~/Pages/Login.aspx");
                }
            }
            catch (Exception ex)
            { }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        public string EvaluadorEstado(string estado, DateTime fechaEntrada, DateTime fechaSalida)
        {
            if (estado == "I")
            {
                return "Cancelada";
            }
            else if (estado == "A")
            {
                if (fechaSalida < DateTime.Now.Date)
                {
                    return "Finalizada";
                }
                else if (fechaEntrada <= DateTime.Now.Date)
                {
                    return "En proceso";
                }
                else
                {
                    return "En espera";
                }
            }//Fin elseif "A"
            else
            {
                return "Estado invalido";
            }//Fin IF "I"
        }//fin Evaluador
    }
}