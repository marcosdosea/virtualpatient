using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    /// <summary>
    /// Summary description for GerenciadorSensorialTest
    /// </summary>
    [TestClass]
    public class GerenciadorSensorialTest
    {
        [TestMethod()]
        public void PV34AtualizarNecessidadesPsicobiologicasSensorialValida()
        {
            long idConsultaVariavel = 100;
            GerenciadorSensorial gerenciadorSensorial = GerenciadorSensorial.GetInstance();
            SensorialModel sensorial = gerenciadorSensorial.Obter(idConsultaVariavel);
            Assert.IsNotNull(sensorial);
            sensorial.Auditiva = true;
            sensorial.Defensividade = true;
            sensorial.DescricaoDor = "Dor forte";
            sensorial.DescricaoTipoDistorcao = "";
            sensorial.Dor = "Forte";
            sensorial.DorIntensidadeValor = 5;
            sensorial.DuracaoDor = "1 hora";
            sensorial.EstadoMental = ListaEstadoMental.Agitado;
            sensorial.ExpressaoFacial = false;
            sensorial.FatoresAgravantesDor = "Mexer a perna";
            sensorial.FatoresAliviantesDor = "Perna parada";
            sensorial.Gustativa = false;
            sensorial.Inquietacao = false;
            sensorial.LocalizacaoDor = "Dor muito forte na perna";
            sensorial.Olfativa = false;
            sensorial.PA = false;
            sensorial.Palpebral = false;
            sensorial.Plantar = false;
            sensorial.Pulso = true;
            sensorial.Pupilar = false;
            sensorial.Respiracao = true;
            sensorial.SinalBabinski = false;
            sensorial.Tatil = false;
            sensorial.Visual = true;

            gerenciadorSensorial.Atualizar(sensorial);

            SensorialModel sensorialAtualizada = gerenciadorSensorial.Obter(idConsultaVariavel);
            Assert.Equals(sensorialAtualizada.Auditiva, true);
            Assert.Equals(sensorialAtualizada.Defensividade, true);
            Assert.Equals(sensorialAtualizada.DescricaoDor, "Dor forte");
            Assert.Equals(sensorialAtualizada.DescricaoTipoDistorcao, "");
            Assert.Equals(sensorialAtualizada.Dor, "Forte");
            Assert.Equals(sensorialAtualizada.DorIntensidadeValor, 5);
            Assert.Equals(sensorialAtualizada.DuracaoDor, "1 hora");
            Assert.Equals(sensorialAtualizada.EstadoMental, ListaEstadoMental.Agitado);
            Assert.Equals(sensorialAtualizada.ExpressaoFacial, false);
            Assert.Equals(sensorialAtualizada.FatoresAgravantesDor, "Mexer a perna");
            Assert.Equals(sensorialAtualizada.FatoresAliviantesDor, "Perna parada");
            Assert.Equals(sensorialAtualizada.Gustativa, false);
            Assert.Equals(sensorialAtualizada.Inquietacao, false);
            Assert.Equals(sensorialAtualizada.LocalizacaoDor, "Dor muito forte na perna");
            Assert.Equals(sensorialAtualizada.Olfativa, false);
            Assert.Equals(sensorialAtualizada.PA, false);
            Assert.Equals(sensorialAtualizada.Palpebral, false);
            Assert.Equals(sensorialAtualizada.Plantar, false);
            Assert.Equals(sensorialAtualizada.Pulso, true);
            Assert.Equals(sensorialAtualizada.Pupilar, false);
            Assert.Equals(sensorialAtualizada.Respiracao, true);
            Assert.Equals(sensorialAtualizada.SinalBabinski, false);
            Assert.Equals(sensorialAtualizada.Tatil, false);
            Assert.Equals(sensorialAtualizada.Visual, true);
        }
    }
}
