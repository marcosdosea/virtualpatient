﻿using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorCarta
    {
        private static GerenciadorCarta gCarta;
        private GerenciadorCarta() { }

        public static GerenciadorCarta GetInstance()
        {
            if (gCarta == null)
            {
                gCarta = new GerenciadorCarta();
            }
            return gCarta;
        }

        /// <summary>
        /// Insere dados do Carta
        /// </summary>
        /// <param name="Carta"></param>
        /// <returns></returns>
        public long Inserir(CartaModel cartaModel)
        {
            var repCarta = new RepositorioGenerico<tb_carta>();
            tb_carta _tb_carta = new tb_carta();
            try
            {
                Atribuir(cartaModel, _tb_carta);

                repCarta.Inserir(_tb_carta);
                repCarta.SaveChanges();

                return _tb_carta.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Carta", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do Carta
        /// </summary>
        /// <param name="Carta"></param>
        public void Atualizar(CartaModel CartaModel)
        {
            try
            {
                var repCarta = new RepositorioGenerico<tb_carta>();
                tb_carta _tb_carta = repCarta.ObterEntidade(c => c.IdConsultaVariavel == CartaModel.IdConsultaVariavel);
                Atribuir(CartaModel, _tb_carta);

                repCarta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Carta", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do Carta
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, long idCarta)
        {
            try
            {

                var repCarta = new RepositorioGenerico<tb_carta>();
                repCarta.Remover(c => c.IdConsultaVariavel == idConsultaVariavel && c.IdCarta == idCarta);
                repCarta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Carta", e.Message, e);
            }
        }


        /// <summary>
        /// Remove dados do Carta
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, int idCarta)
        {
            try
            {
                var repCarta = new RepositorioGenerico<tb_carta>();
                repCarta.Remover(c => c.IdConsultaVariavel == idConsultaVariavel && c.IdCarta == idCarta);
                repCarta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Carta", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<CartaModel> GetQuery()
        {
            var repCarta = new RepositorioGenerico<tb_carta>();
            var pvEntities = (pvEntities)repCarta.ObterContexto();
            var query = from tb_carta in pvEntities.tb_carta
                        join tb_curso in pvEntities.tb_curso
                        on tb_carta.IdCursoProfissionalEncaminhado equals tb_curso.IdCurso
                        select new CartaModel
                        {
                            IdConsultaVariavel = tb_carta.IdConsultaVariavel,
                            IdCarta = tb_carta.IdCarta,
                            NomeProfissional = tb_carta.NomeProfissional,
                            NomePaciente = tb_carta.NomePaciente,
                            DataNascimento = (DateTime)tb_carta.DataNascimento,
                            TelefonePaciente = tb_carta.TelefonePaciente,
                            MotivoReferenciaConsulta = tb_carta.MotivoReferenciaConsulta,
                            Alternativas = tb_carta.Alternativas,
                            Farmaceutico = tb_carta.Farmaceutico,
                            CRFUF = tb_carta.CRFUF,
                            TelefoneFarmaceutico = tb_carta.TelefoneFarmaceutico,
                            Referências = tb_carta.Referencias,

                            IdCurso = tb_carta.IdCursoProfissionalEncaminhado,
                            NomeCurso = tb_curso.NomeCurso
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os CartaModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<CartaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém CartaModel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<CartaModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(CartaModel => CartaModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtém Carta que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<CartaModel> ObterPorIdHistorico(long idConsultaVariavel)
        {
            return GetQuery().Where(CartaModel => CartaModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="CartaModel"></param>
        /// <param name="_tb_carta"></param>
        private static void Atribuir(CartaModel CartaModel, tb_carta _tb_carta)
        {
            _tb_carta.IdConsultaVariavel = CartaModel.IdConsultaVariavel;
            _tb_carta.IdCarta = CartaModel.IdCarta;
            _tb_carta.NomePaciente = CartaModel.NomePaciente;
            _tb_carta.NomeProfissional = CartaModel.NomeProfissional;
            _tb_carta.DataNascimento = CartaModel.DataNascimento;
            _tb_carta.TelefonePaciente = CartaModel.TelefonePaciente;
            _tb_carta.MotivoReferenciaConsulta = CartaModel.MotivoReferenciaConsulta;
            _tb_carta.Alternativas = CartaModel.Alternativas;
            _tb_carta.Farmaceutico = CartaModel.Farmaceutico;
            _tb_carta.CRFUF = CartaModel.CRFUF;
            _tb_carta.TelefoneFarmaceutico = CartaModel.TelefoneFarmaceutico;
            _tb_carta.Referencias = CartaModel.Referências;
            _tb_carta.IdCursoProfissionalEncaminhado = CartaModel.IdCurso;

        }
    }
}