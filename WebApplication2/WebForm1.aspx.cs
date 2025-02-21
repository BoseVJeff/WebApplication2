using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace WebApplication2
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con_student_db"].ConnectionString);
		protected void Page_Load(object sender, EventArgs e)
		{
            if(!Page.IsPostBack)
            {
                //Response.Write("First Load!\n");
                FillGridStudents();
            }
            
		}

        private void FillGridStudents()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Student order by Eno",conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception err)
            {
                Response.Write("Error: " + err.ToString());
            }
            finally
            {
                Response.Write("State of connection: " + conn.State.ToString());
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }

        protected void InsertLinkButton_Click(object sender, EventArgs e)
        {
            try {
                conn.Open();

                string Enr = ((TextBox) GridView1.FooterRow.FindControl("EnoInsertItemTextBox")).Text;
                string Name = ((TextBox) GridView1.FooterRow.FindControl("NameInsertItemTextBox")).Text;
                
                SqlCommand cmd = new SqlCommand("INSERT INTO Student (Eno, \"Name\") values ('" + Enr + "', '" + Name + "')", conn);
                Response.Write(cmd.CommandText);
                cmd.ExecuteNonQuery();
            } catch (Exception err) {
                Response.Write("Error: " + err.ToString());
            } finally {
                if(conn.State==ConnectionState.Open)
                {
                    conn.Close();
                }
            }
            FillGridStudents();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string id = ((Label) row.Cells[0].FindControl("IdLabel")).Text;

            try {
                conn.Open();

                SqlCommand cmd = new SqlCommand("delete from Student where Id=" + id,conn);
                cmd.ExecuteNonQuery();

                
            } finally {
                if(conn.State==ConnectionState.Open)
                {
                    conn.Close();
                }
            }

            FillGridStudents();

            //Response.Write(id);
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.NewSelectedIndex];

            string id = ((Label)row.Cells[0].FindControl("IdLabel")).Text;

            Response.Write("ID: " + id);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillGridStudents();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = - 1;
            FillGridStudents();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string id = ((Label)row.Cells[0].FindControl("IdEditItemLabel")).Text;
            string eno = ((TextBox)row.Cells[1].FindControl("EnoEditItemTextBox")).Text;
            string name= ((TextBox)row.Cells[2].FindControl("NameEditItemTextBox")).Text;

            string q="";

            try {
                conn.Open();

                q = "update student set Eno='" + eno + "', Name='" + name + "' where Id='" + id + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();
            } catch (Exception err)
            {
                Response.Write(q + "\n" + err.ToString());
            }
            finally {
                if(conn.State==ConnectionState.Open)
                {
                    conn.Close();
                }
            }

            GridView1.EditIndex = -1;
            FillGridStudents();

            //Response.Write(name);
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {

        }
    }
}