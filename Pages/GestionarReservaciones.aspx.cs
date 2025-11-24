using DataModels;
using HotelReservaciones.Classes;
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
            if (Page.IsPostBack == false) 
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

                            var personas = db.SpListarPersonasActivas().ToList();

                            ddlNombres.DataSource = personas;
                            ddlNombres.DataTextField = "nombreCompleto";
                            ddlNombres.DataValueField = "idPersona";
                            ddlNombres.DataBind();
                            ddlNombres.Items.Insert(0, new ListItem("Seleccione una persona", "0"));


                        }//Fin DB

                    }//Fin IF ID != null and Empleado = true
                    else
                    {
                        Response.Redirect("~/Pages/Login.aspx");
                    }
                }
                catch (Exception ex)
                { }
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try 
            {
                int idPersona = int.Parse(ddlNombres.SelectedValue);
                DateTime fechaDesde = DateTime.Parse(txtDesde.Text);
                DateTime fechaHasta = DateTime.Parse(txtHasta.Text);

                using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                {
                    var resultado = db.SpFiltrarReservacionesEmpleado(idPersona, fechaDesde, fechaHasta).ToList();

                    grdReservaciones.DataSource = resultado;

                    grdReservaciones.DataBind();
                }
            }
            catch (Exception ex) 
            { }
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

        protected void cuvFecha_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                args.IsValid = false;
                if (args.IsValid != null)
                {
                    if (DateTime.Parse(txtDesde.Text) <= DateTime.Parse(txtHasta.Text)) 
                    { args.IsValid = true; }
                }
            }
            catch (Exception ex) 
            { args.IsValid = false; }
        }
    }
}