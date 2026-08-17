using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class modificarReservacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                try
                {
                    if (Session["idPersona"] == null)
                    {
                        Response.Redirect("~/Pages/Login.aspx");
                        return;
                    }//Fin if session

                    Boolean empleado = Convert.ToBoolean(Session["esEmpleado"]);
                    if (string.IsNullOrEmpty(Request.QueryString["idReservacion"]))
                    {
                        if (empleado == true) { Response.Redirect("~/Pages/GestionarReservaciones.aspx");}
                        else { Response.Redirect("~/Pages/MisReservaciones.aspx"); } //Fin if/else empleado.
                    }//Fin QueryString null

                    int id = int.Parse(Request.QueryString["idReservacion"]);
                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase")) 
                    {
                        var reservacionDetalle = db.SpConsultarReservacionParaModificar(id).FirstOrDefault();

                        string estadoR = reservacionDetalle.Estado.ToString();

                        if (estadoR == "I")
                        {
                            if (empleado == true) { Response.Redirect("~/Pages/GestionarReservaciones.aspx"); }
                            else { Response.Redirect("~/Pages/MisReservaciones.aspx"); } //Fin if/else empleado.
                        }//Fin if Estado = I
                        
                        DateTime fechaSalida = reservacionDetalle.FechaSalida;
                        DateTime fechaEntrada = reservacionDetalle.FechaEntrada;

                        if (fechaSalida <= DateTime.Now.Date) {
                            if (empleado == true) { Response.Redirect("~/Pages/GestionarReservaciones.aspx"); }
                            else { Response.Redirect("~/Pages/MisReservaciones.aspx"); } //Fin if/else empleado.
                        }//Fin if fecha salida

                        if (fechaEntrada <= DateTime.Now.Date && fechaSalida > DateTime.Now.Date) {
                            if (empleado == false) { Response.Redirect("~/Pages/MisReservaciones.aspx"); }
                        }//Fin feacha de entrada/salida

                        txtHotel.Text = reservacionDetalle.NombreHotel;
                        txtNumHabitacion.Text = reservacionDetalle.NumeroHabitacion;
                        txtCliente.Text = reservacionDetalle.NombreCliente;
                        txtFechaEntrada.Text = reservacionDetalle.FechaEntrada.ToString("yyyy-MM-dd");
                        txtFechaSalida.Text = reservacionDetalle.FechaSalida.ToString("yyyy-MM-dd");
                        txtNumAdultos.Text = reservacionDetalle.NumeroAdultos.ToString();
                        txtNumNinhos.Text = reservacionDetalle.NumeroNinhos.ToString();
                    }

                }//Fin Try
                catch 
                { }//Fin catch
            }//Fin page post back
        }//Fin page load

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblError.Visible = true;
                lblError.Text = "Hay errores en la información. Revise los campos marcados.";
                return;
            }//Fin page valid

            List<string> errores = new List<string>();

            if (string.IsNullOrWhiteSpace(txtFechaEntrada.Text))
                errores.Add("Debe digitar la fecha de entrada.");

            if (string.IsNullOrWhiteSpace(txtFechaSalida.Text))
                errores.Add("Debe digitar la fecha de salida.");

            if (string.IsNullOrWhiteSpace(txtNumAdultos.Text))
                errores.Add("Debe digitar el numero de adultos");

            if (string.IsNullOrWhiteSpace(txtNumNinhos.Text))
                errores.Add("Debe digitar el numero de niños");

            if (errores.Count > 0)
            {
                lblError.Visible = true;
                lblError.Text = string.Join("<br/>", errores);
                return;
            }//Fin errors counts

            try 
            {
                int idReservacion = int.Parse(Request.QueryString["idReservacion"]);
                DateTime fechaEntrada = Convert.ToDateTime(txtFechaEntrada.Text);
                DateTime fechaSalida = Convert.ToDateTime(txtFechaSalida.Text);
                int numAdultos = Convert.ToInt32(txtNumAdultos.Text);
                int numNinhos = Convert.ToInt32(txtNumNinhos.Text);
                int totalDias = (fechaSalida - fechaEntrada).Days;

                using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                {
                    int idHotel = db.SpConsultarReservacionParaModificar(idReservacion).FirstOrDefault().IdHotel;

                    var costos = db.SpObtenerCostosHotel(idHotel).FirstOrDefault();

                    decimal costoAdulto = costos.CostoPorCadaAdulto;
                    decimal costoNinho = costos.CostoPorCadaNinho;
                    decimal costoTotal = ((costoAdulto * numAdultos) + (costoNinho * numNinhos));

                    db.SpEditarReservacion(idReservacion,fechaEntrada,fechaSalida,numAdultos,numNinhos,totalDias,costoTotal);

                    int clienteId = Convert.ToInt32(Session["idPersona"]);
                    db.SpInsertarBitacora(idReservacion, clienteId, "“CORREGIDA”");

                    Response.Redirect("~/Pages/ReservacionActualizada.aspx");

                }//Fin DB

            }//Fin try
            catch (Exception ex)
            {
                lblError.Visible = true;
                lblError.Text = "Error técnico: " + ex.Message;
            }//Fin catch

        }//Fin btnGuardar

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Boolean empleado = Convert.ToBoolean(Session["esEmpleado"]);
            if (empleado == true) { Response.Redirect("~/Pages/GestionarReservaciones.aspx"); }
            else { Response.Redirect("~/Pages/MisReservaciones.aspx"); } //Fin if/else empleado.
        }

        protected void cuvFechaEntrada_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            try
            {
                DateTime fechaEntrada = Convert.ToDateTime(txtFechaEntrada.Text);
                if (fechaEntrada > DateTime.Now.Date)
                { args.IsValid = true; } //Fin IF fecha entrada
            }//Fin try
            catch { args.IsValid = false; }//Fin catch
        }

        protected void cuvFechaSalida_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            try
            {
                DateTime fechaSalida = Convert.ToDateTime(txtFechaSalida.Text);
                DateTime fechaEntrada = Convert.ToDateTime(txtFechaEntrada.Text);
                if (fechaSalida > fechaEntrada)
                { args.IsValid = true; } //Fin IF fecha entrada
            }//Fin try
            catch { args.IsValid = false; }//Fin catch
        }
    }
}