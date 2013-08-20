using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Negocio
{
    public class NegocioException : SystemException
    {
        private string p;
        private string p_2;
        private Exception e;

        public NegocioException()
            : base("Erro no negócio da aplicação.")
        {

        }

        public NegocioException(String mensagem)
            : base(mensagem)
        {

        }

        public NegocioException(string p, string p_2, Exception e)
        {
            // TODO: Complete member initialization
            this.p = p;
            this.p_2 = p_2;
            this.e = e;
        }
    }
}
