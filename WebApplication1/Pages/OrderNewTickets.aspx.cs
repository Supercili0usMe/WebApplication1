using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class OrderNewTicketsaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Session["User_ID"] = "11";

                string connectionString = @"Data Source=SUPERCILIOUSME\SQLEXPRESS; Initial Catalog=MuseumDB; 
                Persist Security Info=True; User ID=test; Password=***********; Trusted_Connection = true;";
                var connect = new SqlConnection(connectionString);
                connect.Open();
                string sqlQPrice = "SELECT ID_client FROM Clients WHERE Login = '" + Convert.ToString(Session["IdU"]) + "'";

                // Выполнение запроса
                var mycom = new SqlCommand();
                mycom.CommandText = sqlQPrice;
                mycom.Connection = connect;

                // Cчитывание результата
                SqlDataReader myread = mycom.ExecuteReader();

                if (myread.Read())
                {
                    Session["User_ID"] = Convert.ToString(myread.GetValue(0));
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str = Convert.ToString(DropDownList1.SelectedValue);

            if (str == "-------Выберите-------")
            {
                Session.Clear();
            }
            else
            {
                Session["IDType"] = this.DropDownList1.SelectedValue;
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str = (string)DropDownList2.SelectedValue;
            
            if (str == "-------Выберите-------")
            {
                Session.Clear();
            }
            else
            {
                Session["Ticket_Type"] = this.DropDownList2.SelectedValue;
            }
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Event"] = this.GridView1.SelectedValue;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Базовые параметры
            string passage = Convert.ToString(Session["Event"]);
            string ticket_type = Convert.ToString(Session["Ticket_Type"]);
            string client = Convert.ToString(Session["User_ID"]);
            string ticket_amount = Convert.ToString(Session["Amount"]);

            // Строка подключения.Ссылка на БД SQL Server
            string connectionString = @"Data Source=SUPERCILIOUSME\SQLEXPRESS; Initial Catalog=MuseumDB; 
            Persist Security Info=True; User ID=test; Password=***********; Trusted_Connection = true;";
            var connect = new SqlConnection(connectionString);

            // Открытие подключения
            connect.Open(); 

            // SQL запрос на определение цены
            string sqlQPrice = "SELECT [Итоговая цена одного билета] FROM Verifying2 WHERE ID_ticket_type = '" + ticket_type + "' AND ID_passage = '" + passage + "'";

            // Выполнение запроса
            var mycom = new SqlCommand();
            mycom.CommandText = sqlQPrice;
            mycom.Connection = connect;

            // Cчитывание результата
            SqlDataReader myread = mycom.ExecuteReader();

            if (myread.Read())
            {
                string finalPrice = Convert.ToString(myread.GetValue(0));
                string reg_data =  DateTime.Today.ToString();
                myread.Close();

                // Запуск хранимой процедуры
                SqlCommand cmd = new SqlCommand("Fill_free_tickets", connect);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@id_client", client));
                cmd.Parameters.Add(new SqlParameter("@id_ticket_type", ticket_type));
                cmd.Parameters.Add(new SqlParameter("@id_passage", passage));
                cmd.Parameters.Add(new SqlParameter("@summ_price", finalPrice));
                cmd.Parameters.Add(new SqlParameter("@amount", ticket_amount));
                cmd.Parameters.Add(new SqlParameter("@date", reg_data));
                cmd.ExecuteNonQuery();

                Response.Redirect("PersonalPage.aspx");
            }
            else
            {
                Label1.Text = "Возникла непредвиденная ошибка, повторите попытку позже";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string passage = Convert.ToString(Session["Event"]);

                // Строка подключения.Ссылка на БД SQL Server
                string connectionString = @"Data Source=SUPERCILIOUSME\SQLEXPRESS; Initial Catalog=MuseumDB; 
                Persist Security Info=True; User ID=test; Password=***********; Trusted_Connection = true;";
                var connect = new SqlConnection(connectionString);

                // Открытие подключения
                connect.Open();

                // Запуск хранимой процедуры
                SqlCommand cmd = new SqlCommand("Check_free_tickets_admin", connect);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@id_passage", passage));

                // Cчитывание результата
                SqlDataReader myread = cmd.ExecuteReader();

                if (myread.Read())
                {
                    if (!(Convert.ToString(TextBox1.Text) == ""))
                    {
                        int num_of_free_tickets = Convert.ToInt32(myread.GetValue(0));
                        int num_of_tickets = Convert.ToInt32(TextBox1.Text);

                        if (num_of_tickets > num_of_free_tickets)
                        {
                            Label3.Text = "Количество билетов первышает количество доступных";
                        }
                        else
                        {
                            Session["Amount"] = Convert.ToString(TextBox1.Text); ;
                        }
                    }
                    else
                    {
                        Label3.Text = "Количество билетов не может быть пустым";
                    }
                }
            }
        }
    }
}