using AssignmentNew.Logic;
using AssignmentNew.Model;
using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace AssignmentNew.Views
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["value"] = false;

            if (Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["UserName"]) && !string.IsNullOrEmpty(Request["UserPassword"]))
                {
                    ValidateDetails();
                }
            }
        }

        protected void ValidateDetails()
        {
            if (!string.IsNullOrEmpty(Request["UserName"]) && !string.IsNullOrEmpty(Request["UserPassword"]))
            {
                DBManipulationsLogic dbLogic = new DBManipulationsLogic();
                UserPersonalDetails user = new UserPersonalDetails
                {
                    UserName = Request["UserName"],
                    UserPassword = Request["UserPassword"]
                };

                if (dbLogic.UserNameExists(new UserLoginDetails { UserName = Request["UserName"], UserPassword = Request["UserPassword"] }, true))
                {
                    
                    //TO-DO
                    //Redirect because user exists
                }

                dbLogic.Dispose();
            }
        }
    }
}