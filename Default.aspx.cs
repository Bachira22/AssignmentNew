using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentNew
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Testing db connection
            string connString = "Data Source=DESKTOP-C2S2FND\\SQLEXPRESS;Initial Catalog=UserDB;Integrated Security=SSPI;Pooling=False";
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            SqlCommand command;
            SqlDataReader dataReader;

            string sql = "Select * from Users";

            command = new SqlCommand(sql, conn);

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                if (dataReader.GetValue(0).ToString() == "1")
                {
                    break;
                }

            }
            dataReader.Close();
            command.Dispose();
            conn.Close();
        }

    }
}