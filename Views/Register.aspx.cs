using AssignmentNew.Logic;
using AssignmentNew.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace AssignmentNew.Views
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsUserLoggedIn"] as bool? != true)
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

                Session["IsUserLoggedIn"] = false;

                Request.Cookies.Add(PostBackedCookie);
                Request.Cookies.Add(LoginErrorCookie);
                Request.Cookies.Add(LoginErrorMessageCookie);

                if (Page.IsPostBack)
                {
                    PostBackedCookie.Value = "True";

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
            else
            {
                Response.Redirect("Home.aspx");

            }
        }

        public string BuildErrorMsg(string[] ErrorMsgsFromUI)
        {
            string ErrorMsgToUI = "";
            List<string> RegularExpressionViolators = new List<string>();

            for (int i = 0; i < ErrorMsgsFromUI.Length; i++)
            {
                if (!ErrorMsgsFromUI[i].Contains("Mobile") && !ErrorMsgsFromUI[i].Contains("Email") )
                {
                    ErrorMsgToUI += ErrorMsgsFromUI[i];
                    if (i + 1 < ErrorMsgsFromUI.Length)
                        ErrorMsgToUI += ",";
                }
                else
                {
                    RegularExpressionViolators.Add(ErrorMsgsFromUI[i]);
                }

            }
            if (ErrorMsgsFromUI.Length != RegularExpressionViolators.Count)
            {
                if (ErrorMsgToUI.EndsWith(","))
                {
                    ErrorMsgToUI = ErrorMsgToUI.Substring(0, ErrorMsgToUI.Length - 1);

                }
                if (ErrorMsgsFromUI.Length == 4)
                    ErrorMsgToUI += " is <br/> required.";
                else
                    ErrorMsgToUI += " is required.";
            }

            if(RegularExpressionViolators.Any())
            {
                if(ErrorMsgToUI != "")
                {
                    ErrorMsgToUI += "<br/>";
                }

                var RegularExpressionViolatorsArr = RegularExpressionViolators.ToArray();
                for (int i = 0; i < RegularExpressionViolatorsArr.Length; i++)
                {
                    ErrorMsgToUI += RegularExpressionViolatorsArr[i];

                    if (i + 1 < ErrorMsgsFromUI.Length)
                        ErrorMsgToUI += "<br/>";

                }
            }

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
                    UserPassword = Request["UserPassword"],
                    Email = Request["Email"],
                    Address = Request["Address"],
                    MobileNumber = Convert.ToInt64(Request["MobileNumber"]),
                    Gender = Convert.ToChar(Request["SelectedRadioGender"]),
                    ProfessionId = Convert.ToInt32(Request["SelectedDropDownOccupation"]),
                    FirstName = Request["FirstName"],
                    LastName = Request["LastName"],
                };

                if (dbLogic.UserNameExists(new UserLoginDetails { UserName = Request["UserName"], UserPassword = Request["UserPassword"] }) == null)
                {
                    //if username dont exist in the db, insert into db
                    dbLogic.WriteToDB(user);
                    dbLogic.Dispose();
                    Session["IsUserLoggedIn"] = true;
                    Response.Redirect("Home.aspx?UserName=" + user.UserName);

                }
                else
                {
                    HttpCookie LoginErrorCookie = Request.Cookies.Get("LoginError");
                    LoginErrorCookie.Value = "True";
                    HttpCookie LoginErrorMessageCookie = Request.Cookies.Get("LoginErrorMessage");

                    LoginErrorMessageCookie.Value = "Username is already in use";

                }

            }
        }
    }
}