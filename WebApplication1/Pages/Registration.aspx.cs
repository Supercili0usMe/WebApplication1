using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Чтение полей
                string pswrd, email, sqlQ;
                pswrd = Convert.ToString(TextBox3.Text);
                email = Convert.ToString(TextBox1.Text);

                // Строка подключения. Ссылка на БД SQL Server
                string connectionString = @"Data Source=SUPERCILIOUSME\SQLEXPRESS; Initial Catalog=MuseumDB; 
                Persist Security Info=True; User ID=test; Password=***********; Trusted_Connection = true;";
                var connect = new SqlConnection(connectionString);

                //Проверка на наличие аккаунта с такой же почтой
                // Открытие подключения
                connect.Open();

                // Запуск хранимой процедуры
                SqlCommand cmd = new SqlCommand("check_free_email", connect);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@user_email", email));

                // Cчитывание результата
                SqlDataReader myread = cmd.ExecuteReader();

                if (myread.Read())
                {
                    int account_nums = Convert.ToInt32(myread.GetValue(0));
                    myread.Close();

                    if (account_nums == 0)
                    {
                        // SQL запрос на количество строк в таблице
                        string count = "SELECT TOP 1 [ID_client] FROM [MuseumDB].[dbo].[Clients] ORDER BY [ID_client] DESC";

                        // Выполнение запроса
                        var mycom = new SqlCommand();
                        mycom.CommandText = count;
                        mycom.Connection = connect;

                        // Cчитывание результата
                        SqlDataReader myread1 = mycom.ExecuteReader();

                        if (myread1.Read())
                        {
                            int ID_client = Convert.ToInt16(myread1.GetValue(0)) + 1;
                            myread1.Close();

                            // SQL запрос
                            sqlQ = $"INSERT INTO Clients(ID_client, Login, Password, Client_e_mail) VALUES({ID_client}, '{email}', '{pswrd}', '{email}')";

                            // Выполнение команды
                            var my = new SqlCommand();
                            my.CommandText = sqlQ;
                            my.Connection = connect;
                            my.ExecuteNonQuery();
                            connect.Close();

                            Session["IdU"] = email;

                            // Переадресация на лк
                            Response.Redirect("/Pages/PersonalPage.aspx");
                        }
                    }
                    else
                    {
                        Label1.Text = "Данная почта уже используется";
                    }
                
                }
            }
            
        }
    }
}