using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
//using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace NewOgunCBT
{
    public partial class Login : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection conx = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        public static SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToString("yyyy-MM-dd");
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
        string insertRecord(string query)
        {
          SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OgunTMAS"].ConnectionString);
            //con = new SqlConnection(ConfigurationManager.AppSettings["OgunTMAS"].ToString());

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                con.Close();
                return "1";

            }
            catch (Exception ex)
            {
                //MessageBox("at INSERT " + ex.Message);
                // UploadStatusLabel.Text = ex.Message;
                return "0" + ex.Message;
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
         SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OgunTMAS"].ConnectionString);
           // con = new SqlConnection(ConfigurationManager.AppSettings["OgunTMAS"].ToString());
            con.Open();
            cmd.CommandText = "select * from OgunTCBT where TCBTCode='" + TextBox3.Text + "' and Phone='" + TextBox2.Text + "' and Status='Paid'";
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(ds, "OgunTCBT");

            if (ds.Tables[0].Rows.Count > 0)
            {
                string examdate = ds.Tables[0].Rows[0]["ExamDate"].ToString();
                Label2.Visible = true;
                Label2.Text = "Your Scheduled date is " + examdate + "";
                if (examdate != Label1.Text)
                {
                    MessageBox("Kindly Verify Scheduled Date");
                    return;
                }
                else
                {
                    string update = "Update OgunTCBT set Status='Ready' where TCBTCode='" + TextBox3.Text + "' and Phone='" + TextBox2.Text + "' and Status='Paid'";
                    insertRecord(update);
                    HtmlMeta meta = new HtmlMeta();
                    meta.HttpEquiv = "Refresh";
                    meta.Content = "0;url=Default.aspx?TCodeAcess=" + TextBox3.Text + "";
                    this.Page.Controls.Add(meta);
                }
            }
            else
            {
                MessageBox("The combination of Exam Access Code and Phone Number entered is not correct, try again");
                return;
            }
            con.Close();
        }
    }
}