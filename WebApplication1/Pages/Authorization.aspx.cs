using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Authorization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Строка подключения. Ссылка на БД SQL Server
            string connectionString = @"Data Source=SUPERCILIOUSME\SQLEXPRESS; Initial Catalog=MuseumDB; Persist Security Info=True; User ID=test; Password=***********; Trusted_Connection = true;";
            var connect = new SqlConnection(connectionString);

            // Открытие подключения
            connect.Open();

            // Чтение из полей
            string pswrd, lgn;
            pswrd = Convert.ToString(TextBox2.Text);
            lgn = Convert.ToString(TextBox1.Text);

            string sqlQ = "SELECT * FROM Clients WHERE Login='" + lgn + "' AND Password='" + pswrd + "'";
            var mycom = new SqlCommand();
            mycom.CommandText = sqlQ;
            mycom.Connection = connect;

            // Выполнение команд SQL
            SqlDataReader myread;
            myread = mycom.ExecuteReader();
            

            // Перенос данных в текстовые поля
            if (myread.Read() == true)
            {
                Session["IdU"] = lgn;
                Session["IDP"] = Convert.ToString(myread.GetValue(0));
                Label1.Text = "Вы успешно вошли в систему!";
                if (lgn == "admin")
                {
                    Label1.Text = "Привет, админ!";
                    Response.Redirect("/Pages/AdminPage.aspx");
                }
                Response.Redirect("/Pages/PersonalPage.aspx");
            }
            else
            {
                Label1.Text = "Неверный логин или пароль";
            }
        }
    }
}