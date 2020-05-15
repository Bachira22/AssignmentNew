using AssignmentNew.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;

namespace AssignmentNew.Logic
{
    public class DBManipulationsLogic
    {
        const string connString = "Data Source=DESKTOP-C2S2FND\\SQLEXPRESS;Initial Catalog=UserDB;Integrated Security=SSPI;Pooling=False";
        SqlConnection conn;

        public DBManipulationsLogic()
        {
            conn = new SqlConnection(connString);
            conn.Open();
        }

        public HtmlString BuildProducts(int? UserId, string filterBy = null)
        {
            SqlCommand command;
            SqlDataReader dataReader;

            string sql = @"SELECT ProductsId, ProductName, ProductDescription, ProductPrice, ProductImage, 
                        (select count(1)
                        from UserProduct
                        where UserId = " + UserId + @"
                        and ProductsId =  ProductId
                        )
                        FROM Products
                        ";

            if (filterBy != null)
            {
                sql += " where ProductName like '%" + filterBy + "%'";
            }

            command = new SqlCommand(sql, conn);
            dataReader = command.ExecuteReader();
            List<Product> AllProducts = new List<Product>();
            while (dataReader.Read())
            {
                Product product = new Product()
                {
                    ProductId = Convert.ToInt32(dataReader.GetValue(0)),
                    ProductName = dataReader.GetValue(1).ToString(),
                    ProductDescription = dataReader.GetValue(2).ToString(),
                    ProductPrice = Convert.ToInt32(dataReader.GetValue(3)),
                    ProductImage = dataReader.GetValue(4).ToString()
                };

                if (dataReader.GetValue(5) != null)
                    product.UserSelectedProduct = Convert.ToBoolean(dataReader.GetValue(5));

                AllProducts.Add(product);
            }

            HtmlString productHtml = new HtmlString(GetProductString(AllProducts));

            dataReader.Close();
            command.Dispose();
            return productHtml;
        }

        internal UserPersonalDetails GetUserDetails(int? userId)
        {
            SqlCommand command;
            SqlDataReader dataReader;

            string sql = @"SELECT FirstName, LastName, MobileNumber from UserDetails
                        where userid = " + userId;


            command = new SqlCommand(sql, conn);
            dataReader = command.ExecuteReader();
            List<Product> AllProducts = new List<Product>();
            while (dataReader.Read())
            {
                UserPersonalDetails user = new UserPersonalDetails()
                {
                    FirstName = dataReader.GetValue(0).ToString(),
                    LastName = dataReader.GetValue(1).ToString(),
                    MobileNumber = Convert.ToInt32(dataReader.GetValue(2).ToString())

                };
                dataReader.Close();
                command.Dispose();
                return user;
            }
            dataReader.Close();
            command.Dispose();
            return null;
        }

        internal void UpdateUserCart(int? userId, int[] productIds)
        {
            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = "";

            sql = "Delete from UserProduct where userid= " + userId;

            command = new SqlCommand(sql, conn);

            adapter.DeleteCommand = new SqlCommand(sql, conn);
            adapter.DeleteCommand.ExecuteNonQuery();

            if (productIds.Length != 0)
            {
                sql = "";
                for (int i = 0; i < productIds.Length; i++)
                {
                    sql += "Insert into UserProduct values (" + userId + ", " + productIds[i] + ");";
                }

                adapter.InsertCommand = new SqlCommand(sql, conn);
                adapter.InsertCommand.ExecuteNonQuery();
            }
            adapter.Dispose();
            command.Dispose();
        }

        private string GetProductString(List<Product> AllProducts)
        {
            string allProductString = "";
            AllProducts.ForEach(x =>
            {
                var productImage = string.IsNullOrEmpty(x.ProductImage) == true ? x.ProductName + ".png" : x.ProductImage;

                allProductString += "<div class=\"container\">";
                allProductString += "<img src = \"../Images/" + productImage + "\" alt=\" " + x.ProductName + " \" class=\"image\" style=\"width: 100%\" />";
                allProductString += "<div class=\"middle\">";
                allProductString += "<div class=\"ContainerHeader\">";
                allProductString += x.ProductName;
                allProductString += "<p> Unit Price: Rs " + x.ProductPrice + "</p> </div> ";
                if (x.UserSelectedProduct == null || x.UserSelectedProduct == false)
                    allProductString += "<div class=\"text\" id=\"ProductId" + x.ProductId + "\" onclick=\"incrementCart(\\'" + x.ProductName + "\\', \\'" + x.ProductId + "\\')\">Add to cart</div>";
                else
                    allProductString += "<div class=\"text\" id=\"ProductId" + x.ProductId + "\" onclick=\"decrementCart(\\'" + x.ProductName + "\\', \\'" + x.ProductId + "\\')\">Remove From cart</div>";
                allProductString += "</div></div>";

            });
            return allProductString;
        }

        public HtmlString BuildProductsInCart(string UserId)
        {
            string sql = @"
                select ProductId, ProductName from UserProduct
                inner join Products on Products.ProductsId = UserProduct.ProductId
                where userid = " + UserId;

            SqlCommand command;
            SqlDataReader dataReader;

            command = new SqlCommand(sql, conn);
            dataReader = command.ExecuteReader();
            Dictionary<int, string> AllProducts = new Dictionary<int, string>();
            while (dataReader.Read())
            {
                AllProducts.Add(Convert.ToInt32(dataReader.GetValue(0)), dataReader.GetValue(1).ToString());
            }

            HtmlString productHtml = new HtmlString(GetProductIncartString(AllProducts));

            dataReader.Close();
            command.Dispose();
            return productHtml;


        }

        public string GetProductIncartString(Dictionary<int, string> ProductsinCart)
        {
            string allProductsInCartString = "";
            foreach (var row in ProductsinCart)
            {
                allProductsInCartString += "<li id=\"" + row.Key + "\" class= \"top\"> <a>" + row.Value + "</a></li>";

            }

            return allProductsInCartString;
        }

        public int? UserNameExists(UserLoginDetails user, Boolean checkPassword = false)
        {
            SqlCommand command;
            SqlDataReader dataReader;

            string sql = "SELECT TOP 1 UserId, UserName FROM Users WHERE UserName = '" + user.UserName + "' ";

            if (checkPassword == true)
            {
                sql += "And UserPassword ='" + user.UserPassword + "'";
            }

            command = new SqlCommand(sql, conn);
            dataReader = command.ExecuteReader();
            int[] UserInfo = new int[1];
            while (dataReader.Read())
            {
                return Convert.ToInt32(dataReader.GetValue(0));
            }
            dataReader.Close();
            command.Dispose();
            return null;
        }

        public int WriteToDB(UserPersonalDetails user)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql;
            sql = "Insert into Users values ('" + user.UserName + "', '" + user.UserPassword + "')";
            adapter.InsertCommand = new SqlCommand(sql, conn);
            adapter.InsertCommand.ExecuteNonQuery();


            var UserId = GetUserId(user.UserName);

            sql = @"INSERT INTO USERDETAILS 
            VALUES(" + UserId + ",'" + user.FirstName + "','" + user.LastName + "','" + user.Gender + "','" + user.Address + "'," + user.MobileNumber + "," + user.ProfessionId + ",'" + user.Email + "')";
            adapter.InsertCommand = new SqlCommand(sql, conn);

            var returnVal = adapter.InsertCommand.ExecuteNonQuery(); //return number of rows affected

            adapter.Dispose();
            return UserId;
        }

        public void UpdateUserInfo(UserPersonalDetails user)
        {

            string sql = "update UserDetails " +
                "set FirstName = '" + user.FirstName + "'" +
                ", LastName = '" + user.LastName + "'" +
                ", MobileNumber = " + user.MobileNumber + " " +
                "where userid= " + user.UserId;

            SqlDataAdapter adapter = new SqlDataAdapter
            {
                UpdateCommand = new SqlCommand(sql, conn)
            };
            adapter.UpdateCommand.ExecuteNonQuery();
        }

        public int GetUserId(string username)
        {
            SqlCommand command;
            SqlDataReader dataReader;

            string sql = "SELECT UserId FROM Users WHERE USERNAME = '" + username + "'";

            command = new SqlCommand(sql, conn);
            dataReader = command.ExecuteReader();
            var userid = -1;
            while (dataReader.Read())
            {
                userid = Convert.ToInt32(dataReader.GetValue(0));
                break;
            }
            dataReader.Close();
            return userid;
        }

        public void Dispose()
        {
            conn.Dispose();
        }


    }
}