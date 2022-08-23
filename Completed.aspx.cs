using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewOgunCBT
{
    public partial class Completed : System.Web.UI.Page
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
            //string exx = Request.QueryString["CBTID"];
            //if (exx == "")
            //{
            //    Response.Redirect("Login.aspx");
            //}
            
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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OgunTMAS"].ConnectionString);
            con.Open();
            cmd.CommandText = "select * from OgunTCBT where TCBTCode='" + TextBox1.Text + "' and Status='Closed'";
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(ds, "OgunTCBT");

            if (ds.Tables[0].Rows.Count > 0)
            {
                btnPrint.Visible = true;

                Label1.Visible = true;
                Label2.Visible = true;
                Label3.Visible = true;
                Label5.Visible = true;
                Label4.Visible = true;
                Label6.Visible = true;
                Label7.Visible = true;
                Label8.Visible = true;
                Label9.Visible = true;
                Label10.Visible = true;
                Label11.Visible = true;
                Label12.Visible = true;
                Label1.Text = ds.Tables[0].Rows[0]["CName"].ToString();
                Label2.Text = ds.Tables[0].Rows[0]["TCBTCode"].ToString();
                Label3.Text = ds.Tables[0].Rows[0]["ExamDate"].ToString();
                Label4.Text = ds.Tables[0].Rows[0]["LGA"].ToString();
                Label5.Text = ds.Tables[0].Rows[0]["Score"].ToString();
                Label6.Text = ds.Tables[0].Rows[0]["Rating"].ToString();
                TextBox1.Visible = false;
                Button1.Visible = false;
                
            }
            else
            {
                MessageBox("Invalid data!");
                return;
            }
            con.Close();
        }
    }
}