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
    public partial class result : System.Web.UI.Page
    {
        string str;
        SqlCommand com;
        SqlCommand comt;

        SqlCommand cmd = new SqlCommand();
        SqlConnection conx = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            string exx = Request.QueryString["CBTID"];
            if (exx == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OgunTMAS"].ConnectionString);
                con.Open();
                cmd.CommandText = "select * from OgunTCBT where TCBTCode='" + exx + "' and Status='Closed' and Score is not Null";
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                sda.Fill(ds, "OgunTCBT");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Panel1.Visible = true;
                    Label1.Text = ds.Tables[0].Rows[0]["CName"].ToString();
                    Label2.Text = ds.Tables[0].Rows[0]["TCBTCode"].ToString();
                    Label3.Text = ds.Tables[0].Rows[0]["LGA"].ToString();
                    Label4.Text = ds.Tables[0].Rows[0]["Rating"].ToString();
                    Label5.Text = ds.Tables[0].Rows[0]["ExamDate"].ToString();
                    Label6.Text = ds.Tables[0].Rows[0]["Score"].ToString();
                    Label7.Text = ds.Tables[0].Rows[0]["Rating"].ToString();
                    if(Label4.Text=="Passed")
                    {
                        Label4.Text = "CONGRATULATIONS!!!";
                        Label4.ForeColor = System.Drawing.Color.Green;
                        Label6.ForeColor = System.Drawing.Color.Green;
                        Label7.ForeColor = System.Drawing.Color.Green;

                    }
                    else
                    {
                        Label4.Text = "NOT SUCCESSFUL THIS TIME";
                        Label4.ForeColor = System.Drawing.Color.Red;
                        Label6.ForeColor = System.Drawing.Color.Red;
                        Label7.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    
                    Response.Redirect("Login.aspx");
                }
                con.Close();
            }
        }
    }
}