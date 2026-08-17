using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["objPersona"] != null)
            {
                try
                {
                    lblNombreUsuario.Text = "Bienvenido " + Session["nombreCompleto"].ToString();
                    lblNombreUsuario.Visible = true;

                    Boolean Empleado = Convert.ToBoolean(Session["esEmpleado"]);
                    if (Empleado == true) 
                    { lblbtGestionarRes.Visible = true;
                        lblbtMisReservaciones.Visible = true;
                        lblbtGestionarHab.Visible = true;
                        lblbtCerrar.Visible = true;
                    }//Fin if empleado
                    else 
                    { lblbtMisReservaciones.Visible = true;
                        lblbtCerrar.Visible = true;
                    }//Fin else empleado
                }//Fin try
                catch (Exception ex) { }
            }//Fin if Session
        }

        protected void lblbtCerrar_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            FormsAuthentication.SignOut();
            Response.Redirect("~/Pages/Login.aspx");
        }
    }
}