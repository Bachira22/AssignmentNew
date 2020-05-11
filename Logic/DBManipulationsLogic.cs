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

        public int[] UserNameExists(UserLoginDetails user, Boolean checkPassword = false)
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
            int[] UserInfo = new int[2];
            while (dataReader.Read())
            {
                UserInfo[0] = Convert.ToInt32(dataReader.GetValue(0));
            //    UserInfo[1] = Convert.ToInt32(dataReader.GetValue(1));
                return UserInfo;
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

            sql = @"INSERT INTO USERDETAILS 
            VALUES(" + GetUserId(user.UserName) + ",'" + user.FirstName + "','" + user.LastName + "','" + user.Gender + "','" + user.Address + "'," + user.MobileNumber + "," + user.ProfessionId + ",'" + user.Email + "')";
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


        public int GetUserId(string username)
        { SqlCommand command;
            SqlDataReader dataReader;

            string sql = "SELECT UserId FROM Users WHERE USERNAME = '"+username+"'";

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