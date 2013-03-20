using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using BusinessLayer.ServiciosGUI;
using Entities.Aplicacion;

namespace Carpooling
{
    public class Car
    {
        public string Make;
        public string Model;
        public int Year;
        public int Doors;
        public string Colour;
        public float Price;
        public int Mileage;
    }


    public partial class WebForm1 : System.Web.UI.Page
    {

        static List<Car> Cars = new List<Car>{
        new Car{Make="Audi",Model="A4",Year=1995,Doors=4,Colour="Red",Price=2995f,Mileage=122458},
        new Car{Make="Ford",Model="Focus",Year=2002,Doors=5,Colour="Black",Price=3250f,Mileage=68500},
        new Car{Make="BMW",Model="5 Series",Year=2006,Doors=4,Colour="Grey",Price=24950f,Mileage=19500},
        new Car{Make="Renault",Model="Laguna",Year=2000,Doors=5,Colour="Red",Price=3995f,Mileage=82600},
        new Car{Make="Toyota",Model="Previa",Year=1998,Doors=5,Colour="Green",Price=2695f,Mileage=72400},
        new Car{Make="Mini",Model="Cooper",Year=2005,Doors=2,Colour="Grey",Price=9850f,Mileage=19800},
        new Car{Make="Mazda",Model="MX 5",Year=2003,Doors=2,Colour="Silver",Price=6995f,Mileage=51988},
        new Car{Make="Ford",Model="Fiesta",Year=2004,Doors=3,Colour="Red",Price=3759f,Mileage=50000},
        new Car{Make="Honda",Model="Accord",Year=1997,Doors=4,Colour="Silver",Price=1995f,Mileage=99750},
        new Car{Make="Audi",Model="A6",Year=2005,Doors=5,Colour="Silver",Price=22995f,Mileage=25400},
        new Car{Make="Jaguar",Model="XJS",Year=1992,Doors=4,Colour="Green",Price=3450,Mileage=92000},
        new Car{Make="Jaguar",Model="X Type",Year=2006,Doors=4,Colour="Grey",Price=9950f,Mileage=17000},
        new Car{Make="Renault",Model="Megane",Year=2007,Doors=5,Colour="Red",Price=8995f,Mileage=8500},
        new Car{Make="Peugeot",Model="406",Year=2003,Doors=4,Colour="Grey",Price=3450f,Mileage=86000},
        new Car{Make="Mini",Model="Cooper S",Year=2008,Doors=2,Colour="Black",Price=14850f,Mileage=9500},
        new Car{Make="Mazda",Model="5",Year=2006,Doors=5,Colour="Silver",Price=6940f,Mileage=53500},
        new Car{Make="Vauxhall",Model="Vectra",Year=2007,Doors=5,Colour="White",Price=13750f,Mileage=31000},
        new Car{Make="Ford",Model="Puma",Year=1998,Doors=3,Colour="Silver",Price=2995f,Mileage=84500},
        new Car{Make="Ford",Model="Ka",Year=2004,Doors=3,Colour="Red",Price=2995f,Mileage=61000},
        new Car{Make="Ford",Model="Focus",Year=2007,Doors=5,Colour="Blue",Price=9950f,Mileage=19000},
        new Car{Make="BMW",Model="3 Series",Year=2001,Doors=4,Colour="White",Price=5950f,Mileage=98000},
        new Car{Make="Citroen",Model="C5",Year=2005,Doors=5,Colour="Silver",Price=5995f,Mileage=38400},
        new Car{Make="Toyota",Model="Corolla T3",Year=2004,Doors=5,Colour="Blue",Price=5995f,Mileage=71000},
        new Car{Make="Toyota",Model="Yaris",Year=2005,Doors=3,Colour="Grey",Price=5350f,Mileage=39000},
        new Car{Make="Porsche",Model="911",Year=2003,Doors=2,Colour="Red",Price=16995f,Mileage=88000},
        new Car{Make="Ford",Model="Fiesta",Year=2004,Doors=3,Colour="Red",Price=5759f,Mileage=49000},
        new Car{Make="Honda",Model="Accord",Year=1996,Doors=4,Colour="Black",Price=1995f,Mileage=105000},
        new Car{Make="Audi",Model="A3 Avant",Year=2005,Doors=5,Colour="Blue",Price=12995f,Mileage=22458},
        new Car{Make="Ford",Model="Mondeo",Year=2007,Doors=5,Colour="Gold",Price=12250f,Mileage=8500},
        new Car{Make="BMW",Model="1 Series",Year=2006,Doors=4,Colour="Black",Price=16950f,Mileage=19500},
        new Car{Make="Renault",Model="Clio",Year=2005,Doors=3,Colour="Red",Price=5995f,Mileage=32600},
        new Car{Make="Toyota",Model="Verso",Year=2008,Doors=5,Colour="White",Price=12995f,Mileage=5800},
        new Car{Make="Mini",Model="Cooper",Year=2003,Doors=2,Colour="Black",Price=7950f,Mileage=36800},
        new Car{Make="Mazda",Model="6",Year=2007,Doors=4,Colour="Blue",Price=16995f,Mileage=11300},
        new Car{Make="Ford",Model="Mondeo",Year=2004,Doors=5,Colour="Green",Price=8759f,Mileage=66000},
        new Car{Make="Honda",Model="Civic",Year=1997,Doors=4,Colour="Grey",Price=1995f,Mileage=99750},
        new Car{Make="Audi",Model="Q7",Year=2005,Doors=5,Colour="Black",Price=22995f,Mileage=25400},
        new Car{Make="Jaguar",Model="XK8",Year=1992,Doors=4,Colour="Blue",Price=3450,Mileage=92000},
        new Car{Make="Jaguar",Model="S Type",Year=2006,Doors=4,Colour="Red",Price=9950f,Mileage=17000},
        new Car{Make="Renault",Model="Megane",Year=2007,Doors=5,Colour="Yellow",Price=8995f,Mileage=8500},
        new Car{Make="Peugeot",Model="406",Year=2003,Doors=4,Colour="White",Price=3450f,Mileage=86000},
        new Car{Make="Mini",Model="Cooper",Year=2008,Doors=2,Colour="Red",Price=14850f,Mileage=9500},
        new Car{Make="Mazda",Model="5",Year=2006,Doors=5,Colour="White",Price=6940f,Mileage=53500},
        new Car{Make="Vauxhall",Model="Vectra",Year=2007,Doors=5,Colour="Blue",Price=13750f,Mileage=31000},
        new Car{Make="Ford",Model="Puma",Year=1998,Doors=3,Colour="Red",Price=2995f,Mileage=84500},
        new Car{Make="Ford",Model="Ka",Year=2004,Doors=3,Colour="Black",Price=2995f,Mileage=61000},
        new Car{Make="Ford",Model="Focus",Year=2007,Doors=5,Colour="Grey",Price=9950f,Mileage=19000},
        new Car{Make="BMW",Model="3 Series",Year=2001,Doors=4,Colour="Red",Price=5950f,Mileage=98000},
        new Car{Make="Citroen",Model="C5",Year=2005,Doors=5,Colour="Yellow",Price=5995f,Mileage=38400},
        new Car{Make="Toyota",Model="Corolla T3",Year=2004,Doors=5,Colour="Red",Price=5995f,Mileage=71000},
        new Car{Make="Toyota",Model="Yaris",Year=2005,Doors=3,Colour="Black",Price=5350f,Mileage=39000},
        new Car{Make="Porsche",Model="911",Year=2003,Doors=2,Colour="White",Price=16995f,Mileage=88000},
        new Car{Make="Ford",Model="Fiesta",Year=2004,Doors=3,Colour="Grey",Price=5759f,Mileage=49000},
        new Car{Make="Honda",Model="Accord",Year=1996,Doors=4,Colour="Green",Price=1995f,Mileage=105000}
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> Makes = GetCarMakes();
                ddlMake.DataSource = Makes;
                ddlMake.DataBind();
                ddlMake.Items.Insert(0, " -- Select Make -- ");
            }
        }

        [WebMethod]
        public static List<Car> GetCarsByDoors(int doors)
        {
            var query = from c in Cars
                        where c.Doors == doors
                        select c;
            return query.ToList();
        }

        [WebMethod]
        public static List<Car> GetAllCars()
        {
            return Cars;
        }

        [WebMethod]
        public static List<string> GetCarMakes()
        {
            var query = (from c in Cars
                         orderby c.Make
                         select c.Make).Distinct();
            return query.ToList();
        }

        [WebMethod]
        public static string Prueba(string make)
        {
            return make;
        }


        [WebMethod]
        public static List<string> GetCarsByModel(string make)
        {
            var query = (from c in Cars
                         where c.Make == make
                         orderby c.Model
                         select c.Model).Distinct();
            return query.ToList();
        }


        [WebMethod]
        public static List<string> GetCarsByColour(string make, string model)
        {
            var query = (from c in Cars
                         where c.Make == make && c.Model == model
                         orderby c.Colour
                         select c.Colour).Distinct();
            return query.ToList();
        }


        [WebMethod]
        public static List<Car> GetCarListByColour(string make, string model, string colour)
        {
            var query = from c in Cars
                        where (c.Make == make &&
                        c.Model == model &&
                        c.Colour == colour)
                        select c;
            return query.ToList();
        }
    }
}