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
                        var reservacion = db.SpObtenerReservacionPorId(id).FirstOrDefault();//Se usa para cargar la info en la tabla
                        string estado = db.SpConsultarReservacionParaModificar(id).FirstOrDefault().Estado.ToString(); //Se usa para obetner el estado, eso es usado en cancelar la reserva
                        var lista = db.SpBitacoraPorReservacion(id).ToList();//Se usa para cargar el grd de bitacora

                        if (estado == "A") 
                        {
                            if (esEmpleado == true && reservacion.FechaSalida > DateTime.Now.Date) { btnEditar.Visible = true; }
                            else if (esEmpleado == false && reservacion.FechaEntrada > DateTime.Now.Date) { btnEditar.Visible = true; }
                        }//Fin estado A btnEditar, esto vuelve el boton visible si se cumple las condiciones.

                        if (estado == "A" && reservacion.FechaEntrada > DateTime.Now.Date) { btnCancelar.Visible = true; }
                        //Fin estado A btnCancelar, esto vuelve el boton visible si se cumple las condiciones.

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

                        }//Fin IF reservacion, si reservacion no es null, carga los detalles en el table
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
            Response.Redirect("~/Pages/ModificarReservacion.aspx?idReservacion=" + txtNumReservacion.Text, false);
            Context.ApplicationInstance.CompleteRequest();
        }//Fin btnEditar, redirige al usuario a la pagina editar para la reservacion especifica

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                int reservacionID = Convert.ToInt32(txtNumReservacion.Text);
                Boolean empleado = Convert.ToBoolean(Session["esEmpleado"]);
                using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                {
                    var reservacionDetalle = db.SpConsultarReservacionParaModificar(reservacionID).FirstOrDefault();
                    string estadoR = reservacionDetalle.Estado.ToString();

                    if (estadoR == "I")
                    {
                        if (empleado == true) { Response.Redirect("~/Pages/GestionarReservaciones.aspx"); }
                        else { Response.Redirect("~/Pages/MisReservaciones.aspx"); } //Fin if/else empleado.
                    }//Fin if Estado = I, no se puede cancelar de nuevo.

                    DateTime fechaSalida = reservacionDetalle.FechaSalida;
                    DateTime fechaEntrada = reservacionDetalle.FechaEntrada;

                    if (fechaSalida <= DateTime.Now.Date)
                    {
                        if (empleado == true) { Response.Redirect("~/Pages/GestionarReservaciones.aspx"); }
                        else { Response.Redirect("~/Pages/MisReservaciones.aspx"); } //Fin if/else empleado.
                    }//Fin if fecha salida, si salida es menor al dia de hoy, no se puede cancelar, redirige segun es empleado

                    if (fechaEntrada <= DateTime.Now.Date && fechaSalida > DateTime.Now.Date)
                    {
                        if (empleado == true) { Response.Redirect("~/Pages/GestionarReservaciones.aspx"); }
                        else { Response.Redirect("~/Pages/MisReservaciones.aspx"); } //Fin if/else empleado. }
                    }//Fin feacha de entrada/salida, si la reservacion esta en proceso, solo empleados pueden modificarla

                    int idPersona = Convert.ToInt32(Session["idPersona"]);
                    db.SpCancelarReservacion(reservacionID, idPersona);

                    Response.Redirect("~/Pages/ReservacionCancelada.aspx");

                }//Fin DB
            }//Fin try
            catch
            {

            }
        }//Fin btnCancelar
    }
}