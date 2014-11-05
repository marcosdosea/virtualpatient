using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class ProductCatalog
    {
        public int? SelectedCategoryId { get; set; }
        public int? SelectedSubCategoryId { get; set; }

        public IEnumerable<Category> Categories { get; set; }
        public IEnumerable<SubCategory> SubCategories { get; set; }
        public IEnumerable<Product> Products { get; set; }

        public static IEnumerable<Category> GetCategories()
        {
            List<Category> categories = new List<Category>();

            categories.Add(new Category() { Id = 1, Name = "Electronics" });
            categories.Add(new Category() { Id = 2, Name = "Gaming" });
            categories.Add(new Category() { Id = 3, Name = "Mobile Phone" });

            return categories;
        }

        public static IEnumerable<SubCategory> GetSubCategories()
        {
            List<SubCategory> subCategories = new List<SubCategory>();

            subCategories.Add(new SubCategory() { Id = 1, CategoryId = 1, Name = "Media Players" });
            subCategories.Add(new SubCategory() { Id = 2, CategoryId = 1, Name = "TVs" });
            subCategories.Add(new SubCategory() { Id = 3, CategoryId = 1, Name = "Home Audios" });
            subCategories.Add(new SubCategory() { Id = 4, CategoryId = 2, Name = "Nintendo" });
            subCategories.Add(new SubCategory() { Id = 5, CategoryId = 2, Name = "Playstation" });
            subCategories.Add(new SubCategory() { Id = 6, CategoryId = 2, Name = "XBox" });
            subCategories.Add(new SubCategory() { Id = 7, CategoryId = 3, Name = "Android Phone" });
            subCategories.Add(new SubCategory() { Id = 8, CategoryId = 3, Name = "Apple iPhone" });
            subCategories.Add(new SubCategory() { Id = 9, CategoryId = 3, Name = "Others" });

            return subCategories;
        }

        public static IEnumerable<Product> GetProducts()
        {
            List<Product> products = new List<Product>();

            products.Add(new Product() { Id = 1, SubCategoryId = 1, Name = "Product 1A" });
            products.Add(new Product() { Id = 2, SubCategoryId = 1, Name = "Product 1B" });
            products.Add(new Product() { Id = 3, SubCategoryId = 1, Name = "Product 1C" });
            products.Add(new Product() { Id = 4, SubCategoryId = 2, Name = "Product 2A" });
            products.Add(new Product() { Id = 5, SubCategoryId = 2, Name = "Product 2B" });
            products.Add(new Product() { Id = 6, SubCategoryId = 2, Name = "Product 2C" });
            products.Add(new Product() { Id = 7, SubCategoryId = 3, Name = "Product 3A" });
            products.Add(new Product() { Id = 8, SubCategoryId = 3, Name = "Product 3B" });
            products.Add(new Product() { Id = 9, SubCategoryId = 3, Name = "Product 3C" });
            products.Add(new Product() { Id = 10, SubCategoryId = 4, Name = "Product 4A" });
            products.Add(new Product() { Id = 11, SubCategoryId = 4, Name = "Product 4B" });
            products.Add(new Product() { Id = 12, SubCategoryId = 4, Name = "Product 4C" });
            products.Add(new Product() { Id = 13, SubCategoryId = 5, Name = "Product 5A" });
            products.Add(new Product() { Id = 14, SubCategoryId = 5, Name = "Product 5B" });
            products.Add(new Product() { Id = 15, SubCategoryId = 5, Name = "Product 5C" });
            products.Add(new Product() { Id = 16, SubCategoryId = 6, Name = "Product 6A" });
            products.Add(new Product() { Id = 17, SubCategoryId = 6, Name = "Product 6B" });
            products.Add(new Product() { Id = 18, SubCategoryId = 6, Name = "Product 6C" });
            products.Add(new Product() { Id = 19, SubCategoryId = 7, Name = "Product 7A" });
            products.Add(new Product() { Id = 20, SubCategoryId = 7, Name = "Product 7B" });
            products.Add(new Product() { Id = 21, SubCategoryId = 7, Name = "Product 7C" });
            products.Add(new Product() { Id = 22, SubCategoryId = 8, Name = "Product 8A" });
            products.Add(new Product() { Id = 23, SubCategoryId = 8, Name = "Product 8B" });
            products.Add(new Product() { Id = 24, SubCategoryId = 8, Name = "Product 8C" });
            products.Add(new Product() { Id = 25, SubCategoryId = 9, Name = "Product 9A" });
            products.Add(new Product() { Id = 26, SubCategoryId = 9, Name = "Product 9B" });
            products.Add(new Product() { Id = 27, SubCategoryId = 9, Name = "Product 9C" });

            return products;
        }

        public static Category GetCategory(int CategoryId)
        {
            var categories = GetCategories();
            foreach (var Category in categories)
            {
                if (Category.Id == CategoryId)
                {
                    return Category;
                }
            }

            return null;
        }
    }
}