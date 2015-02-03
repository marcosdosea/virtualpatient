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
    /// Summary description for GerenciadorOutrasNecessidadesTest
    /// </summary>
    [TestClass]
    public class GerenciadorOutrasNecessidadesTest
    {
        [TestMethod()]
        public void PV42AtualizarOutrasNecessidadesValida()
        {
            long idConsultaVariavel = 100;
            GerenciadorOutrasNecessidades gerenciadorOutrasNecessidades = GerenciadorOutrasNecessidades.GetInstance();
            OutrasNecessidadesModel outrasNecessidades = gerenciadorOutrasNecessidades.Obter(idConsultaVariavel);
            Assert.IsNotNull(outrasNecessidades);
            outrasNecessidades.DescreverTipoTempoQtde = "Cigarro, 3anos, 2 por dia";
            outrasNecessidades.DescricaoEstilista = "";
            outrasNecessidades.DescricaoGrauDependencia = "Muito Dependente";
            outrasNecessidades.DescricaoTabagista = "Fumante ativo";
            outrasNecessidades.Estilista = false;
            outrasNecessidades.FrequenciaDrogas = "Toda semana";
            outrasNecessidades.GrauDependencia = ListaGrauDependencia.ParcialmenteDependente;
            outrasNecessidades.QuantidadeDrogas = "Pouca";
            outrasNecessidades.Tabagista = true;
            outrasNecessidades.TempoDrogas = "Dois anos";
            outrasNecessidades.TipoDrogas = "Cigarro e maconha";
            outrasNecessidades.UsoDrogasIlicitas = true;

            gerenciadorOutrasNecessidades.Atualizar(outrasNecessidades);

            OutrasNecessidadesModel outrasNecessidadesAtualizada = gerenciadorOutrasNecessidades.Obter(idConsultaVariavel);
            Assert.Equals(outrasNecessidadesAtualizada.DescreverTipoTempoQtde, "Cigarro, 3anos, 2 por dia");
            Assert.Equals(outrasNecessidadesAtualizada.DescricaoEstilista, "");
            Assert.Equals(outrasNecessidadesAtualizada.DescricaoGrauDependencia, "Muito Dependente");
            Assert.Equals(outrasNecessidadesAtualizada.DescricaoTabagista, "Fumante ativo");
            Assert.Equals(outrasNecessidadesAtualizada.Estilista, false);
            Assert.Equals(outrasNecessidadesAtualizada.FrequenciaDrogas, "Toda semana");
            Assert.Equals(outrasNecessidadesAtualizada.GrauDependencia, ListaGrauDependencia.ParcialmenteDependente);
            Assert.Equals(outrasNecessidadesAtualizada.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(outrasNecessidadesAtualizada.QuantidadeDrogas, "Pouca");
            Assert.Equals(outrasNecessidadesAtualizada.Tabagista, true);
            Assert.Equals(outrasNecessidadesAtualizada.TempoDrogas, "Dois anos");
            Assert.Equals(outrasNecessidadesAtualizada.TipoDrogas, "Cigarro e maconha");
            Assert.Equals(outrasNecessidadesAtualizada.UsoDrogasIlicitas, true);
        }

        [TestMethod()]
        public void PV43AtualizarOutrasNecessidadesInvalida()
        {
            long idConsultaVariavel = 100;
            GerenciadorOutrasNecessidades gerenciadorOutrasNecessidades = GerenciadorOutrasNecessidades.GetInstance();
            OutrasNecessidadesModel outrasNecessidades = gerenciadorOutrasNecessidades.Obter(idConsultaVariavel);
            Assert.IsNotNull(outrasNecessidades);
            outrasNecessidades.IdConsultaVariavel = -1;
            outrasNecessidades.DescreverTipoTempoQtde = "Cigarro, 3anos, 2 por dia";
            outrasNecessidades.DescricaoEstilista = "";
            outrasNecessidades.DescricaoGrauDependencia = "Muito Dependente";
            outrasNecessidades.DescricaoTabagista = "Fumante ativo";
            outrasNecessidades.Estilista = false;
            outrasNecessidades.FrequenciaDrogas = "Toda semana";
            outrasNecessidades.GrauDependencia = ListaGrauDependencia.ParcialmenteDependente;
            outrasNecessidades.QuantidadeDrogas = "Pouca";
            outrasNecessidades.Tabagista = true;
            outrasNecessidades.TempoDrogas = "Dois anos";
            outrasNecessidades.TipoDrogas = "Cigarro e maconha";
            outrasNecessidades.UsoDrogasIlicitas = true;

            try
            {
                gerenciadorOutrasNecessidades.Atualizar(outrasNecessidades);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(NegocioException));
            }

            OutrasNecessidadesModel outrasNecessidadesAtualizada = gerenciadorOutrasNecessidades.Obter(idConsultaVariavel);
            Assert.Equals(outrasNecessidadesAtualizada.DescreverTipoTempoQtde, "");
            Assert.Equals(outrasNecessidadesAtualizada.DescricaoEstilista, "");
            Assert.Equals(outrasNecessidadesAtualizada.DescricaoGrauDependencia, "");
            Assert.Equals(outrasNecessidadesAtualizada.DescricaoTabagista, "");
            Assert.Equals(outrasNecessidadesAtualizada.Estilista, false);
            Assert.Equals(outrasNecessidadesAtualizada.FrequenciaDrogas, "");
            Assert.Equals(outrasNecessidadesAtualizada.GrauDependencia, ListaGrauDependencia.Independente);
            Assert.Equals(outrasNecessidadesAtualizada.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(outrasNecessidadesAtualizada.QuantidadeDrogas, "");
            Assert.Equals(outrasNecessidadesAtualizada.Tabagista, false);
            Assert.Equals(outrasNecessidadesAtualizada.TempoDrogas, "");
            Assert.Equals(outrasNecessidadesAtualizada.TipoDrogas, "");
            Assert.Equals(outrasNecessidadesAtualizada.UsoDrogasIlicitas, false);
        }
    }
}
