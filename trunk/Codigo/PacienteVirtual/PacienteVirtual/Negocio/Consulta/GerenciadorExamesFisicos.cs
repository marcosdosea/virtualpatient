using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorExamesFisicos
    {
        private static GerenciadorExamesFisicos gExamesFisicos;
        private GerenciadorExamesFisicos() { }

        public static GerenciadorExamesFisicos GetInstance()
        {
            if (gExamesFisicos == null)
            {
                gExamesFisicos = new GerenciadorExamesFisicos();
            }
            return gExamesFisicos;
        }

        /// <summary>
        /// Insere dados do ExamesFisicos
        /// </summary>
        /// <param name="ExamesFisicos"></param>
        /// <returns></returns>
        public long Inserir(ExamesFisicosModel examesFisicosModel)
        {
            var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
            tb_exames_fisicos _tb_exames_fisicos = new tb_exames_fisicos();
            try
            {
                Atribuir(examesFisicosModel, _tb_exames_fisicos);

                repExamesFisicos.Inserir(_tb_exames_fisicos);
                repExamesFisicos.SaveChanges();

                return _tb_exames_fisicos.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do ExamesFisicos
        /// </summary>
        /// <param name="ExamesFisicos"></param>
        public void Atualizar(ExamesFisicosModel examesFisicosModel)
        {
            try
            {
                var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
                tb_exames_fisicos _tb_exames_fisicos = repExamesFisicos.ObterEntidade(dP => dP.IdConsultaVariavel == examesFisicosModel.IdConsultaVariavel);
                Atribuir(examesFisicosModel, _tb_exames_fisicos);

                repExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do ExamesFisicos
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
                repExamesFisicos.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
                repExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Insere uma alergia em um exame físico
        /// </summary>
        /// <param name="examesFisicosModel"></param>
        /// <param name="alergiaModel"></param>
        public void InserirAlergia(ExamesFisicosModel examesFisicosModel, int idAlergia)
        {
            try
            {
                var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
                var repAlergia = new RepositorioGenerico<tb_alergia>(repExamesFisicos.ObterContexto());
                
                tb_exames_fisicos _tb_exames_fisicos = repExamesFisicos.ObterEntidade(dP => dP.IdConsultaVariavel == examesFisicosModel.IdConsultaVariavel);
                tb_alergia _tb_alergia = repAlergia.ObterEntidade(al => al.IdAlergia == idAlergia);

                _tb_exames_fisicos.tb_alergia.Add(_tb_alergia);

                repExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Insere uma alergia em um exame físico
        /// </summary>
        /// <param name="examesFisicosModel"></param>
        /// <param name="alergiaModel"></param>
        public void RemoverAlergia(ExamesFisicosModel examesFisicosModel, int idAlergia)
        {
            try
            {
                var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
                var repAlergia = new RepositorioGenerico<tb_alergia>(repExamesFisicos.ObterContexto());

                tb_exames_fisicos _tb_exames_fisicos = repExamesFisicos.ObterEntidade(dP => dP.IdConsultaVariavel == examesFisicosModel.IdConsultaVariavel);
                tb_alergia _tb_alergia = repAlergia.ObterEntidade(al => al.IdAlergia == idAlergia);

                _tb_exames_fisicos.tb_alergia.Remove(_tb_alergia);

                repExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Obtém todas as alergias relacionadas a consulta
        /// </summary>
        /// <param name="examesFisicosModel"></param>
        /// <param name="alergiaModel"></param>
        public IEnumerable<AlergiaModel> ObterAlergias(long idConsultaVariavel)
        {
            var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
            tb_exames_fisicos _tb_exames_fisicos = repExamesFisicos.ObterEntidade(ef => ef.IdConsultaVariavel == idConsultaVariavel);
            var query = from alergias in _tb_exames_fisicos.tb_alergia
                        select new AlergiaModel
                        {
                            IdAlergia = alergias.IdAlergia,
                            Alergia = alergias.Alergia
                        };
            return query;
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ExamesFisicosModel> GetQuery()
        {
            var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
            var pvEntities = (pvEntities)repExamesFisicos.ObterContexto();
            var query = from tb_exames_fisicos in pvEntities.tb_exames_fisicos
                        select new ExamesFisicosModel
                        {
                            IdConsultaVariavel = tb_exames_fisicos.IdConsultaVariavel,
                            Peso = (float)tb_exames_fisicos.Peso,
                            Altura = (float)tb_exames_fisicos.Altura,
                            PressaoDiastolica = (float)tb_exames_fisicos.PressaoDiastolica,
                            PressaoSistolica = (float)tb_exames_fisicos.PressaoSistolica,
                            Glicemia = (float)tb_exames_fisicos.Glicemia
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os ExamesFisicosModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ExamesFisicosModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém ExamesFisicosModel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public ExamesFisicosModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(ExamesFisicosModel => ExamesFisicosModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="examesFisicosModel"></param>
        /// <param name="_tb_exames_fisicos"></param>
        private static void Atribuir(ExamesFisicosModel examesFisicosModel, tb_exames_fisicos _tb_exames_fisicos)
        {
            _tb_exames_fisicos.IdConsultaVariavel = examesFisicosModel.IdConsultaVariavel;
            _tb_exames_fisicos.Peso = examesFisicosModel.Peso;
            _tb_exames_fisicos.Altura = examesFisicosModel.Altura;
            _tb_exames_fisicos.PressaoDiastolica = examesFisicosModel.PressaoDiastolica;
            _tb_exames_fisicos.PressaoSistolica = examesFisicosModel.PressaoSistolica;
            _tb_exames_fisicos.Glicemia = examesFisicosModel.Glicemia;
        }
    }
}