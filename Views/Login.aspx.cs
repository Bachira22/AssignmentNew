using AssignmentNew.Logic;
using AssignmentNew.Model;
using System;
using System.Web;
using System.Web.UI;

namespace AssignmentNew.Views
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie PostBackedCookie = new HttpCookie("PagePostedBack")
            {
                Value = "False"
            };


            Request.Cookies.Add(PostBackedCookie);

            if (Page.IsPostBack)
            {
                PostBackedCookie.Value = "True";

                ViewState["UserName"] = UserName.Text;

                if (!string.IsNullOrEmpty(Request["UserName"]) && !string.IsNullOrEmpty(Request["UserPassword"]))
                {
                    ValidateDetails();
                }
                else
                {
                    UserName.Text = ViewState["UserName"].ToString();
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
                var UserInfo = dbLogic.UserNameExists(new UserLoginDetails { UserName = Request["UserName"], UserPassword = Request["UserPassword"] }, true);
                if (UserInfo != null)
                {
                    Session["UserId"] = UserInfo[0];
                    Session["UserName"] = UserInfo[1];

                    Response.Redirect("Home.aspx?UserName=" + user.UserName);
                }

                dbLogic.Dispose();
            }
        }
    }
}