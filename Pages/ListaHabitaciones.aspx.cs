using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class ListaHabitaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                try 
                {
                    if (Session["idPersona"] != null)
                    {
                        using (PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                        { 
                            var habitaciones = db.SpListarHabitaciones().ToList();
                            grdListaHabitaciones.DataSource = habitaciones;
                            grdListaHabitaciones.DataBind();

                        }
                    }//Fin If Session
                    else
                    {
                        Response.Redirect("~/Pages/Login.aspx");
                    }
                }//Fin try
                catch { }//Fin catch
            }//Fin IF
        }//Fin Page Load


        public string EvaluadorEstado(string estado)
        {
            if (estado == "I")
            { return "Inactiva"; }
            else if (estado == "A") 
             { return "Activa";}
            else { return "Estado invalido"; }
        }

    }
}