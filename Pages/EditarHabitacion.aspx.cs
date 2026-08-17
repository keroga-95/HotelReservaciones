using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class EditarHabitacion : System.Web.UI.Page
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
                    if (empleado == false)
                    {
                        Response.Redirect("~/Pages/MisReservaciones.aspx");
                    }//Fin If empleado

                    if (string.IsNullOrEmpty(Request.QueryString["idHabitacion"]))
                    {
                        Response.Redirect("~/Pages/HabitacionInactiva.aspx");
                    }//Fin QueryString null


                    int id = int.Parse(Request.QueryString["idHabitacion"]);
                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                    {
                        var habitacionDetalles = db.SpObtenerDetalleHabitacion(id).FirstOrDefault();

                        if (habitacionDetalles == null)
                        { Response.Redirect("~/Pages/HabitacionInactiva.aspx"); }

                        string estado = habitacionDetalles.Estado.ToString().Trim().ToUpper();
                        if (estado == "I")
                        {
                                Response.Redirect("~/Pages/HabitacionInactiva.aspx");
                        }//Fin IF habitacion I

                        var tieneFuturas = db.SpHabitacionReservacionesFuturas(id).FirstOrDefault();
                        if (estado == "A" && tieneFuturas.TieneReservacionesFuturas == 1)
                            { Response.Redirect("~/Pages/HabitacionEnUso.aspx"); } //Fin habitacion A futuro
                        
                        else 
                            {
                            txtHotel.Text = habitacionDetalles.NombreHotel;
                            txtNumeroHab.Text = habitacionDetalles.NumeroHabitacion;
                            txtCapacidadMax.Text = habitacionDetalles.CapacidadMaxima.ToString();
                            txtDescripcion.Text = habitacionDetalles.Descripcion;
                        }//Fin else

                    }//Fin db

                }//Fin Catch
                catch (Exception ex) { Response.Redirect("~/Pages/ListaHabitaciones.aspx"); }
            }
        }//Fin Page load

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ListaHabitaciones.aspx");
        }//Fin btn Regresar

        protected void btnInactivar_Click(object sender, EventArgs e)
        {
            try 
            {
                int id = int.Parse(Request.QueryString["idHabitacion"]);
                using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase")) 
                {
                    db.SpInactivarHabitacion(id);
                    Response.Redirect("~/Pages/HabitacionActualizada.aspx");
                }
            }
            catch { }
        }//Fin btn Inactivar

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblError.Visible = true;
                lblError.Text = "Hay errores en la información. Revise los campos marcados.";
                return;
            }

            List<string> errores = new List<string>();

            if (string.IsNullOrWhiteSpace(txtNumeroHab.Text))
                errores.Add("Debe digitar el número de habitación.");

            if (string.IsNullOrWhiteSpace(txtCapacidadMax.Text))
                errores.Add("Debe digitar la capacidad máxima.");

            if (string.IsNullOrWhiteSpace(txtDescripcion.Text))
                errores.Add("Debe digitar una descripción.");

            if (errores.Count > 0)
            {
                lblError.Visible = true;
                lblError.Text = string.Join("<br/>", errores);
                return;
            }

            try
            {
                int idHab = int.Parse(Request.QueryString["idHabitacion"]);
                string numeroHabitacion = txtNumeroHab.Text.ToUpper().Trim();
                int capacidadMax = Convert.ToInt32(txtCapacidadMax.Text);
                string descripcion = txtDescripcion.Text;

                using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                {
                    db.SpActualizarHabitacion(idHab,numeroHabitacion,capacidadMax,descripcion);
                }//Fin db

                Response.Redirect("~/Pages/HabitacionActualizada.aspx");

            }//Fin try
            catch { } //Fin catch
        }//Fin btn Guardar

        protected void cuvNumeroHab_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;

            try
            {
                int idHab = int.Parse(Request.QueryString["idHabitacion"]);
                string numeroHab = txtNumeroHab.Text.ToUpper().Trim();

                // Validar ddl and txtNumeroHab
                if (String.IsNullOrWhiteSpace(numeroHab))
                {
                    args.IsValid = false;
                    return;
                }//Fin validacion

                if (numeroHab.Length > 10) //Valida longitud de txtNumeroHab.
                {
                    args.IsValid = false;
                    return;
                }//fin validacion longitud

                // Si devuelve 0 la habitación no existe y se puede crear
                using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                {
                    var habitacionDetalles = db.SpObtenerDetalleHabitacion(idHab).FirstOrDefault();
                    var resultado = db.SpVerificarNumeroHabitacion(habitacionDetalles.IdHotel, numeroHab).FirstOrDefault();
                    if (habitacionDetalles.NumeroHabitacion.ToUpper().Trim() != numeroHab) 
                    {
                        if (resultado.Existe == 0)
                        { args.IsValid = true; } //Fin if
                        else
                        { args.IsValid = false; } //fin else
                    }//Fin IF numero en la reservacion y numero en el txtBox
                    else { args.IsValid = true; }
                }//Fin DB
            }//Fin try
            catch
            {
                args.IsValid = false;
            }//Fin catch
        }//Fin cuv Numero Habitacion

        protected void cuvCapacidadMax_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            try
            {
                if (args.IsValid != null)
                {
                    int numeroCapacidad = Convert.ToInt32(txtCapacidadMax.Text);
                    if (numeroCapacidad > 0 && numeroCapacidad <= 8)
                    {
                        args.IsValid = true;
                    }//Fin if capacidad
                }//Fin if arg
            }//Fin try
            catch (Exception ex)
            { args.IsValid = false; }//Fin catch
        }//Fin cuv Capacidad Maximia

        protected void cuvDescripcion_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            try
            {
                if (args.IsValid != null)
                {
                    int numeroCaracteres = Convert.ToInt32(txtDescripcion.Text.Length);
                    if (numeroCaracteres > 0 && numeroCaracteres <= 500)
                    {
                        args.IsValid = true;
                    }//Fin if numero
                }//Fin if arg
            }//Fin try
            catch (Exception ex)
            { args.IsValid = false; }//Fin catch
        }//Fin cuv Descripcion
    }//Fin page
}