using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelReservaciones.Classes
{
    public class Persona
    {
        public int idPersona { get; set; }
        public string nombreCompleto { get; set; }
        public string email {  get; set; }
        public string clave { get; set; }
        public Boolean esEmpleado { get; set; }
        public char estado { get; set; }

    }
}