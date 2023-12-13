using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class NewsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Поиск по типу мероприятия
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string critetia;
                critetia = "SELECT * FROM Events WHERE ID_event_type=" + DropDownList1.SelectedValue;
                SqlDataSource3.SelectCommand = critetia;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label1.Text = ex1.Message;
                return;
            }
        }

        // Поиск по дате проведения
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string criteria;
                criteria = "SELECT * FROM Events WHERE Event_date >= convert(date,'" + DropDownList2.SelectedValue+ "')";
                SqlDataSource3.SelectCommand = criteria;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label1.Text = ex1.Message;
                return;
            }
        }

        // Поиск по типу и по дате
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                string crit1, criteria;
                crit1 = "ID_event_type = " + DropDownList1.SelectedValue + "AND Event_date >= convert(date,'" + DropDownList2.SelectedValue + "')";
                criteria = "SELECT * FROM Events WHERE " + crit1;
                SqlDataSource3.SelectCommand = criteria;
                GridView1.DataBind();
            }
            catch(Exception ex1)
            {
                Label1.Text=ex1.Message;
                return ;
            }
        }

        // Отмена фильтров
        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                string criteria;
                criteria = "SELECT * FROM Events";
                SqlDataSource3.SelectCommand = criteria;
                GridView1.DataBind();
            }
            catch( Exception ex1)
            {
                Label1.Text = ex1.Message;
                return;
            }

        }

    }
}