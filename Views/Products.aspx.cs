using AssignmentNew.Logic;
using AssignmentNew.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentNew.Views
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["IsUserLoggedIn"] != null && Session["IsUserLoggedIn"] as bool? != false && Session["UserId"] != null)
            {
                DBManipulationsLogic db = new DBManipulationsLogic();

                if (Request.QueryString["UpdatedVal"] != null)
                {  //Convert Json Array to int Array
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    int[] ProductIds = js.Deserialize<int[]>(Request.QueryString["UpdatedVal"].ToString());
                    db.UpdateUserCart(Session["UserId"] as int?, ProductIds);
                }

                PopulateViewStateValue(db);

                if (Page.IsPostBack)
                {
                    if (Request.QueryString["searchBar"] != null)
                    Session["Products"] = db.BuildProducts(Session["UserId"] as int?,Request.QueryString["searchBar"].ToString());

                
                }
                else
                {
                    Session["Products"] = db.BuildProducts(Session["UserId"] as int?);
                    Session["ProductListInCart"] = db.BuildProductsInCart(Session["UserId"].ToString());

                }
            }

            else
            {
                Response.Redirect("Home.aspx");
            }

        }

        private void PopulateViewStateValue(DBManipulationsLogic db)
        {
            UserPersonalDetails user = db.GetUserDetails(Session["UserId"] as int?);
            UpdateFirstName.Text = user.FirstName;
            UpdateLastName.Text = user.LastName;
            UpdateMobileNumber.Text = user.MobileNumber.ToString();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string updatedFirstName = UpdateFirstName.Text.ToString();
            string updatedLastName = UpdateLastName.Text.ToString();
            int updatedMobileNumber = Convert.ToInt32(UpdateMobileNumber.Text.ToString());
            UserPersonalDetails user = new UserPersonalDetails
            {
                UserId = Session["UserId"] as int?,
                FirstName = updatedFirstName,
                LastName = updatedLastName,
                MobileNumber = updatedMobileNumber
            };
            DBManipulationsLogic db = new DBManipulationsLogic();
            db.UpdateUserInfo(user);
        }
    }
}