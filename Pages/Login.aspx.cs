using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservaciones.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {

            try {
                string correo = txtEmail.Text.Trim();
                string clave = txtContrasenia.Text.Trim();
                using(PvProyectoFinalDB db = new PvProyectoFinalDB("MyDatabase"))
                {
                    var usuario = db.SpLogin(correo, clave).FirstOrDefault();
                    if (usuario != null) 
                    {
                        Session["objPersona"] = usuario;
                        Session["idPersona"] = usuario.IdPersona;
                        Session["nombreCompleto"] = usuario.NombreCompleto;
                        Session["esEmpleado"] = usuario.EsEmpleado;

                        if (usuario.EsEmpleado)
                            Response.Redirect("~/Pages/GestionarReservaciones.aspx");
                        else
                            Response.Redirect("~/Pages/MisReservaciones.aspx");

                    }
                    else 
                    {
                    }
                }

            }
            catch 
            { 
            }

        }
    }
}