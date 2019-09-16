<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registered.aspx.cs" Inherits="Registered.Registered" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%;background-color:darkkhaki;">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<style>
    .a {
        margin-left:25px;
    }

</style>
    <script language="javascript">
        function pwStrength(pwd) {

            //空字串強度值為0
            if (pwd == "") document.getElementById("Label1").Text = "請輸入密碼!!";
            //字元統計
            var iNum = 0, iLtt = 0, iSym = 0;
            var c, i;
            for (i = 0; i < pwd.Length; i++)
            {
                if (pwd[i] >= '0' && pwd[i] <= '9') iNum++;
                else if (pwd[i] >= 'a' && pwd[i] <= 'z') iLtt++;
                else if (pwd[i] >= 'A' && pwd[i] <= 'Z') iLtt++;
                else iSym++;
            }
            if (iLtt == 0 && iSym == 0) document.getElementById("Label1").Text = "低強度密碼!!"; //純數字密碼
            else if (iNum == 0 && iLtt == 0) document.getElementById("Label1").Text = "低強度密碼!!"; //純符號密碼
            else if (iNum == 0 && iSym == 0) document.getElementById("Label1").Text = "低強度密碼!!"; //純字母密碼
            else if (pwd.Length <= 6) document.getElementById("Label1").Text = "低強度密碼!!"; //長度不大於6的密碼
            else if (iLtt == 0) document.getElementById("Label1").Text = "中強度密碼!!"; //數字和符號構成的密碼
            else if (iSym == 0) document.getElementById("Label1").Text = "中強度密碼!!"; //數字和字母構成的密碼
            else if (iNum == 0) document.getElementById("Label1").Text = "中強度密碼!!"; //字母和符號構成的密碼
            else if (pwd.Length <= 10) document.getElementById("Label1").Text = "中強度密碼!!"; //長度不大於10的密碼
            else document.getElementById("Label1").Text = "高強度密碼!!";//由數字、字母、符號構成的密碼
            return;

        }

    </script>
</head>

<body style="height:100%;background-color:darkkhaki;">
    <form id="form1" runat="server" style="background-color:darkkhaki">
        <div style="background-color:darkkhaki;height:100%">        
              <h1 style="text-align:center;font-family:標楷體">註冊頁面</h1>
            <div id="left" style="width:30%;float:left;background-color:darkkhaki"><br><br><br><br><br><br></div>
            <div id="mid" style="width:60%;float:left;background-color:darkkhaki">
      
              
            <p style="font-family:標楷體">帳　　號：<asp:TextBox ID="TextBox_account" runat="server"></asp:TextBox></p>
            <p style="font-family:標楷體">密　　碼：<asp:TextBox ID="TextBox_password" runat="server" TextMode="Password" onKeyUp="pwStrength(this.value)" onBlur="pwStrength(this.value)"></asp:TextBox><asp:Label ID="Label1" runat="server" Text="" ></asp:Label></p>
            <p style="font-family:標楷體">確認密碼：<asp:TextBox ID="TextBox_passwordcheck" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBox_password" ControlToValidate="TextBox_passwordcheck" ErrorMessage="確認密碼與密碼不相符" ForeColor="Red" CssClass="a"></asp:CompareValidator>
              
            </p>     
            <p style="font-family:標楷體">姓　　名：<asp:TextBox ID="TextBox_name" runat="server"></asp:TextBox></p>
            <p style="font-family:標楷體">信　　箱：<asp:TextBox ID="TextBox_mail" runat="server"></asp:TextBox>　<asp:Button ID="Button_mail" runat="server" Text="send" OnClick="Button_mail_Click" Width="53px" />
                </p>
            <p style="font-family:標楷體">性　　別：<asp:RadioButton ID="RadioButton1" runat="server" GroupName="sex" Text="男" />

                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="sex" Text="女" />
                </p>
            <p style="font-family:標楷體">電　　話：<asp:TextBox ID="TextBox_phone" runat="server"></asp:TextBox></p>
            
                </div>    
            <div id="right" style="width:10%;float:left;background-color:darkkhaki">
                <h1>&nbsp;&nbsp;</h1>
                <p>&nbsp;&nbsp;</p>
                <p>&nbsp;&nbsp;</p>


            </div>
            <p style="text-align:center;font-family:標楷體">
                <asp:Button ID="Button_submit" runat="server" Text="註　冊" BackColor="Black" Font-Bold="True" Font-Names="標楷體" Font-Size="Large" ForeColor="#CC3300" Height="52px" OnClick="Button_submit_Click" Width="145px" /></p>

            </div>
    </form>
</body>
</html>
