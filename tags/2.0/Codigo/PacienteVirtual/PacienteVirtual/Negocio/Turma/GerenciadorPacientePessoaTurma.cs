
namespace PacienteVirtual.Negocio
{
    public class GerenciadorPacientePessoaTurma
    {
        private static GerenciadorPacientePessoaTurma gPacPessTurma;

        private GerenciadorPacientePessoaTurma() { }

        public static GerenciadorPacientePessoaTurma GetInstance()
        {
            if (gPacPessTurma == null)
            {
                gPacPessTurma = new GerenciadorPacientePessoaTurma();
            }
            return gPacPessTurma;
        }

        /// <summary>
        /// Insere dados do pacientePessoaTurma
        /// </summary>
        /// <param name="pacientePessoaTurma"></param>
        /// <returns></returns>
        //public int Inserir(PacientePessoaTurmaModel pacientePessoaTurma)
        //{
        //    var repPacPessTurma = new RepositorioGenerico<PacientePessoaTurmaE>();
        //    PacientePessoaTurmaE _pacPessTurma = new PacientePessoaTurmaE();
        //    try
        //    {
        //        Atribuir(pacientePessoaTurma, _pacPessTurma);

        //        repPacPessTurma.Inserir(_pacPessTurma);
        //        repPacPessTurma.SaveChanges();

        //        return _pacPessTurma.IdPaciente;
        //    }
        //    catch (Exception e)
        //    {
        //        throw new DadosException("PacientePessoaTurma", e.Message, e);
        //    }
        //}

        /// <summary>
        /// Atualiza dados do pacientePessoaTurma
        /// </summary>
        /// <param name="pacientePessoaTurma"></param>
        //public void Atualizar(PacientePessoaTurmaModel pacientePessoaTurma)
        //{
        //    try
        //    {
        //        var repPacPessTurma = new RepositorioGenerico<PacientePessoaTurmaE>();
        //        PacientePessoaTurmaE _pacPessTurma = repPacPessTurma.ObterEntidade(c => c.IdPaciente == pacientePessoaTurma.IdPaciente);
        //        Atribuir(pacientePessoaTurma, _pacPessTurma);

        //        repPacPessTurma.SaveChanges();
        //    }
        //    catch (Exception e)
        //    {
        //        throw new DadosException("PacientePessoaTurma", e.Message, e);
        //    }
        //}

        /// <summary>
        /// Remove dados do pacientePessoaTurma
        /// </summary>
        /// <param name="codDisciplina"></param>
        //public void Remover(int IdPaciente)
        //{
        //    //if (idCurso == 1)
        //    //    throw new NegocioException("A pacientePessoaTurma não pode ser removido.");
        //    try
        //    {
        //        var repPacPessTurma = new RepositorioGenerico<PacientePessoaTurmaE>();
        //        repPacPessTurma.Remover(c => c.IdPaciente == IdPaciente);
        //        repPacPessTurma.SaveChanges();
        //    }
        //    catch (Exception e)
        //    {
        //        throw new DadosException("PacientePessoaTurma", e.Message, e);
        //    }
        //}

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        //private IQueryable<PacientePessoaTurmaModel> GetQuery()
        //{
        //    var repPacPessTurma = new RepositorioGenerico<PacientePessoaTurmaE>();
        //    var pvEntities = (pvEntities)repPacPessTurma.ObterContexto();
        //    var query = from pacientePessoaTurma in pvEntities.tb_paciente_pessoa_turma
        //                // join tb_instituicao in pvEntities.tb_instituicao
        //                //on tb_paciente_pessoa_turma.IdInstituicao equals tb_instituicao.IdInstituicao
        //                select new PacientePessoaTurmaModel
        //                {

        //                    IdPessoa = pacientePessoaTurma.IdPessoa,
        //                    IdTurma = pacientePessoaTurma.IdTurma,
        //                    IdPaciente = pacientePessoaTurma.IdPaciente,

        //                    IdConsultaFixo = pacientePessoaTurma.IdConsultaFixo,
        //                    IdConsultaVariavel = pacientePessoaTurma.IdConsultaVariavel,
        //                    GrupoAtividades = pacientePessoaTurma.GrupoAtividades,
        //                    EstadoPreenchimento = pacientePessoaTurma.EstadoPreenchimento
        //                };
        //    return query;
        //}

        /// <summary>
        /// Obtém todos os pacientePessoaTurma cadastrados
        /// </summary>
        /// <returns></returns>
        //public IEnumerable<PacientePessoaTurmaModel> ObterTodos()
        //{
        //    return GetQuery().ToList();
        //}

        /// <summary>
        /// Obtém pacientePessoaTurma com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        //public PacientePessoaTurmaModel Obter(int idPessoa)//Idpessoa Ipaciente Idturma    
        //{
        //    return GetQuery().Where(pacientePessoaTurma => pacientePessoaTurma.IdPessoa == idPessoa).ToList().ElementAtOrDefault(0);
        //}

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
      //  public IEnumerable<PacientePessoaTurmaModel> ObterPorNome(string nomeCurso)// verificar possibilidades
      //  {
      //      return GetQuery().Where(pacientePessoaTurma => pacientePessoaTurma.NomeCurso.StartsWith(nomeCurso)).ToList();
      //  }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="pacientePessoaTurma"></param>
        /// <param name="_pacPessTurma"></param>
        //private static void Atribuir(PacientePessoaTurmaModel pacientePessoaTurma, PacientePessoaTurmaE _pacPessTurma)
        //{
        //    _pacPessTurma.IdConsultaFixo = pacientePessoaTurma.IdConsultaFixo;
        //    _pacPessTurma.IdConsultaVariavel = pacientePessoaTurma.IdConsultaVariavel;
        //    _pacPessTurma.GrupoAtividades = pacientePessoaTurma.GrupoAtividades;
        //    _pacPessTurma.EstadoPreenchimento = pacientePessoaTurma.EstadoPreenchimento;


        //}

    }
}