using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class ChangePersonalData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string login = Convert.ToString(Session["IdU"]);

            // SQL запрос
            string sqlQ = "DELETE Clients Where Login = '" + login + "'";

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

            Response.Redirect("/");
        }
    }
}