using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual
{
    public class GerenciadorSeguranca
    {
        private static GerenciadorSeguranca gSeguranca;

        private GerenciadorSeguranca()
        {
        }

        public static GerenciadorSeguranca GetInstance()
        {
            if (gSeguranca == null)
            {
                gSeguranca = new GerenciadorSeguranca();
            }
            return gSeguranca;
        }

        /// <summary>
        /// Transforma &lt; em < e &gt; em >
        /// </summary>
        /// <param name="mensagem"></param>
        /// <returns></returns>
        public string ReplaceCaracteresMaiorMenor(string mensagem)
        {
            mensagem = mensagem.Replace("&lt;", "<");
            mensagem = mensagem.Replace("&gt;", ">");
            return mensagem;
        }
    }
}