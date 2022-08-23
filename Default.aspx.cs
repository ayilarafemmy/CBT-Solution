using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Data;

namespace NewOgunCBT
{
    public partial class lol : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["OgunTMAS"].ConnectionString;
        string str;
        SqlCommand com;
        SqlCommand comt;

        SqlCommand cmd = new SqlCommand();
        SqlConnection conx = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        

        protected void Page_Load(object sender, EventArgs e)
        {
           string exx= Request.QueryString["TCodeAcess"];
            if(exx =="")
            {
                Response.Redirect("Login.aspx");
            }
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OgunTMAS"].ConnectionString);
            con.Open();
            cmd.CommandText = "select * from OgunTCBT where TCBTCode='" + exx + "' and Status='Ready'";
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(ds, "OgunTCBT");

            if (ds.Tables[0].Rows.Count > 0)
            {
                Label10.Text = ds.Tables[0].Rows[0]["CName"].ToString();
                Label11.Text = ds.Tables[0].Rows[0]["TCBTCode"].ToString();
                Label15.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            con.Close();

        }
        string insertRecord(string query)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OgunTMAS"].ConnectionString);
            myConnection.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(query, myConnection);
                cmd.ExecuteNonQuery();
                myConnection.Close();
                return "1";
            }
            catch (Exception ex)
            {
                //MessageBox("at INSERT " + ex.Message);
                return "0" + ex.Message;
            }
        }
        void MessageBox(string x)
        {
            // Label1.Text = x;
            try
            {
                string message = x;

                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                sb.Append("<script type = 'text/javascript'>");

                sb.Append("window.onload=function(){");

                sb.Append("alert('");

                sb.Append(message);

                sb.Append("')};");

                sb.Append("</script>");

                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());


            }
            catch (Exception ex)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            Label2.Text = DateTime.Now.AddMinutes(50).ToString("hh:mm:ss");

            //initialize counts of questions
            Panel1.Visible = true;
            Label7.Text = "25";
            Label6.Text = "0";
            Label12.Text = "1";
            Label3.Visible = true;
            Button3.Visible = false;
            Label13.Text = "0";

            //first question goes here
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "SELECT TOP 1 * FROM CBT_New ORDER BY NEWID()";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();

            reader.Read();
            CheckBox1.Text = reader["Opt1"].ToString();
            CheckBox2.Text = reader["Opt2"].ToString();
            CheckBox3.Text = reader["Opt3"].ToString();
            CheckBox4.Text = reader["Opt4"].ToString();
            Label14.Text = reader["Answer"].ToString();
            Label9.Text = reader["Question"].ToString();
            string qq= reader["Qtype"].ToString();
            string im = reader["Imagep"].ToString();
            if (qq=="1")
            {
                Image1.Visible = true;
                Image1.ImageUrl="~/Images//"+im+".jpg";

            }
            else
            {
                Image1.Visible = false;
            }
            reader.Close();
            con.Close();
            Button1.Visible = false;
            Button3.Visible = false;
        }
        protected void Timer1_Tick(object sender, EventArgs e)

        {

            Label1.Text = DateTime.Now.ToString("hh:mm:ss");
            DateTime t1 = Convert.ToDateTime(Label1.Text);
            DateTime t2 = Convert.ToDateTime(Label2.Text);
            TimeSpan ts = t2.Subtract(t1);
            Label3.Text = ts.ToString();
            if (Label3.Text == "00:05:00")
            {
                Label4.Visible = true;
                Label4.Text = "Closing in 5 seconds";
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
            }
            if (Label3.Text=="00:00:00")
            {
                Label16.Text = "0";
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                string fasassi;

                int finscore = int.Parse(Label13.Text);
                int finals = finscore * 4;
                if (finals >= 60)
                {
                    fasassi = "Passed";
                }
                else
                {
                    fasassi = "Failed";
                }
                string finalsccco = finals + "%";
                string inserto = "insert into ExamsDone (CBTID,Phone,FullName,ExamDate,Score,TimeCompleted,Status,Successful) values ('" + Label11.Text + "','" + Label15.Text + "','" + Label10.Text + "','" + DateTime.Now.ToShortDateString() + "','" + finalsccco + "','" + DateTime.Now.ToShortTimeString() + "','Closed','" + fasassi + "')";
                insertRecord(inserto);
                string uuu = "Update OgunTCBT set Score='" + finalsccco + "',Rating='" + fasassi + "',Status='Closed' where TCBTCode='" + Label11.Text + "' and Phone='" + Label15.Text + "' and Status='Ready'";
                insertRecord(uuu);


                MessageBox("Time Up!");

                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "1;url=result.aspx?CBTID=" + Label11.Text + "";
                this.Page.Controls.Add(meta);


            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            //rate current questions and populate label13
            if (CheckBox1.Checked == true && Label14.Text == "A" && CheckBox2.Checked == false && CheckBox3.Checked == false && CheckBox4.Checked == false)
            {
                int now = int.Parse(Label13.Text);
                int neww = now + 1;
                Label13.Text = neww.ToString();

            }
            else if (CheckBox1.Checked == false && Label14.Text == "B" && CheckBox2.Checked == true && CheckBox3.Checked == false && CheckBox4.Checked == false)
            {
                int now = int.Parse(Label13.Text);
                int neww = now + 1;
                Label13.Text = neww.ToString();

            }
            else if (CheckBox1.Checked == false && Label14.Text == "C" && CheckBox2.Checked == false && CheckBox3.Checked == true && CheckBox4.Checked == false)
            {
                int now = int.Parse(Label13.Text);
                int neww = now + 1;
                Label13.Text = neww.ToString();

            }
            else if (CheckBox1.Checked == false && Label14.Text == "D" && CheckBox2.Checked == false && CheckBox3.Checked == false && CheckBox4.Checked == true)
            {
                int now = int.Parse(Label13.Text);
                int neww = now + 1;
                Label13.Text = neww.ToString();

            }


            //update labels 6,7 and 12
            int total = int.Parse(Label7.Text);
            int answered = int.Parse(Label6.Text);

            int nanswered = answered + 1;
            int ntotal = total - 1;

            int qno = int.Parse(Label12.Text);

            int nqno = qno + 1;

            if(ntotal == 1)
            {
                Button2.Visible = false;
                Button3.Visible = true;
                Label7.Text = ntotal.ToString();
                Label6.Text = nanswered.ToString();
                Label12.Text = nqno.ToString();
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                str = "SELECT TOP 1 * FROM CBT_New ORDER BY NEWID()";
                com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();

                reader.Read();
                CheckBox1.Text = reader["Opt1"].ToString();
                CheckBox2.Text = reader["Opt2"].ToString();
                CheckBox3.Text = reader["Opt3"].ToString();
                CheckBox4.Text = reader["Opt4"].ToString();
                Label14.Text = reader["Answer"].ToString();
                Label9.Text = reader["Question"].ToString();
                string qq = reader["Qtype"].ToString();
                string im = reader["Imagep"].ToString();
                if (qq == "1")
                {
                    Image1.Visible = true;
                    Image1.ImageUrl = "~/Images//" + im + ".jpg";

                }
                else
                {
                    Image1.Visible = false;
                }
                reader.Close();
                con.Close();
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
            }
            else
            {
                Label7.Text = ntotal.ToString();
                Label6.Text = nanswered.ToString();
                Label12.Text = nqno.ToString();
                Button2.Visible = true;
                Button3.Visible = false;
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                str = "SELECT TOP 1 * FROM CBT_New ORDER BY NEWID()";
                com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();

                reader.Read();
                CheckBox1.Text = reader["Opt1"].ToString();
                CheckBox2.Text = reader["Opt2"].ToString();
                CheckBox3.Text = reader["Opt3"].ToString();
                CheckBox4.Text = reader["Opt4"].ToString();
                Label14.Text = reader["Answer"].ToString();
                Label9.Text = reader["Question"].ToString();
                string qq = reader["Qtype"].ToString();
                string im = reader["Imagep"].ToString();
                if (qq == "1")
                {
                    Image1.Visible = true;
                    Image1.ImageUrl = "~/Images//" + im + ".jpg";

                }
                else
                {
                    Image1.Visible = false;
                }
                reader.Close();
                con.Close();
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
            }

            //get next question or end show end exam button

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if(Label16.Text=="0")
            {
                Response.Redirect("result.aspx?CBTID=" + Label11.Text + "");
            }
            string ss = Label3.Text.Substring(0, 1);
            if (ss=="-")
            {
                MessageBox("Time Up!");
                HtmlMeta meta1 = new HtmlMeta();
                meta1.HttpEquiv = "Refresh";
                meta1.Content = "1;url=result.aspx?CBTID=" + Label11.Text + "";
                this.Page.Controls.Add(meta1);

            }
            //compute % and end exams - insert score and redirect to result page
            if (CheckBox1.Checked == true && Label14.Text == "A" && CheckBox2.Checked == false && CheckBox3.Checked == false && CheckBox4.Checked == false)
            {
                int now = int.Parse(Label13.Text);
                int neww = now + 1;
                Label13.Text = neww.ToString();

            }
            else if (CheckBox1.Checked == false && Label14.Text == "B" && CheckBox2.Checked == true && CheckBox3.Checked == false && CheckBox4.Checked == false)
            {
                int now = int.Parse(Label13.Text);
                int neww = now + 1;
                Label13.Text = neww.ToString();

            }
            else if (CheckBox1.Checked == false && Label14.Text == "C" && CheckBox2.Checked == false && CheckBox3.Checked == true && CheckBox4.Checked == false)
            {
                int now = int.Parse(Label13.Text);
                int neww = now + 1;
                Label13.Text = neww.ToString();

            }
            else if (CheckBox1.Checked == false && Label14.Text == "D" && CheckBox2.Checked == false && CheckBox3.Checked == false && CheckBox4.Checked == true)
            {
                int now = int.Parse(Label13.Text);
                int neww = now + 1;
                Label13.Text = neww.ToString();

            }
            string fasassi;
            int finscore = int.Parse(Label13.Text);
            int finals = finscore * 4;
            if (finals >= 60)
            {
                fasassi = "Passed";
            }
            else
            {
                fasassi = "Failed";
            }
            string finalsccco = finals + "%";
            string inserto = "insert into ExamsDone (CBTID,Phone,FullName,ExamDate,Score,TimeCompleted,Status,Successful) values ('"+Label11.Text+"','"+Label15.Text+"','"+Label10.Text+"','"+DateTime.Now.ToShortDateString()+"','"+ finalsccco + "','"+DateTime.Now.ToShortTimeString()+"','Closed','"+fasassi+"')";
            insertRecord(inserto);
            string uuu = "Update OgunTCBT set Score='" + finalsccco + "',Rating='" + fasassi + "',Status='Closed' where TCBTCode='" + Label11.Text + "' and Phone='" + Label15.Text + "' and Status='Ready'";
            insertRecord(uuu);

            MessageBox("Exams Completed");
            Response.Redirect("result.aspx?CBTID="+Label11.Text+"");
            //HtmlMeta meta = new HtmlMeta();
            //meta.HttpEquiv = "Refresh";
            //meta.Content = "1;url=result.aspx?CBTID="+Label11.Text+"";
            //this.Page.Controls.Add(meta);



        }
    }
}