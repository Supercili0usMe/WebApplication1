using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownList1.Items.Insert(0, "<-- Select -->");
            }
                
        }

        protected void GridView1_SelectedIndexChanged(Object sender, EventArgs e)
        {
            Session["IDG"] = this.GridView1.SelectedValue;
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Session["IDT"] = this.DropDownList1.SelectedValue;
        }
    }
}