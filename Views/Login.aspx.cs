using AssignmentNew.Logic;
using AssignmentNew.Model;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace AssignmentNew.Views
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["IsUserLoggedIn"] as bool? != true)
            {
                //Initialize cookies
                HttpCookie LoginErrorCookie = new HttpCookie("LoginError")
                {
                    Value = "False"
                };
                HttpCookie LoginErrorMessageCookie = new HttpCookie("LoginErrorMessage")
                {
                    Value = null
                };

                HttpCookie PostBackedCookie = new HttpCookie("PagePostedBack")
                {
                    Value = "False"
                };

                Request.Cookies.Add(PostBackedCookie);
                Request.Cookies.Add(LoginErrorCookie);
                Request.Cookies.Add(LoginErrorMessageCookie);

                if (Page.IsPostBack)
                {
                    PostBackedCookie.Value = "True";

                    ViewState["UserName"] = UserName.Text;

                    Page.Validate();
                    if (!Page.IsValid)
                    {
                        LoginErrorCookie.Value = "True";
                        LoginErrorMessageCookie.Value = BuildErrorMsg(this.Validators.Cast<IValidator>().Where(v => !v.IsValid).Select(z => z.ErrorMessage).ToArray());
                    }
                    else
                    {
                        ValidateDetails();
                    }
                }
            }
            else{
                Response.Redirect("Home.aspx");

            }
        }

        public string BuildErrorMsg(string[] ErrorMsgsFromUI)
        {
            string ErrorMsgToUI = "";

            for (int i = 0; i < ErrorMsgsFromUI.Length; i++)
            {
                ErrorMsgToUI += ErrorMsgsFromUI[i];
                if (i + 1 < ErrorMsgsFromUI.Length)
                    ErrorMsgToUI += ",";
            }

            if (ErrorMsgToUI.EndsWith(","))
            {
                ErrorMsgToUI = ErrorMsgToUI.Substring(0, ErrorMsgToUI.Length - 1);
            }

            ErrorMsgToUI += " is required.";
            return ErrorMsgToUI;
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
                dbLogic.Dispose();

                if (UserInfo != null)
                {
                    Session["UserId"] = UserInfo[0];
                    //    Session["UserName"] = UserInfo[1];
                    Session["IsUserLoggedIn"] = true;
                    Response.Redirect("Home.aspx?UserName=" + user.UserName);
                }
                else
                {
                    HttpCookie LoginErrorCookie = Request.Cookies.Get("LoginError");
                    LoginErrorCookie.Value = "True";
                    HttpCookie LoginErrorMessageCookie = Request.Cookies.Get("LoginErrorMessage");

                    LoginErrorMessageCookie.Value = "Invalid Login Details Provided.";
                }

            }
        }
    }
}