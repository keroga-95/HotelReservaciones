using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class detalleReservacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try 
            {
                if (IsPostBack != true) 
                {
                    // 1. Validar que exista sesión
                    if (Session["idPersona"] == null)
                    {
                        Response.Redirect("~/Pages/Login.aspx");
                        return;
                    }//Fin if session

                    // 2. Validar parámetro get
                    int idPersona = Convert.ToInt32(Session["idPersona"]);
                    bool esEmpleado = Session["esEmpleado"] != null && (bool)Session["esEmpleado"];

                    if (string.IsNullOrEmpty(Request.QueryString["idReservacion"]))
                    {
                        Response.Redirect("~/Pages/MisReservaciones.aspx");
                        return;
                    }

                    int id = int.Parse(Request.QueryString["idReservacion"]);
                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase")) 
                    { 
                        var reservacion = db.SpObtenerReservacionPorId(id).FirstOrDefault();
                        if (reservacion != null) 
                        {
                            txtNumReservacion.Text = reservacion.NumeroReservacion.ToString();
                            txtHotel.Text = reservacion.Hotel.ToString();
                            txtNumHabitacion.Text = reservacion.NumeroHabitacion.ToString();
                            txtCliente.Text = reservacion.Cliente.ToString();
                            txtFechaEntrada.Text = reservacion.FechaEntrada.ToShortDateString();
                            txtFechaSalida.Text = reservacion.FechaSalida.ToShortDateString();
                            txtDiasReserva.Text = reservacion.DiasReserva.ToString();
                            txtNumAdultos.Text = reservacion.NumeroAdultos.ToString();
                            txtNumNinhos.Text = reservacion.NumeroNinhos.ToString();
                            /*txtCostoTotal.Text = reservacion.CostoTotal.ToString();*/
                            txtCostoTotal.Text = string.Format("${0:N2}", reservacion.CostoTotal);

                        }//Fin IF reservacion
                        else 
                        { Response.Redirect("~/Pages/MisReservaciones.aspx"); }//Fin else reservacion
                    }//Fin Using DB
                }//Fin if
            }//Fin Try
            catch 
            { 
            }//Fin catch

        }
    }
}