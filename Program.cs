using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace HttpClientSample
{
    public class Product
    {
        public string Sku { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
    }
    public class Category
    {
        public string Sku { get; set; }
        public string Name { get; set; }
    }

    class Program
    {
        static HttpClient client = new HttpClient();

        static void ShowProducts(List<Product> products)
        {
            StringBuilder str = new StringBuilder();
            foreach (Product p in products)
            {
                str.AppendLine("SKU : " + p.Sku.ToString() + " Name : " + p.Name + " Description : " + p.Description + " Price:" + p.Price.ToString() + " GBP");
            }
            Console.WriteLine(str.ToString());
        }
        static async Task<List<Product>> GetProductAsync()
        {
            List<Product> products = new List<Product>();
            HttpResponseMessage response = await client.GetAsync("https://localhost:44356/api/Product");
            if (response.IsSuccessStatusCode)
            {
                products = await response.Content.ReadAsAsync<List<Product>>();
            }
            return products;
        }
        static async Task<List<Product>> GetProductAsync(int sku)
        {
            List<Product> products = new List<Product>();
            HttpResponseMessage response = await client.GetAsync($"https://localhost:44356/api/Product/{sku}");
            if (response.IsSuccessStatusCode)
            {
                products = await response.Content.ReadAsAsync<List<Product>>();
            }
            return products;
        }
        static async Task<List<Product>> GetProductCategoryAsync(int sku)
        {
            List<Product> products = new List<Product>();
            HttpResponseMessage response = await client.GetAsync($"https://localhost:44356/api/Product/all/{sku}");
            if (response.IsSuccessStatusCode)
            {
                products = await response.Content.ReadAsAsync<List<Product>>();
            }
            return products;
        }
        static async Task<List<Category>> GetCategoryAsync()
        {
            List<Category> categories = new List<Category>();
            HttpResponseMessage response = await client.GetAsync("https://localhost:44356/api/Category");
            if (response.IsSuccessStatusCode)
            {
                categories = await response.Content.ReadAsAsync<List<Category>>();
            }
            return categories;
        }
        static async Task<List<Category>> GetCategoryAsync(int sku)
        {
            List<Category> categories = new List<Category>();
            HttpResponseMessage response = await client.GetAsync($"https://localhost:44356/api/Category/{sku}");
            if (response.IsSuccessStatusCode)
            {
                categories = await response.Content.ReadAsAsync<List<Category>>();
            }
            return categories;
        }

        static void Main()
        {
            RunAsync().GetAwaiter().GetResult();
        }

        static async Task RunAsync()
        {
            // Update port # in the following line.
            client.BaseAddress = new Uri("http://localhost:44356/");
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            StringBuilder str = new StringBuilder();
            try
            {
                int x = -1;
                string inputValues = "List All Products For Press 1 \n" +
                    "List Products in Category 2 \n" +
                    "List Avaliable Category for Product 3 \n" +
                    "Exit 0 \n ";

                List<Product> products = new List<Product>();
                List<Category> categories = new List<Category>();

                products = await GetProductAsync(4000);
                ShowProducts(products);
                categories = await GetCategoryAsync();
                foreach (string c in categories.Select(x => x.Name).Distinct())
                {
                    str.AppendLine(" Name : " + c);
                }
                Console.WriteLine(str.ToString());
                Console.WriteLine(inputValues);
                do
                {
                    string s = Console.ReadLine();

                    x = Convert.ToInt32(s);

                    if (x == 1)
                    {
                        products = await GetProductAsync();
                        ShowProducts(products);
                    }
                    else if (x == 2)
                    {
                        Console.WriteLine("Enter Product Category:");
                        s = Console.ReadLine();
                        Category category;
                        try
                        {
                            category = categories.Where(c => c.Name == s).FirstOrDefault();


                            int level = Convert.ToInt32(category.Sku.ToString().Substring(0, 1));
                            int sku = 0;
                            switch (level)
                            {
                                case 1:
                                    sku = 1999;
                                    break;
                                case 2:
                                    sku = 2999;
                                    break;
                                case 3:
                                    sku = 3999;
                                    break;
                                case 4:
                                    sku = 4999;
                                    break;
                                case 5:
                                    sku = 5999;
                                    break;

                            }
                            products = await GetProductCategoryAsync(sku);
                            ShowProducts(products);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("Couldn''t get products");
                        }

                    }
                    else if (x == 3)
                    {
                        Console.WriteLine("Enter Product Sku:");
                        s = Console.ReadLine();
                        str = new StringBuilder();
                        int level = Convert.ToInt32(s.Substring(0, 1));
                        int sku = 0;
                        switch (level)
                        {
                            case 1:
                                sku = 1999;
                                break;
                            case 2:
                                sku = 2999;
                                break;
                            case 3:
                                sku = 3999;
                                break;
                            case 4:
                                sku = 4999;
                                break;
                            case 5:
                                sku = 5999;
                                break;

                        }
                        List<Category> cList = await GetCategoryAsync(sku);
                        foreach (string c in cList.Select(x => x.Name).Distinct())
                        {
                            str.AppendLine(" Name : " + c);
                        }
                        Console.WriteLine(str.ToString());
                    }

                }
                while (x != 0);
                }
                
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            Console.ReadLine();
        }
    }
}