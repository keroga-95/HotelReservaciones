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
                    }//Fin QueryString null

                    int id = int.Parse(Request.QueryString["idReservacion"]);
                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase")) 
                    { 
                        var reservacion = db.SpObtenerReservacionPorId(id).FirstOrDefault();
                        var lista = db.SpBitacoraPorReservacion(id).ToList();
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

                            grdBitacora.DataSource = lista;
                            grdBitacora.DataBind();

                        }//Fin IF reservacion
                        else 
                        {
                            if (esEmpleado)
                                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
                            else
                                Response.Redirect("~/Pages/MisReservaciones.aspx"); ; }//Fin else reservacion
                    }//Fin Using DB
                }//Fin if
            }//Fin Try
            catch 
            { 
            }//Fin catch
        }//Fin PageLoad

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Boolean Empleado = Convert.ToBoolean(Session["esEmpleado"]);
            if (Empleado)
                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
            else
                Response.Redirect("~/Pages/MisReservaciones.aspx");
        }//Fin regresar

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ModificarReservacion");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Boolean Empleado = Convert.ToBoolean(Session["esEmpleado"]);
            if (Empleado)
                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
            else
                Response.Redirect("~/Pages/MisReservaciones.aspx");
        }
    }
}