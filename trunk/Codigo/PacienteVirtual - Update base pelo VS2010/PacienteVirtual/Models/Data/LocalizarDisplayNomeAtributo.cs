﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Reflection;

namespace PacienteVirtual.Models.Data
{
    public class LocalizarDisplayNomeAtributo : DisplayNameAttribute
    {
        private PropertyInfo _nameProperty;
        private Type _resourceType;

        public LocalizarDisplayNomeAtributo(string displayNameKey)

            : base(displayNameKey)
        { }

        public Type NameResourceType
        {
            get
            {
               return _resourceType;
            }
            set
            {
                _resourceType = value;
                //initialize nameProperty when type property is provided by setter
                _nameProperty = _resourceType.GetProperty(base.DisplayName,
     BindingFlags.Static | BindingFlags.Public);
            }
        }

        public override string DisplayName
        {
            get
            {
                //check if nameProperty is null and return original display name value
                if (_nameProperty == null)
                {
                    return base.DisplayName;
                }
                return (string)_nameProperty.GetValue(_nameProperty.DeclaringType, null);
            }
        }
    }
}