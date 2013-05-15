using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel = Microsoft.Office.Interop.Excel;

namespace sampleWebApp1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Excel.Application excelApp = new Excel.Application();
            excelApp.Visible = true;
            string workbookPath = "C:/Users/parevi01/Documents/sample1.xlsx";
            Excel.Workbook sampleWorkBook = excelApp.Workbooks.Open(workbookPath, 0, false, 5, "", "",  
                            false, Excel.XlPlatform.xlWindows, "", true, true, 0, true, false, false);


            Excel.Sheets sheets = sampleWorkBook.Worksheets;
            Excel.Worksheet mySheet = (Excel.Worksheet)sheets.get_Item("sheet1");
            Excel.Range myCell = (Excel.Range)mySheet.get_Range("A1", "A1");
            myCell.Value2 = "edited value";



        }
    }
}
