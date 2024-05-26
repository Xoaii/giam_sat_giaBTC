using System;
using System.Collections.Generic;

using System.Data.SqlClient;
using System.Data;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace giamsatbitcoin
{
    public partial class api : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //thiết lập chuỗi kết nối với csdl
            string connectionString = "Data Source=127.0.0.1,1443;Initial Catalog=bit;User Id=sa;Password=123;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Sp_Bit", connection))// gọi store procedure
                {
                    command.CommandType = CommandType.StoredProcedure;

                    try
                    {
                        connection.Open();// mở chuỗi kết nối đến csdl
                        object kq = command.ExecuteScalar();//thực hiện sp và trả về dữ liệu( sp này trả về chuỗi json)
                        string json = (string)kq;
                        this.Response.ContentType = "application/json";
                        this.Response.Write(json);
                        Console.Write(json);
                    }
                    catch (Exception ex)
                    {
                        this.Response.ContentType = "application/json";// đặt nd phản hồi thành kiểu json
                        this.Response.Write("{\"ok\":0,\"msg\":\"" + ex.Message + "\"}");
                    }
                }
            }
        }
    }
}