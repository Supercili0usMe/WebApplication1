using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class ChangeTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["DeleteTicket"] = this.GridView1.SelectedValue;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = Convert.ToString(Session["DeleteTicket"]);

            // SQL запрос  ID_passage	ID_ticket_type	ID_client	Reg_data	Summ_price
            //                  9               3           11    2023 - 01 - 07  120
            string sqlQ = "DELETE Tickets Where ID_ticket = " + id + "";

            // Строка подключения. Ссылка на БД SQL Server
            string connectionString = @"Data Source=SUPERCILIOUSME\SQLEXPRESS; Initial Catalog=MuseumDB; 
                Persist Security Info=True; User ID=test; Password=***********; Trusted_Connection = true;";
            var connect = new SqlConnection(connectionString);

            // Открытие подключения
            connect.Open();

            // Выполнение команды
            var mycom = new SqlCommand();
            mycom.CommandText = sqlQ;
            mycom.Connection = connect;
            mycom.ExecuteNonQuery();
            connect.Close();

            Response.Redirect("ChangeTickets.aspx");
        }
    }
}