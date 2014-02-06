using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Globalization;
using System.Threading;
using PacienteVirtual.Models;

namespace PacienteVirtual
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            //ModelBinders.Binders.Add(typeof(float), new FloatModelBinder());
            //ModelBinders.Binders.Add(typeof(float?), new FloatModelBinder());
            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }

        void Session_Start(object sender, EventArgs e)
        {
            Session.Timeout = 20;
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            //It's important to check whether session object is ready
            if (HttpContext.Current.Session != null)
            {
                CultureInfo ci = (CultureInfo)this.Session["Culture"];

                //Checking first if there is no value in session 

                //and set default language 
                //this can happen for first user's request

                if (ci == null)
                {
                    //Sets default culture to english invariant

                    string langName = "pt-BR";

                    //Try to get values from Accept lang HTTP header

                    if (HttpContext.Current.Request.UserLanguages != null &&  HttpContext.Current.Request.UserLanguages.Length != 0)
                    {
                        //Gets accepted list 
                        langName = HttpContext.Current.Request.UserLanguages[0].Substring(0, 2);

                    }

                    ci = new CultureInfo(langName);

                    this.Session["Culture"] = ci;

                }
                

                if (ci.Name.Equals("pt"))
                {
                    ci = new CultureInfo("pt-BR");
                }
                
                //Deixar o ponto como separador padrão de decimais independente da lingua
                ci.NumberFormat.NumberDecimalSeparator = ".";
                ci.NumberFormat.NumberGroupSeparator = ",";
                
                Thread.CurrentThread.CurrentUICulture = ci;
                Thread.CurrentThread.CurrentCulture = ci; 
            }
        }
    }
}