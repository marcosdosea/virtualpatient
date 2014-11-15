using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
using System.Data;

namespace PacienteVirtual
{
    public class CustomHandleErrorAttribute : HandleErrorAttribute
    {
        
        public override void OnException(ExceptionContext filterContext)
        {
            if (filterContext.ExceptionHandled || !filterContext.HttpContext.IsCustomErrorEnabled)
            {
                return;
            }

            if (new HttpException(null, filterContext.Exception).GetHttpCode() != 500)
            {
                return;
            }

            if (!ExceptionType.IsInstanceOfType(filterContext.Exception))
            {
                return;
            }

            // if the request is AJAX return JSON else view.
            if (filterContext.HttpContext.Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                filterContext.Result = new JsonResult
                {
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet,
                    Data = new
                    {
                        error = true,
                        message = filterContext.Exception.Message
                    }
                };
            }
            else
            {
                Exception exceptionRecebida = filterContext.Exception;
                Exception exceptionEnviar = exceptionRecebida;
                
                if (exceptionRecebida.InnerException != null &&  exceptionRecebida.InnerException is UpdateException)
                {
                    exceptionEnviar = exceptionRecebida.InnerException;
                    if ((exceptionEnviar.InnerException != null) && (exceptionEnviar.InnerException is MySqlException)) {
                        var exceptionMysql = (MySqlException) exceptionEnviar.InnerException;
                        if (exceptionMysql.Number == 1062) {
                            exceptionEnviar = new Exception("Esse registro já foi inserido na base de dados.", exceptionEnviar);
                        } else if (exceptionMysql.Number == 1451) {
                            exceptionEnviar = new Exception("Essa registro não pode ser excluído da base de dados por estar associado a outro registro. ", exceptionEnviar);
                        } else {
                            exceptionEnviar = new Exception(" Não foi possível atualizar a base de dados. Favor contactar o administrador e informar ocorrência do Erro número = " + exceptionMysql.Number +  ".");
                        }
                    }
                }


                var controllerName = (string)filterContext.RouteData.Values["controller"];
                var actionName = (string)filterContext.RouteData.Values["action"];
                var model = new HandleErrorInfo(exceptionEnviar, controllerName, actionName);

                filterContext.Result = new ViewResult
                {
                    ViewName = View,
                    MasterName = Master,
                    ViewData = new ViewDataDictionary<HandleErrorInfo>(model),
                    TempData = filterContext.Controller.TempData
                };
            }

            // log the error using log4net.
            //_logger.Error(filterContext.Exception.Message, filterContext.Exception);

            filterContext.ExceptionHandled = true;
            filterContext.HttpContext.Response.Clear();
            filterContext.HttpContext.Response.StatusCode = 500;

            filterContext.HttpContext.Response.TrySkipIisCustomErrors = true;
        }
    }
}