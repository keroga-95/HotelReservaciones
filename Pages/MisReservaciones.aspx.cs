using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class misReservaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try 
            {
                Boolean Empleado = Convert.ToBoolean(Session["esEmpleado"]);
                if (Session["idPersona"] != null) {
                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                    {
                        int idPersona = Convert.ToInt32(Session["idPersona"]);
                        var reservacion = db.SpReservacionesPorPersona(idPersona).ToList();
                        grdReservaciones.DataSource = reservacion;
                        grdReservaciones.DataBind();
                    }/*Fin DB, se confirma que en la session idPersona no sea null, esto confirma el inicio de session
                     se usa la conexion a la db para cargar la informacion al grdView.*/
                }
                else
                {
                    Response.Redirect("~/Pages/Login.aspx");
                } //Fin else, si idPersona es null o vacio, se re-dirige al usuario al login.
            }
            catch (Exception ex)
            {}

        }//Fin page_load

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
        }//fin Evaluador, se toma el estado y se confirmar seguna las fechas para cambiar el estado a su string correcto

    }
}