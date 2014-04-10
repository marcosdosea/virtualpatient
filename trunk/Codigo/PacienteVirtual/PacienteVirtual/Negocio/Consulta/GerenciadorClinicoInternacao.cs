using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorClinicoInternacao
    {
        private static GerenciadorClinicoInternacao gClinicoInternacao;

        private GerenciadorClinicoInternacao() { }

        public static GerenciadorClinicoInternacao GetInstance()
        {
            if (gClinicoInternacao == null)
            {
                gClinicoInternacao = new GerenciadorClinicoInternacao();
            }
            return gClinicoInternacao;
        }

        /// <summary>
        /// Insere uma Patologia Atual
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idPatologia"></param>
        public void InserirPatologiasAtuais(long idConsultaFixo, long idPatologia)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
                var repPatologia = new RepositorioGenerico<tb_patologia>(repConsultaFixo.ObterContexto());
                
                tb_consulta_fixo _tb_consulta_fixo = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == idConsultaFixo);
                tb_patologia _tb_patologia = repPatologia.ObterEntidade(p => p.IdPatologia == idPatologia);

                _tb_consulta_fixo.tb_patologia.Add(_tb_patologia);

                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaFixo", e.Message, e);
            }
        }

        /// <summary>
        /// Insere um Antecedente Patologico
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idPatologia"></param>
        public void InserirAntecedentesPatologicos(long idConsultaFixo, long idPatologia)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
                var repPatologia = new RepositorioGenerico<tb_patologia>(repConsultaFixo.ObterContexto());

                tb_consulta_fixo _tb_consulta_fixo = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == idConsultaFixo);
                tb_patologia _tb_patologia = repPatologia.ObterEntidade(p => p.IdPatologia == idPatologia);

                _tb_consulta_fixo.tb_patologia1.Add(_tb_patologia);

                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaFixo", e.Message, e);
            }
        }

        /// <summary>
        /// Insere uma Antecedente Familiar
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idPatologia"></param>
        public void InserirAntecedentesFamiliares(long idConsultaFixo, long idPatologia)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
                var repPatologia = new RepositorioGenerico<tb_patologia>(repConsultaFixo.ObterContexto());

                tb_consulta_fixo _tb_consulta_fixo = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == idConsultaFixo);
                tb_patologia _tb_patologia = repPatologia.ObterEntidade(p => p.IdPatologia == idPatologia);

                _tb_consulta_fixo.tb_patologia2.Add(_tb_patologia);

                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaFixo", e.Message, e);
            }
        }

        /// <summary>
        /// Insere alergias
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idAlergia"></param>
        public void InserirAlergias(long idConsultaFixo, int idAlergia)
        {
            try
            {
                var repClinicoInternacao = new RepositorioGenerico<tb_clinico_internacao>();
                var repAlergia = new RepositorioGenerico<tb_alergia>(repClinicoInternacao.ObterContexto());

                tb_clinico_internacao _tb_clinico_internacao = repClinicoInternacao.ObterEntidade(ci => ci.IdConsultaFixo == idConsultaFixo);
                tb_alergia _tb_alergia = repAlergia.ObterEntidade(a => a.IdAlergia == idAlergia);

                _tb_clinico_internacao.tb_alergia.Add(_tb_alergia);

                repClinicoInternacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ClinicoInternacao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove uma patologia atual
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idPatologia"></param>
        public void RemoverPatologiasAtuais(long idConsultaFixo, long idPatologia)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
                var repPatologia = new RepositorioGenerico<tb_patologia>(repConsultaFixo.ObterContexto());

                tb_consulta_fixo _tb_consulta_fixo = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == idConsultaFixo);
                tb_patologia _tb_patologia = repPatologia.ObterEntidade(p => p.IdPatologia == idPatologia);

                _tb_consulta_fixo.tb_patologia.Remove(_tb_patologia);

                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaFixo", e.Message, e);
            }
        }

        /// <summary>
        /// Remove um AntecedentePatologico
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idPatologia"></param>
        public void RemoverAntecedentesPatologicos(long idConsultaFixo, long idPatologia)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
                var repPatologia = new RepositorioGenerico<tb_patologia>(repConsultaFixo.ObterContexto());

                tb_consulta_fixo _tb_consulta_fixo = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == idConsultaFixo);
                tb_patologia _tb_patologia = repPatologia.ObterEntidade(p => p.IdPatologia == idPatologia);

                _tb_consulta_fixo.tb_patologia1.Remove(_tb_patologia);

                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaFixo", e.Message, e);
            }
        }

        /// <summary>
        /// Remove um Antecedente Familiar
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idPatologia"></param>
        public void RemoverAntecedentesFamiliares(long idConsultaFixo, long idPatologia)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
                var repPatologia = new RepositorioGenerico<tb_patologia>(repConsultaFixo.ObterContexto());

                tb_consulta_fixo _tb_consulta_fixo = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == idConsultaFixo);
                tb_patologia _tb_patologia = repPatologia.ObterEntidade(p => p.IdPatologia == idPatologia);

                _tb_consulta_fixo.tb_patologia2.Remove(_tb_patologia);

                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaFixo", e.Message, e);
            }
        }

        /// <summary>
        /// Remove uma alergia do ClinicoInternacao
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idAlergia"></param>
        public void RemoverAlergia(long idConsultaFixo, int idAlergia)
        {
            try
            {
                var repClinicoInternacao = new RepositorioGenerico<tb_clinico_internacao>();
                var repAlergia = new RepositorioGenerico<tb_alergia>(repClinicoInternacao.ObterContexto());

                tb_clinico_internacao _tb_clinico_internacao = repClinicoInternacao.ObterEntidade(ci => ci.IdConsultaFixo == idConsultaFixo);
                tb_alergia _tb_alergia = repAlergia.ObterEntidade(a => a.IdAlergia == idAlergia);

                _tb_clinico_internacao.tb_alergia.Remove(_tb_alergia);

                repClinicoInternacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ClinicoInternacao", e.Message, e);
            }
        }

        /// <summary>
        /// Obtem todas as patologias atuais de determinada consulta
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <returns></returns>
        public IEnumerable<PatologiaModel> ObterPatologiasAtuais(long idConsultaFixo)
        {
            var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
            tb_consulta_fixo _tb_consulta_fixo = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == idConsultaFixo);
            var query = from patologiasAtuais in _tb_consulta_fixo.tb_patologia
                        select new PatologiaModel
                        {
                            IdPatologia = patologiasAtuais.IdPatologia,
                            Descricao = patologiasAtuais.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtem todas os Antecedentes patologicos de determinada consulta
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <returns></returns>
        public IEnumerable<PatologiaModel> ObterAntecedentesPatologicos(long idConsultaFixo)
        {
            var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
            tb_consulta_fixo _tb_consulta_fixo = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == idConsultaFixo);
            var query = from patologiasAtuais in _tb_consulta_fixo.tb_patologia1
                        select new PatologiaModel
                        {
                            IdPatologia = patologiasAtuais.IdPatologia,
                            Descricao = patologiasAtuais.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtem todas as patologias atuais de determinada consulta
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <returns></returns>
        public IEnumerable<PatologiaModel> ObterAntecedentesFamiliares(long idConsultaFixo)
        {
            var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
            tb_consulta_fixo _tb_consulta_fixo = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == idConsultaFixo);
            var query = from patologiasAtuais in _tb_consulta_fixo.tb_patologia2
                        select new PatologiaModel
                        {
                            IdPatologia = patologiasAtuais.IdPatologia,
                            Descricao = patologiasAtuais.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtem todas as alergias de um ClinicoInternacao
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <returns></returns>
        public IEnumerable<AlergiaModel> ObterAlergias(long idConsultaFixo)
        {
            var repClinicoInternacao = new RepositorioGenerico<tb_clinico_internacao>();
            tb_clinico_internacao _tb_clinico_internacao = repClinicoInternacao.ObterEntidade(ci => ci.IdConsultaFixo == idConsultaFixo);
            var query = from Alergias in _tb_clinico_internacao.tb_alergia
                        select new AlergiaModel
                        {
                            IdAlergia = Alergias.IdAlergia,
                            Alergia = Alergias.Alergia
                        };
            return query;
        }

        /// <summary>
        /// Insere dados Clinico Internação
        /// </summary>
        /// <param name="clinicoInternacao"></param>
        /// <returns></returns>
        public long Inserir(ClinicoInternacaoModel clinicoInternacao)
        {
            var repClinicoInternacao = new RepositorioGenerico<tb_clinico_internacao>();
            tb_clinico_internacao _clinico_internacao = new tb_clinico_internacao();
            try
            {
                Atribuir(clinicoInternacao, _clinico_internacao);
                repClinicoInternacao.Inserir(_clinico_internacao);
                repClinicoInternacao.SaveChanges();

                return _clinico_internacao.IdConsultaFixo;
            }
            catch (Exception e)
            {
                throw new DadosException("ClinicoInternacao", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados clinico internação
        /// </summary>
        /// <param name="clinicoInternacao"></param>
        public void Atualizar(ClinicoInternacaoModel clinicoInternacao)
        {
            try
            {
                var repClinicoInternacao = new RepositorioGenerico<tb_clinico_internacao>();
                tb_clinico_internacao _clinico_internacao = repClinicoInternacao.ObterEntidade(da => da.IdConsultaFixo == clinicoInternacao.IdConsultaFixo);
                Atribuir(clinicoInternacao, _clinico_internacao);

                repClinicoInternacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ClinicoInternacao", e.Message, e);
            }
        }

        /// <summary>
        /// Insere ou altera dados clino internação
        /// </summary>
        /// <param name="clinicaInternacao"></param>
        /// <returns></returns>
        public long InserirAlterar(ClinicoInternacaoModel clinicoInternacao)
        {
            try
            {
                tb_clinico_internacao _clinico_internacao = new tb_clinico_internacao();
                var repClinicoInternacao = new RepositorioGenerico<tb_clinico_internacao>();

                if (clinicoInternacao.IdConsultaFixo == 0)
                {
                    Atribuir(clinicoInternacao, _clinico_internacao);
                    repClinicoInternacao.Inserir(_clinico_internacao);
                }
                else 
                {
                    _clinico_internacao = repClinicoInternacao.ObterEntidade(da => da.IdConsultaFixo == clinicoInternacao.IdConsultaFixo);
                    Atribuir(clinicoInternacao, _clinico_internacao);
                }
                    repClinicoInternacao.SaveChanges();

                return _clinico_internacao.IdConsultaFixo;
            }
            catch (Exception e)
            {
                throw new DadosException("ClinicoInternacao", e.Message, e);
            }
        }

        /// <summary>
        /// remove clinica internação
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        public void Remover(long idConsultaFixo)
        {
            try
            {
                var repClinicoInternacao = new RepositorioGenerico<tb_clinico_internacao>();
                repClinicoInternacao.Remover(da => da.IdConsultaFixo == idConsultaFixo);
                repClinicoInternacao.SaveChanges();

                              
            }
            catch (Exception e)
            {
                throw new DadosException("ClinicoInternacao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ClinicoInternacaoModel> GetQuery()
        {
            var repClinicoInternacao = new RepositorioGenerico<tb_clinico_internacao>();
            var pvEntities = (pvEntities)repClinicoInternacao.ObterContexto();
            var query = from clinicoInternacao in pvEntities.tb_clinico_internacao
                        select new ClinicoInternacaoModel
                        {
                            IdConsultaFixo = clinicoInternacao.IdConsultaFixo,
                            Clinica = clinicoInternacao.Clinica,
                            Leito = clinicoInternacao.Leito,
                            DataAdmissao = (DateTime)clinicoInternacao.DataAdmissao,
                            DiagnosticoMedico = clinicoInternacao.DiagnosticoMedico,
                            MotivoInternacao = clinicoInternacao.MotivoInternacao,
                            UsoMarcaPasso = clinicoInternacao.UsoMarcapasso,
                            UsoNaoSeAplica = clinicoInternacao.UsoNaoSeAplica,
                            UsoOutros = clinicoInternacao.UsoOutros,
                            UsoOutrosDescricao = clinicoInternacao.UsoOutrosDescricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os clinico internacões cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ClinicoInternacaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém clinico internação com o código da consulta fixa especificado
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <returns></returns>
        public ClinicoInternacaoModel Obter(long idConsultaFixo)
        {
            return GetQuery().Where(ci => ci.IdConsultaFixo == idConsultaFixo).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="clinicoInternacao"></param>
        /// <param name="_clinico_internacao"></param>
        private static void Atribuir(ClinicoInternacaoModel clinicoInternacao, tb_clinico_internacao _clinico_internacao)
        {
            _clinico_internacao.IdConsultaFixo = clinicoInternacao.IdConsultaFixo;
            _clinico_internacao.Clinica = clinicoInternacao.Clinica;
            _clinico_internacao.Leito = clinicoInternacao.Leito;
            _clinico_internacao.DataAdmissao = clinicoInternacao.DataAdmissao;
            _clinico_internacao.DiagnosticoMedico = clinicoInternacao.DiagnosticoMedico;
            _clinico_internacao.MotivoInternacao = clinicoInternacao.MotivoInternacao;
            _clinico_internacao.UsoMarcapasso = clinicoInternacao.UsoMarcaPasso;
            _clinico_internacao.UsoNaoSeAplica = clinicoInternacao.UsoNaoSeAplica;
            _clinico_internacao.UsoOutros = clinicoInternacao.UsoOutros;
            _clinico_internacao.UsoOutrosDescricao = clinicoInternacao.UsoOutrosDescricao;
        }
    }
}