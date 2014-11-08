using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class CascadingDropDownController : Controller
    {
        public ActionResult Index()
        {
            ProductCatalog productCatalog = new ProductCatalog();
            productCatalog.Dominio = GerenciadorDominioDiagnostico.GetInstance().ObterTodos();
            productCatalog.ClasseDominio = GerenciadorClasseDiagnostico.GetInstance().ObterPorDominio(0);
            productCatalog.Diagnostico = GerenciadorDiagnostico.GetInstance().ObterPorClasseDiagnostico(0);

            return View(productCatalog);
        }

        [HttpPost]
        public ActionResult SelectCategory(int? selectedDominioId)
        {
            ProductCatalog productCatalog = new ProductCatalog();
            productCatalog.ClasseDominio = GerenciadorClasseDiagnostico.GetInstance().ObterPorDominio((int)selectedDominioId);
            productCatalog.SelectedDominioId = selectedDominioId;

            return PartialView("SubCategoriesUserControl", productCatalog);
        }

        [HttpPost]
        public ActionResult SelectSubCategory(int? SelectedClasseDominioId)
        {
            ProductCatalog productCatalog = new ProductCatalog();
            productCatalog.Diagnostico = GerenciadorDiagnostico.GetInstance().ObterPorClasseDiagnostico((int)SelectedClasseDominioId);
            
            return PartialView("ProductsUserControl", productCatalog);
        }
    }
}
