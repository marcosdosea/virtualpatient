using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class ConsultaController : Controller
    {
      
        public ViewResult Index()
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos(), "IdPaciente", "NomePaciente");
            return View(GerenciadorRelatoClinico.GetInstance().ObterTodos());
        }

        [HttpPost]
        public ActionResult Index(int IdPaciente = -1)
        {
            ViewBag.IdPaciente = new SelectList(GerenciadorPaciente.GetInstance().ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            if (IdPaciente != -1)
                return View(GerenciadorRelatoClinico.GetInstance().ObterRelatos(IdPaciente));
            if (IdPaciente == -1)
                return View(GerenciadorRelatoClinico.GetInstance().ObterTodos());
            return View();
        }

        //
        // GET: /VMConsulta/Edit
        public ActionResult Edit(int idRelato, long idConsultaFixo)
        {
            int idPessoa = Global.ID_PESSOA;
            int idTurma = Global.ID_TURMA;
            ConsultaModel vmConsulta = new ConsultaModel();

            ConsultaVariavelModel consultaV = GerenciadorConsultaVariavel.GetInstance().Obter(idTurma, idPessoa, idRelato);

            if (consultaV == null)//caso a consulta nunca tenha sido feita para esse relato
            {
                ConsultaFixoModel consultaF = new ConsultaFixoModel();

                long idConsultaF = GerenciadorConsultaFixo.GetInstance().Inserir(consultaF);
                //ainda em teste
                //alimenta a tabela tb_turma_pessoa_relato 
                TurmaPessoaRelatoModel tPR = new TurmaPessoaRelatoModel();
                tPR.IdPessoa = idPessoa;
                tPR.IdTurma = idTurma;
                tPR.IdRelato = idRelato;
                tPR.IdConsultaFixo = idConsultaF; //Default
                tPR.EstadoPreenchimento = "A";
                                
                GerenciadorTurmaPessoaRelato.GetInstance().Inserir(tPR);
                
                //Cria uma consulta Variavel caso não exista uma para as seguintes especificações
                ConsultaVariavelModel consultaVM = new ConsultaVariavelModel();
                consultaVM.IdPessoa = idPessoa;
                consultaVM.IdTurma = idTurma;
                consultaVM.IdRelato = idRelato;
                consultaVM.IdConsultaFixo = idConsultaF;//Default
                consultaVM.IdRazaoEncontro = 1;//Default

                long idConsultaV = GerenciadorConsultaVariavel.GetInstance().Inserir(consultaVM);

                vmConsulta.idConsultaFixo = idConsultaF;
                vmConsulta.idConsultaVariavel = idConsultaV;

                return View(vmConsulta);
            }

            vmConsulta.idConsultaFixo = consultaV.IdConsultaFixo;
            vmConsulta.idConsultaVariavel = consultaV.IdConsultaVariavel;
            return View(vmConsulta);
        }

        

        //Experiencia medicamentos
        public PartialViewResult ExperienciaMedicamentos(int id)
        {
            return PartialView();
        }

        //Estilo de Vida
        public PartialViewResult EstiloVida(int id)
        {
            EstiloVidaModel estiloVida = GerenciadorEstiloVida.GetInstance().Obter(id);

            if(estiloVida == null){

                estiloVida = new EstiloVidaModel();
                estiloVida.IdConsultaVariavel = id;

                GerenciadorEstiloVida.GetInstance().Inserir(estiloVida);
            }

            return PartialView(estiloVida);
        }

        //Estilo de Vida
        [HttpPost]
        public PartialViewResult EstiloVida(EstiloVidaModel estiloVida)
        {

            if (ModelState.IsValid)
            {
                GerenciadorEstiloVida.GetInstance().Atualizar(estiloVida);
            }

            return PartialView(estiloVida);
        }

        //Relato Clinico
        public PartialViewResult RelatoClinico(RelatoClinicoModel model)
        {
            return PartialView(model);
        }



        // Medicamentos Anteriores
        public PartialViewResult MedicamentosAnteriores(int id)
        {
            ViewBag.MedicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance().ObterTodos();
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);
         
            MedicamentosAnterioresModel medAnt = new MedicamentosAnterioresModel();
            medAnt.IdConsultaVariavel = id;
            return PartialView(medAnt);
        }

        // Medicamentos Anteriores
        [HttpPost]
        public PartialViewResult MedicamentosAnteriores(MedicamentosAnterioresModel medAnteriores)
        {
            if (ModelState.IsValid)
            {
                GerenciadorMedicamentosAnteriores.GetInstance().Inserir(medAnteriores);
            }
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);
            ViewBag.MedicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance().ObterTodos().ToList();
            
            return PartialView(medAnteriores);
        }

        // Medicamentos Anteriores
        [HttpPost, ActionName("Delete")]
        public PartialViewResult RemoverMedicamentosAnteriores(long idConsultaV, long idMedicamento)
        {
            GerenciadorMedicamentosAnteriores.GetInstance().Remover(idConsultaV, idMedicamento);

            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);
            ViewBag.medicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance().ObterTodos();


            MedicamentosAnterioresModel medAnt = new MedicamentosAnterioresModel();
            medAnt.IdConsultaVariavel = idConsultaV;
            return PartialView(medAnt);
        }

        // Medicamento Prescrito
        public PartialViewResult MedicamentoPrescrito(int id)
        {
            ViewBag.MedicamentosPrescrito = GerenciadorMedicamentoPrescrito.GetInstance().ObterTodos();
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);

            MedicamentoPrescritoModel medPrescrito = new MedicamentoPrescritoModel();
            medPrescrito.IdConsultaVariavel = id;
            return PartialView(medPrescrito);
        }

        // Medicamento Prescrito
        [HttpPost]
        public PartialViewResult MedicamentoPrescrito(MedicamentoPrescritoModel medicamentosPrescritos)
        {
            if (ModelState.IsValid)
            {
                GerenciadorMedicamentoPrescrito.GetInstance().Inserir(medicamentosPrescritos);
            }
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);
            ViewBag.MedicamentosPrescrito = GerenciadorMedicamentoPrescrito.GetInstance().ObterTodos().ToList();

            return PartialView(medicamentosPrescritos);
        }

        // Medicamentos prescrito
        [HttpPost, ActionName("Delete")]
        public PartialViewResult RemoverMedicamentosPrescritos(long idConsultaV, long idMedicamento)
        {
            GerenciadorMedicamentoPrescrito.GetInstance().Remover(idConsultaV, idMedicamento);

            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);
            ViewBag.MedicamentosPrescrito = GerenciadorMedicamentoPrescrito.GetInstance().ObterTodos();

            MedicamentoPrescritoModel medPrescrito = new MedicamentoPrescritoModel();
            medPrescrito.IdConsultaVariavel = idConsultaV;
            return PartialView(medPrescrito);
        }

        /* Medicamento não prescrito*/


        // Medicamento Nao Prescrito
        public PartialViewResult MedicamentoNaoPrescrito(int id)
        {
            ViewBag.MedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance().ObterTodos();
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);

            MedicamentoNaoPrescritoModel medNaoPrescrito = new MedicamentoNaoPrescritoModel();
            medNaoPrescrito.IdConsultaVariavel = id;
            return PartialView(medNaoPrescrito);
        }

        // Medicamento Nao Prescrito
        [HttpPost]
        public PartialViewResult MedicamentoNaoPrescrito(MedicamentoNaoPrescritoModel medicamentoNaoPrescrito)
        {
            if (ModelState.IsValid)
            {
                GerenciadorMedicamentoNaoPrescrito.GetInstance().Inserir(medicamentoNaoPrescrito);
            }
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);
            ViewBag.MedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance().ObterTodos().ToList();

            return PartialView(medicamentoNaoPrescrito);
        }

        // Medicamentos não prescrito
        [HttpPost, ActionName("Delete")]
        public PartialViewResult RemoverMedicamentoNaoPrescrito(long idConsultaV, long idMedicamento)
        {
            GerenciadorMedicamentoNaoPrescrito.GetInstance().Remover(idConsultaV, idMedicamento);

            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome", 0);
            ViewBag.MedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance().ObterTodos();

            MedicamentoNaoPrescritoModel medNaoPrescrito = new MedicamentoNaoPrescritoModel();
            medNaoPrescrito.IdConsultaVariavel = idConsultaV;
            return PartialView(medNaoPrescrito);
        }

        public PartialViewResult Queixa(int id)
        {
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos().ToList(), "IdSistema", "NomeSistema");
            return PartialView();
        }

        public PartialViewResult ListarQueixa(int id)
        {
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos().ToList(), "IdSistema", "NomeSistema");
            return PartialView();
        }
    }
}
