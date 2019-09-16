using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NPOI.HSSF.UserModel;
using NPOI.HPSF;
using NPOI.HSSF;
using NPOI.POIFS.FileSystem;
using System.Data;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System.Net;

namespace Registered
{
    public partial class Registered : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["password"] = "";
            if (IsPostBack)
            {
                Session["password"] = TextBox_password.Text;
                TextBox_password.Text = "321";
            }
        }

       

        protected void TextBox_password_TextChanged(object sender, EventArgs e)
        {
            //空字串強度值為0
            if (TextBox_password.Text == "") Label1.Text = "請輸入密碼!!";
            //字元統計
            int iNum = 0, iLtt = 0, iSym = 0;
            foreach (char c in TextBox_password.Text)
            {
                if (c >= '0' && c <= '9') iNum++;
                else if (c >= 'a' && c <= 'z') iLtt++;
                else if (c >= 'A' && c <= 'Z') iLtt++;
                else iSym++;
            }
            if (iLtt == 0 && iSym == 0) Label1.Text = "低強度密碼!!"; //純數字密碼
            else if (iNum == 0 && iLtt == 0) Label1.Text = "低強度密碼!!"; //純符號密碼
            else if (iNum == 0 && iSym == 0) Label1.Text = "低強度密碼!!"; //純字母密碼
            else if (TextBox_password.Text.Length <= 6) Label1.Text = "低強度密碼!!"; //長度不大於6的密碼
            else if (iLtt == 0) Label1.Text = "中強度密碼!!"; //數字和符號構成的密碼
            else if (iSym == 0) Label1.Text = "中強度密碼!!"; //數字和字母構成的密碼
            else if (iNum == 0) Label1.Text = "中強度密碼!!"; //字母和符號構成的密碼
            else if (TextBox_password.Text.Length <= 10) Label1.Text = "中強度密碼!!"; //長度不大於10的密碼
            else Label1.Text = "高強度密碼!!";//由數字、字母、符號構成的密碼
            //TextBox_password.Text = Session["password"].ToString().Trim();
        }

        protected void Button_submit_Click(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            data.Columns.Add("帳號");
            data.Columns.Add("密碼");
            data.Columns.Add("姓名");
            data.Columns.Add("信箱");
            data.Columns.Add("性別");
            data.Columns.Add("電話");

            DataRow row = data.NewRow();
            row[0] = TextBox_account.Text.ToString().Trim();
            row[1] = TextBox_password.Text.ToString().Trim();
            row[2] = TextBox_name.Text.ToString().Trim();
            row[3] = TextBox_mail.Text.ToString().Trim();
            if (RadioButton1.Checked)
            {
                row[4] = "男";
            }
            else if (RadioButton2.Checked)
                row[4] = "女";
            else
                row[4] = "";
            row[5] = TextBox_phone.Text.ToString().Trim();
            data.Rows.Add(row);


            IWorkbook wb = new XSSFWorkbook();
            ISheet ws = wb.CreateSheet("Class");

            ws.CreateRow(0);

            for (int i = 0; i < data.Columns.Count; i++)
                ws.GetRow(0).CreateCell(i).SetCellValue(data.Columns[i].ColumnName.Trim());

            ws.CreateRow(1);
            for (int j = 0; j < data.Columns.Count; j++)
            {
                ws.GetRow(1).CreateCell(j).SetCellValue(data.Rows[0].ItemArray[j].ToString().Trim());
            }



            FileStream file = new FileStream(@"C:\Users\Ni\Desktop\註冊資料.xlsx", FileMode.Create);//產生檔案
            wb.Write(file);
            file.Close();
        }

        protected void Button_mail_Click(object sender, EventArgs e)
        {
            MailMessage message = new MailMessage("steven.ni@bestyield.com", TextBox_mail.Text, "Email Test", "HELLO!");
            message.IsBodyHtml = true;
            
            SmtpClient SMTP = new SmtpClient("smtp.bestyield.com");
            SMTP.Credentials = new NetworkCredential("steven.ni@bestyield.com", "rr29080323rr");
            SMTP.Send(message);
        }

        
    }
}