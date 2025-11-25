using DataModels;
using HotelReservaciones.Classes;
using Microsoft.Ajax.Utilities;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class CrearHabitacion : System.Web.UI.Page
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

                        ddlHoteles.DataSource = hoteles;
                        ddlHoteles.DataTextField = "nombre";
                        ddlHoteles.DataValueField = "idHotel";
                        ddlHoteles.DataBind();
                        ddlHoteles.Items.Insert(0, new ListItem("Seleccione un hotel", "0"));
                    }
                }//Fin if session
                else
                {
                    Response.Redirect("~/Pages/Login.aspx");
                }//fin else session
            }
        }

        protected void cuvCapacidadMax_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            try 
            {
                if (args.IsValid != null)
                {
                    int numeroCapacidad = Convert.ToInt32(txtCapacidadMax.Text);
                    if (numeroCapacidad > 0 && numeroCapacidad <= 8 )
                    {
                        args.IsValid = true;
                    }//Fin if capacidad
                }//Fin if arg
            }//Fin try
            catch (Exception ex)
            { args.IsValid = false; }//Fin catch
        }//Fin cuvCapacidad

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            if (!Page.IsValid) 
            {
                lblError.Visible = true;
                lblError.Text = "Hay errores en la información. Revise los campos marcados.";
                return;
            }

            List<string> errores = new List<string>();

            if (ddlHoteles.SelectedValue == "0")
                errores.Add("Debe seleccionar un hotel.");

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
                return; // NO continuar, NO guardar, NO redirigir
            }

            try 
            {
                int idHotel = Convert.ToInt32(ddlHoteles.SelectedValue);
                string numeroHabitacion = txtNumeroHab.Text.ToUpper().Trim();
                int capacidadMax = Convert.ToInt32(txtCapacidadMax.Text);
                string descripcion = txtDescripcion.Text;

                using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase")) 
                {
                    db.SpCrearHabitacion(idHotel,numeroHabitacion,capacidadMax,descripcion);
                }//Fin db

                Response.Redirect("~/Pages/ExitoHabitacion.aspx");

            }//Fin try
            catch { } //Fin catch
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ListaHabitaciones.aspx");
        }

        protected void cuvNumeroHab_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;

            try
            {
                int idHotel = Convert.ToInt32(ddlHoteles.SelectedValue);
                string numeroHab = txtNumeroHab.Text.ToUpper().Trim();

                // Validar ddl and txtNumeroHab
                if (idHotel == 0 || numeroHab == "")
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
                    var resultado = db.SpVerificarNumeroHabitacion(idHotel, numeroHab).FirstOrDefault();
                    if (resultado.Existe == 0)
                    { args.IsValid = true; } //Fin if
                    else
                    { args.IsValid = false; } //fin else
                }//Fin DB
            }//Fin try
            catch
            {
                args.IsValid = false;
            }//Fin catch
        }//fin cuvNumeroHab

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
        }//Fin cuvDescripcion
    }
}