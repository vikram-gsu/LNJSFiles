using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Excel = Microsoft.Office.Interop.Excel;

namespace testApplication1
{
    public partial class testPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Console.WriteLine(hifType.Value);
            String typeValue = hifType.Value;
            String modelValue = hifModel.Value;
            String previousDate = hifPrevDate.Value;
            String currentDate = hifCurrentDate.Value;
            previousDate = "20130502";
            previousDate = "20130503";
            String tableType="";
            //if ((typeValue=="Scores") && (modelValue=="Risk View"))
            //{
                tableType = "rvscores";
           // }

            DataSet dsMonth = new DataSet();
            ConnectionStringSettings cs;
            cs = ConfigurationManager.ConnectionStrings["DQConnectionString"];
            String connString = cs.ConnectionString;
            SqlConnection dbConnection = new SqlConnection(connString);
            String query;
            query = "SCORES_COMPARE_SCRIPT";
            
            SqlCommand dbCommand = new SqlCommand(query, dbConnection);
            dbCommand.CommandType = CommandType.StoredProcedure;
            
            dbCommand.Parameters.Add(new SqlParameter("@previous", previousDate));
            dbCommand.Parameters.Add(new SqlParameter("@current", currentDate));
            dbCommand.Parameters.Add(new SqlParameter("@model", tableType));

            dbConnection.Open();
            try
            {
                dbCommand.ExecuteNonQuery();
            }
            catch (SqlException)
            {


            }
            finally
            {

                dbConnection.Close();
                Excel.Application excelApp = new Excel.Application();
                excelApp.Visible = true;
                string workbookPath = "C:\\Users\\parevi01\\Documents\\LexisNexis\\Compare_Reports_v03.xlsx";
                Excel.Workbook sampleWorkBook = excelApp.Workbooks.Open(workbookPath, 0, false, 5, "", "",
                                false, Excel.XlPlatform.xlWindows, "", true, true, 0, true, false, false);

                sampleWorkBook.RefreshAll();

                System.Threading.Thread.Sleep(2000);
                sampleWorkBook.Save();
                System.Threading.Thread.Sleep(2000);
                excelApp.Workbooks.Close();
                excelApp.Quit();

            }
           
    
        }
    }
}
