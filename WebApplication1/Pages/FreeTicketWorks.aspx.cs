using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services.Description;

namespace WebApplication1
{
    public partial class FreeTicketWorks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Создание массива временных значений
                List<DateTime> timeList = new List<DateTime>();
                DateTime startTime = DateTime.Parse("10:00");
                DateTime endTime = DateTime.Parse("20:30");

                while (startTime <= endTime)
                {
                    timeList.Add(startTime);
                    startTime = startTime.AddMinutes(30);
                }

                // Заполнение DropDownList
                DropDownList1.DataSource = timeList;
                DropDownList1.DataTextFormatString = "{0:HH:mm}";
                DropDownList1.DataBind();


                Session.Clear();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_passage"] = this.GridView1.SelectedValue;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Session["Date"] = this.Calendar1.SelectedDate;
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_Guide"] = this.RadioButtonList1.SelectedValue;
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_event"] = this.RadioButtonList2.SelectedValue;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Time"] = Convert.ToString(this.DropDownList1.SelectedItem.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Базовые параметры
            string ID_event = (string)Session["ID_event"];
            string ID_guide = (string)Session["ID_Guide"];
            DateTime date = (DateTime)Session["Date"];
            string time = (string)Session["Time"];

            // Строка подключения.Ссылка на БД SQL Server
            string connectionString = @"Data Source=SUPERCILIOUSME\SQLEXPRESS; Initial Catalog=MuseumDB; 
            Persist Security Info=True; User ID=test; Password=***********; Trusted_Connection = true;";
            var connect = new SqlConnection(connectionString);

            // Открытие подключения
            connect.Open();

            // SQL запрос на количество строк в таблице
            string count = "SELECT TOP 1 [ID_passage] FROM [MuseumDB].[dbo].[Passage] ORDER BY [ID_passage] DESC";

            // Выполнение запроса
            var mycom = new SqlCommand();
            mycom.CommandText = count;
            mycom.Connection = connect;

            // Cчитывание результата
            SqlDataReader myread = mycom.ExecuteReader();

            if (myread.Read())
            {
                int ID_passage = Convert.ToInt16(myread.GetValue(0)) +1;
                
                myread.Close();

                // Запрос на добавление новой записи в таблицу
                string insert =  $"INSERT INTO [Passage] VALUES ({ID_passage}, {ID_event}, {ID_guide}, '{date}', '{time}')";

                // Выполнение запроса
                SqlCommand cmd = new SqlCommand("Create_new_passage", connect);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@ID_passage", ID_passage));
                cmd.Parameters.Add(new SqlParameter("@ID_event", ID_event));
                cmd.Parameters.Add(new SqlParameter("@ID_guide", ID_guide));
                cmd.Parameters.Add(new SqlParameter("@Event_date", date));
                cmd.Parameters.Add(new SqlParameter("@Event_time", time));
                cmd.ExecuteNonQuery();
            }
            connect.Close();
            Response.Redirect("FreeTicketWorks.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Чтение поля и запись базовых параметров
                string ID_passage, amount;
                ID_passage = Convert.ToString(Session["ID_passage"]);
                amount = Convert.ToString(TextBox1.Text);

                // Строка подключения.Ссылка на БД SQL Server
                string connectionString = @"Data Source=SUPERCILIOUSME\SQLEXPRESS; Initial Catalog=MuseumDB; 
                Persist Security Info=True; User ID=test; Password=***********; Trusted_Connection = true;";
                var connect = new SqlConnection(connectionString);

                // Открытие подключения
                connect.Open();

                // Выполнение запроса
                SqlCommand cmd = new SqlCommand("Create_free_tickets", connect);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@ID_passage", ID_passage));
                cmd.Parameters.Add(new SqlParameter("@amount_of_string", amount));
                cmd.ExecuteNonQuery();

                connect.Close();
                Response.Redirect("FreeTicketWorks.aspx");
            }
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Чтение поля и запись базовых параметров
                string ID_passage, amount;
                ID_passage = Convert.ToString(Session["ID_passage"]);
                amount = Convert.ToString(TextBox2.Text);

                // Строка подключения.Ссылка на БД SQL Server
                string connectionString = @"Data Source=SUPERCILIOUSME\SQLEXPRESS; Initial Catalog=MuseumDB; 
                Persist Security Info=True; User ID=test; Password=***********; Trusted_Connection = true;";
                var connect = new SqlConnection(connectionString);

                // Открытие подключения
                connect.Open();

                // Выполнение запроса
                SqlCommand cmd = new SqlCommand("Delete_free_tickets", connect);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@ID_passage", ID_passage));
                cmd.Parameters.Add(new SqlParameter("@amount", amount));
                cmd.ExecuteNonQuery();

                connect.Close();
                Response.Redirect("FreeTicketWorks.aspx");
            }
        }
    }
}