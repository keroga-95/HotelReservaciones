using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class crearReservacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                if (Session["idPersona"] != null)
                {
                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                    {
                        var hoteles = db.SpListaHoteles().ToList();
                        ddlHotel.DataSource = hoteles;
                        ddlHotel.DataTextField = "nombre";
                        ddlHotel.DataValueField = "idHotel";
                        ddlHotel.DataBind();
                        ddlHotel.Items.Insert(0, new ListItem("Seleccione un hotel", "0"));

                        var clientes = db.SpListarPersonasActivas().ToList();
                        ddlCliente.DataSource = clientes;
                        ddlCliente.DataTextField = "nombreCompleto";
                        ddlCliente.DataValueField = "idPersona";
                        ddlCliente.DataBind();
                        ddlCliente.Items.Insert(0, new ListItem("Seleccione un cliente", "0"));

                        Boolean empleado = Convert.ToBoolean(Session["esEmpleado"]);
                        if (empleado == false)
                        {
                            int clienteId = Convert.ToInt32(Session["idPersona"]);
                            ddlCliente.SelectedValue = clienteId.ToString();
                            ddlCliente.Enabled = false;
                        }

                    }//Fin db, carga los detalles al ddlhotel y ddl cliente desde la bd.
                }//Fin if session
                else
                {
                    Response.Redirect("~/Pages/Login.aspx");
                }//fin else session
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

            if (ddlHotel.SelectedValue == "0")
                errores.Add("Debe seleccionar un hotel.");

            if (ddlCliente.SelectedValue == "0")
                errores.Add("Debe seleccionar un cliente.");

            if (string.IsNullOrWhiteSpace(txtFechaEntrada.Text))
                errores.Add("Debe digitar la fecha de entrada.");

            if (string.IsNullOrWhiteSpace(txtFechaSalida.Text))
                errores.Add("Debe digitar la fecha de salida.");

            if (errores.Count > 0)
            {
                lblError.Visible = true;
                lblError.Text = string.Join("<br/>", errores);
                return;
            }//Fin errors counts, si 1 o mas espacios estan en blanco los muestra en un label.

            int newIdReservacion = 0;
            try 
            {
                int idPersona = Convert.ToInt32(ddlCliente.SelectedValue);
                int idHotel = Convert.ToInt32(ddlHotel.SelectedValue);

                DateTime fechaEntrada = Convert.ToDateTime(txtFechaEntrada.Text);
                DateTime fechaSalida = Convert.ToDateTime(txtFechaSalida.Text);

                int numeroAdultos = Convert.ToInt32(txtNumAdultos.Text);
                int numeroNinhos = Convert.ToInt32(txtNumNinhos.Text);
                int capacidadRequerida = numeroAdultos + numeroNinhos;

                int idHabitacion = 0;
                decimal costoAdulto= 0;
                decimal costoNinho= 0;

                using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase")) 
                {
                    var costos = db.SpObtenerCostosHotel(idHotel).FirstOrDefault();

                    if (costos == null)
                    {
                        throw new Exception("No se pudieron obtener los costos del hotel.");
                    }

                    costoAdulto = Convert.ToDecimal(costos.CostoPorCadaAdulto);
                    costoNinho = Convert.ToDecimal(costos.CostoPorCadaNinho);
                    //Asignar costos segun hotel.

                    var habitacionAsignada = db.SpAsignarHabitacion(idHotel, capacidadRequerida).FirstOrDefault();
                    if (habitacionAsignada != null) 
                    { 
                        idHabitacion = habitacionAsignada.IdHabitacionAsignada; 
                    }//Fin if asignar habitacion. Utiliza el SP para asignar una de las habitaciones disponibles a la reservacion

                    if (idHabitacion == 0)
                    {
                        lblError.Visible = true;
                        lblError.Text = "No existen habitaciones activas en el hotel con capacidad para " + capacidadRequerida + " personas.";
                        return;
                    }//Fin if. Si no existe una habitacion, sea por espacio o cupo, devuelve el mensaje anterior

                    var reservacionCreada = db.SpCrearReservacion(idPersona, idHabitacion, fechaEntrada, fechaSalida,
                        numeroAdultos, numeroNinhos, costoAdulto, costoNinho).FirstOrDefault();//Se envia los detalles para crear la reservacion

                    if (reservacionCreada != null && reservacionCreada.IdReservacion != null) 
                    {
                        newIdReservacion = Convert.ToInt32(reservacionCreada.IdReservacion);
                    }//Fin IF, se verifica si la reservacion creada es null

                    if (newIdReservacion > 0)
                    {
                        int clienteId = Convert.ToInt32(Session["idPersona"]);
                        db.SpInsertarBitacora(newIdReservacion, clienteId, "CREADA");

                        Response.Redirect("~/Pages/ExitoReservacion.aspx?id=" + newIdReservacion, false);
                        Context.ApplicationInstance.CompleteRequest();
                        return;
                    }//Fin if, si se obtiene un # de reserva mayor a 0 se guarda en bitacora y se envia el numero de reserva nuevo al pagina de confirmacion
                    else
                    {
                        lblError.Visible = true;
                        lblError.Text = "No se pudo generar el número de reservación.";
                    }

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
            if (empleado == true)
            {
                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
            }
            else
            {
                Response.Redirect("~/Pages/MisReservaciones.aspx");
            }//Fin If
        }//Fin btnRegresar

        protected void cuvHotel_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid= false;
            try
            {
                int hotelSeleccionado = Convert.ToInt32(ddlHotel.SelectedValue);
                if (hotelSeleccionado != 0)
                {
                    args.IsValid = true;
                }//Fin IF hotel ddl
            } //Fin try
            catch { args.IsValid = false; } //Fin try
        }//Fin cuvHotel, conmfirma que ddl sea seleccionado

        protected void cuvCliente_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            try
            {
                int clienteSeleccionado = Convert.ToInt32(ddlCliente.SelectedValue);
                if (clienteSeleccionado != 0)
                {
                    args.IsValid = true;
                }//Fin IF cliente ddl
            } //Fin try
            catch { args.IsValid = false; } //Fin try
        }//Fin cuvCliente, confirma que ddlcliente sea seleccionado

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
        }//Fin cuvFechaEntrada, confirma que fecha de entrada es mayor al dia de hoy.

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
        }//Fin cuvFechaSalida, confirma que fecha de salida sea mayor (despues), que la fecha de entrada

    }//fin class crear
}//Fin page