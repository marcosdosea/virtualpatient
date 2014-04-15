using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Reflection;

namespace PacienteVirtual.Helpers
{
    public static class EnumToSelectList
    {
        public static SelectList ToSelectListHelper<TEnum, TResource>(this HtmlHelper htmlHelper, Enum selectedValue)
        {
            Type resourceType = typeof(TResource);
            var values = from TEnum e in Enum.GetValues(typeof(TEnum))
                         select new
                         {
                             ID = e,
                             Name = resourceType.GetProperty(e.ToString(), BindingFlags.Public | BindingFlags.Static)
                                 .GetGetMethod().Invoke(null, null)
                         };

            return new SelectList(values, "Id", "Name", selectedValue);
        }
    }
}