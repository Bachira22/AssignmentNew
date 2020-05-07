using AssignmentNew.Model;
using System;
using System.Data.SqlClient;

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

        public bool UserNameExists(UserLoginDetails user, Boolean checkPassword = false)
        {
            var usernameDoesExists = false;
            SqlCommand command;
            SqlDataReader dataReader;

            string sql = "SELECT TOP 1 UserName FROM Users WHERE UserName = '" + user.UserName + "' ";

            if (checkPassword == true)
            {
                sql += "And UserPassword ='" + user.UserPassword + "'";
            }

            command = new SqlCommand(sql, conn);
            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                usernameDoesExists = true;
                break;
            }
            dataReader.Close();
            command.Dispose();
            return usernameDoesExists;
        }

        public int WriteToDB(UserPersonalDetails user)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql;
            sql = "Insert into Users values ('" + user.UserName + "', '" + user.UserPassword + "')";
            adapter.InsertCommand = new SqlCommand(sql, conn);
            var returnVal = adapter.InsertCommand.ExecuteNonQuery(); //return number of rows affected

            adapter.Dispose();
            return returnVal;
        }

        public int UpdateUserInfo(UserPersonalDetails user)
        {

            //TO-DO Update statement to update user profile

            //SqlDataAdapter adapter = new SqlDataAdapter
            //{
            //    UpdateCommand = new SqlCommand(sql, conn)
            //};
            //adapter.UpdateCommand.ExecuteNonQuery();

            return 0;
        }


        public void Dispose()
        {
            conn.Dispose();
        }


    }
}