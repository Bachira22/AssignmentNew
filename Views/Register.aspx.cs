using AssignmentNew.Logic;
using AssignmentNew.Model;
using System;
using System.Web.UI;

namespace AssignmentNew.Views
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                ValidateDetails();
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

                if (dbLogic.UserNameExists(new UserLoginDetails { UserName = Request["UserName"], UserPassword = Request["UserPassword"] }) == null)
                {
                    //if username dont exist in the db, insert into db
                    dbLogic.WriteToDB(user);
                }

                dbLogic.Dispose();
            }
        }
    }
}