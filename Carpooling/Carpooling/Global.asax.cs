using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Threading;
using BusinessLayer;
using Entities.Aplicacion;

namespace Carpooling
{
    public class Global : System.Web.HttpApplication
    {
        public ErrorAplicacion ErrorExcepcion
        {
            get 
            {
                return new ErrorAplicacion { TituloError = Session["TitutloError"].ToString(), DetalleError = Session["DetalleError"].ToString() };
            }
            set
            {
                Session["TitutloError"] = value.TituloError;
                Session["DetalleError"] = value.DetalleError;
            }
        }

        public BackgroundWorker worker;


        void Application_Start(object sender, EventArgs e)
        {
            worker = new BackgroundWorker();
            worker.DoWork += new DoWorkEventHandler(AdministradorViajes.MonitorViajesVigentes);
            worker.WorkerReportsProgress = false;
            worker.WorkerSupportsCancellation = true;
            worker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(AdministradorViajes.MonitorViajesVigentesCompleto);
            worker.RunWorkerAsync();
        }


        void Application_End(object sender, EventArgs e)
        {
            if (worker != null)
                worker.CancelAsync();
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
