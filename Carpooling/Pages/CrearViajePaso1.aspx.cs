﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Carpooling
{
    public partial class CrearViajePaso1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSiguientePasoClick(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 1;
        }

        protected void BtnPublicarClick(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 2;
        }
    }
}