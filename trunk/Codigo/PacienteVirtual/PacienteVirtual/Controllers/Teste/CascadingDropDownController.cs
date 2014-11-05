using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class CascadingDropDownController : Controller
    {
        public ActionResult Index()
        {
            ProductCatalog productCatalog = new ProductCatalog();
            productCatalog.Categories = ProductCatalog.GetCategories();

            return View(productCatalog);
        }

        [HttpPost]
        public ActionResult SelectCategory(int? selectedCategoryId)
        {
            ProductCatalog productCatalog = new ProductCatalog();
            productCatalog.SubCategories = new List<SubCategory>();

            if (selectedCategoryId.HasValue)
            {
                productCatalog.SubCategories = (from s in ProductCatalog.GetSubCategories()
                                                where s.CategoryId == selectedCategoryId
                                                orderby s.Name
                                                select s).ToList();
            }

            return PartialView("SubCategoriesUserControl", productCatalog);
        }

        [HttpPost]
        public ActionResult SelectSubCategory(int? selectedSubCategoryId)
        {
            ProductCatalog productCatalog = new ProductCatalog();
            productCatalog.Products = new List<Product>();

            if (selectedSubCategoryId.HasValue)
            {
                productCatalog.Products = (from s in ProductCatalog.GetProducts()
                                           where s.SubCategoryId == selectedSubCategoryId
                                           orderby s.Name
                                           select s).ToList();
            }

            return PartialView("ProductsUserControl", productCatalog);
        }
    }
}
