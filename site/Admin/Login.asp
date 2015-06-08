<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%option explicit%>
<!--#include file="../Conn.asp"-->
<!--#include file="../Plus/md5.asp"-->
<!--#include file="../KS_Cls/Kesion.CommonCls.asp"-->
<%
'******************************************************************
' Software name:KesionCMS X1.0
' Email: service@kesion.com . 营销QQ:4000080263  Tel:400-008-0263
' Web: http://www.kesion.com http://www.kesion.cn
' Copyright (C) Kesion Network All Rights Reserved.
'******************************************************************


'---ShowVerifyCode_s---
 Const ShowVerifyCode= False    '后台登录是否启用验证码 true 启用 false不启用
'---ShowVerifyCode_e---


Dim KS:Set KS=New PublicCls
Dim Num
'Num=GetBackGroundNum
Function GetBackGroundNum()
	on error resume next
	Dim FsoObj:Set FsoObj = KS.InitialObject(KS.Setting(99))
	Dim FolderObj:Set FolderObj = FsoObj.GetFolder(Server.MapPath("images/login/background"))
	Dim FileObj:Set FileObj = FolderObj.Files
	Dim FsoItem,Num:Num=0
	For Each FsoItem In FileObj
	 if instr(lcase(FsoItem.name),".jpg")<>0 then Num=Num+1
	Next
	Set FSOObj=Nothing
	Set FileObj=Nothing
	if err then
	 err.clear
	 Num=8
	end if
	GetBackGroundNum=Num
End Function
randomize
%>
<!DOCTYPE html>
<html>
<head>
<title><%=KS.Setting(0) & "---网站后台管理"%> X<%=GetVer%></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="Include/SoftKeyBoard.js"></script>
<script src="../ks_inc/jquery.js"></script>
<script src="../ks_inc/common.js"></script>
<!--[if IE 6]>
<script src="../js/iepng.js" ></script>
<script >
   EvPNG.fix('div, ul, img, li, input'); 
</script>
<![endif]-->
<script type="text/javascript">

$(function(){
	//$("body").append("<div id='main_bg'/>");
	//$("#main_bg").append("<img width='100%' height='100%' id='sub' src='Images/login/background/body<%=INT((Num-1+1)*RND+1)%>.jpg' id='bigpic'>");
	cover();
	$(window).resize(function(){
		cover();
	});
	if (!-[1,]){ //IE
	    if (!-[1,]&&!window.XMLHttpRequest){
		  $.dialog.alert('您当前使用的浏览器版本太低，建议升级到更高版本的浏览器！',function(){});
		}
		$("#sub").hover(   
				function() {   
				$("#sub").stop().animate({opacity: '1'},1000);   
		   },    
		 function() {   
			   $("#sub").stop().animate({opacity: '0.5'},1000);   
		 });  
	 } 
	
});
function cover(){
	var win_width = $(window).width();
	var win_height = $(window).height();
	$("#bigpic").attr({width:win_width,height:win_height});
   $("#wrap").attr("style","position:absolute;left:"+(win_width-510)/2+"px");
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<style type="text/css">
	html{color:#000;font-family:Arial,sans-serif;font-size:12px;}
	h1, h2, h3, h4, h5, h6, h7, p, ul, ol,div,span, dl, dt, dd, li, body,em,i, form, input,i,cite, button, img, cite, strong,    em,label,fieldset,pre,code,blockquote,    table, td, th ,tr{ padding:0; margin:0;outline:0 none;}
	img, table, td, th ,tr { border:0;}
	address,caption,cite,code,dfn,em,th,var{font-style:normal;font-weight:normal;}
	select,img,select{font-size:12px;vertical-align:middle;color:#666; font-family:Arial,sans-serif}
	.checkbox{vertical-align:middle;margin-right:5px;margin-top:-2px; margin-bottom:1px;}
	textarea{font-size:12px;color:#666; font-family:Arial,sans-serif}
	table{ border-collapse:collapse;border-spacing:0;}
	ul, ol, li { list-style-type:none;}
	a { color:#0082cb; text-decoration:none;}
	a:hover{text-decoration:none;}
	ul:after,.clearfix:after { content: "."; display: block; height: 0; clear: both; visibility: hidden; }/* 不适合用clear时使用 */
	ul,.clearfix{ zoom:1;}
	.clear{clear:both;font-size:0px; line-height:0px;height:1px;overflow:hidden;}/*  空白占位  */
	body {font-size:12px;color:#666; height:100%;background:#404751;}
	#wrap{position:absolute;top:10%;padding-top:100px;width:510px;}
	.indexmain{width:510px;margin:0px auto;}
	.indexmain .left{width:70px; float:left}
	.indexmain .left ul li{ height:75px; text-align:center; background:url(Images/login/bg01.png);}
	.indexmain .left ul li img{margin-top:20px}
	.indexmain .left ul li.curr{ background:url(Images/login/bg04.png);}
	<% 
	  dim Height:Height=0
	  if ShowVerifyCode=false and EnableSiteManageCode=false then
	   Height=120
	  ElseIf ShowVerifyCode=false or EnableSiteManageCode=false Then
	   Height=60
	  End If
	%>
	.indexmain .left ul li.li03{ height:<%=240-height%>px; overflow:hidden}
	.indexmain .right{width:430px; height:<%=390-height%>px; overflow:hidden; float:left; background:url(Images/login/bg04.png); padding-left:5px; font-family:simhei}
	.tabbox ul{margin-top:10px;}
	.tabbox li{padding:3px 0px 5px; position:relative;}
	.tabbox li.btn{padding-top:10px;padding-left:98px;}
	.tabbox label{font-size:14px;color:#666; font-family:simhei; line-height:44px;} 
	.tabbox .input,.tabbox .textinput{width:235px; height:24px; padding:10px 0px 10px 11px;line-height:20px; font-family:Arial, Helvetica, sans-serif;color:#666;border:0px; background:url(Images/login/bg05.png) no-repeat;font-size:12px;}
	.tabbox .input,.tabbox .textinput:hover{ background:url(Images/login/bg06.png) no-repeat}
	.tabbox .input,.tabbox .textinput2{width:106px; height:24px; padding:10px 0px 10px 11px;line-height:20px; font-family:Arial, Helvetica, sans-serif;color:#666;border:0px; background:url(Images/login/bg09.png) no-repeat;font-size:13px;}
	.tabbox .input,.tabbox .textinput2:hover{ background:url(Images/login/bg10.png) no-repeat}
	.regsubmit{width:110px;height:32px;margin-left:5px;border:0px none; background:url(Images/login/bg07.png); cursor:pointer;font-size:15px;font-family:"\5FAE\8F6F\96C5\9ED1";color:#fff;margin-top:5px;}
	.regsubmit:hover{background:url(Images/login/bg08.png)}
	.rzm{margin-left:30px;font-size:12px;line-height:25px;color:#999999}
	.rzm span{color:#CC0000;}
	.foot{margin:0px auto;margin-top:10px;text-align:center;line-height:24px;color:#fff; font-family:"\5FAE\8F6F\96C5\9ED1";font-size:12px;}
	.foot a{color:#fff;}
	.foot a:visited{ color:#fff;}
</style>
</head>
<body style="overflow:hidden" scroll="no">
<div id="wrap">
<%
Select Case  KS.G("Action")
 Case "LoginCheck"
  Call CheckLogin()
 Case "LoginOut"
  Call LoginOut()
 Case Else
  Call CheckSetting()
  Call Main()
End Select

Sub CheckSetting()
     dim strDir,strAdminDir,InstallDir
	 strDir=Trim(request.ServerVariables("SCRIPT_NAME"))
	 strAdminDir=split(strDir,"/")(Ubound(split(strDir,"/"))-1) & "/"
	 InstallDir=left(strDir,instr(lcase(strDir),"/"&Lcase(strAdminDir)))
			
	If Instr(UCASE(InstallDir),"/W3SVC")<>0 Then
	   InstallDir=Left(InstallDir,Instr(InstallDir,"/W3SVC"))
	End If
 If KS.Setting(2)<>KS.GetAutoDoMain or KS.Setting(3)<>InstallDir Then
	
  Dim RS:Set RS=Server.CreateObject("ADODB.RECORDSET")
  RS.Open "Select Setting From KS_Config",conn,1,3
  Dim SetArr,SetStr,I
  SetArr=Split(RS(0),"^%^")
  For I=0 To Ubound(SetArr)
   If I=0 Then 
    SetStr=SetArr(0)
   ElseIf I=2 Then
    SetStr=SetStr & "^%^" & KS.GetAutoDomain
   ElseIf I=3 Then
    SetStr=SetStr & "^%^" & InstallDir
   Else
    SetStr=SetStr & "^%^" & SetArr(I)
   End If
  Next
  RS(0)=SetStr
  RS.Update
  RS.Close:Set RS=Nothing
  Call KS.DelCahe(KS.SiteSn & "_Config")
  Call KS.DelCahe(KS.SiteSn & "_Date")
 End If
End Sub

Sub Main()
%>
<table width="100%" border="0" align="center"  style="margin:0 auto;">
 <FORM ACTION="Login.asp?Action=LoginCheck" method="post" name="LoginForm" onSubmit="return(CheckForm(this))">
<tr>
 <td>
 	<div id="step_1" class="indexmain">
		<div class="left">
			<ul>
				<li><a href="/" onFocus="this.blur()"><img src="Images/login/bg002.png" style="margin:25px 0px 0px 0px" /></a></li>
				<li class="curr"><a href="#" onFocus="this.blur()"><img src="Images/login/bg03.png" /></a></li>
				<li class="li03">&nbsp;</li>
			</ul>
		</div>
		<div class="right">
				<h2 style="font-size:21px;margin:20px 0px 20px 28px;_margin-top:10px; font-family:simhei"><span style="color:#ee9043; padding-right:5px; font-family:Arial, Helvetica, sans-serif;">KesionCMS<b style="vertical-align:super;font-weight:normal; ">&reg;</b></span>网站后台管理系统 X<%=GetVer%></h2>
					<div class="tabbox">
						<ul id="regSpan" class="companyul">
							<li style="z-index:1000">
								<div class="label">
									<label for="email" style="padding-left:28px; float:left">登录账号：</label><input type="text" name="UserName" id="UserName" class="textinput" tabindex="1" autocomplete="off" />
								</div>
							</li>
							<li>
								<div class="label">
									<label for="password" style="padding-left:28px; float:left">登录密码：</label><%IF KS.Setting(98)<>"1" Then%><input type="password" tabindex="2" name="PWD" id="PWD" class="textinput" /><%Else%><input name="PWD" type="password" onFocus="this.select();" onChange="Calc.password.value=this.value;" onClick="password1=this;showkeyboard();this.readOnly=1;Calc.password.value=''" onKeyDown="Calc.password.value=this.value;" maxlength="50" class="textinput" tabindex="2" readonly /><%End If%>

								</div>
								
							</li>
						  <%If ShowVerifyCode Then%>
							<li>
								<div class="label">
									<label for="Verifycode" style="padding-left:28px; float:left">验证字符：</label><input type="text" id="Verifycode" name="Verifycode" tabindex="3" class="textinput2" maxlength="4" style="width:111px;" /><img id="imagecode" src="../plus/verifycode.asp?time=0.001" width="120" height="30" onClick="$(this).attr('src',$(this).attr('src')+Math.random());" title="点击刷新验证码" style="cursor:pointer;vertical-align:middle;*position:absolute;margin-top:-5px;*+margin-top:3px;_margin-top:3px"/>
								</div>
							</li>
						 <%End If%>	
						 <%if EnableSiteManageCode = True Then%>
							<li>
								<div class="label">
									<label for="password2" style="padding-left:28px; float:left">认证密码：</label><input type="password" id="AdminLoginCode" name="AdminLoginCode" tabindex="4" class="textinput" value="" />
								</div>
							</li>
							<%if SiteManageCode="8888" Then%>
							<li class="rzm">
								提示：原始认证密码为<span>8888</span>，为了安全请打开conn.asp修改.版本X<%=GetVersion%>
							</li>
							<%end if%>
						<%end if%>
							
							<li class="btn" id="nextStep">
							  <input type="submit" tabindex="5" class="regsubmit" value="管理员登录">
							</li>
						</ul>
					</div>
		</div>
	</div>
 </td>
</tr>
</FORM>
</table>
<script >
<!--
$(document).ready(function() { 
	$(".label").hover(function(){$(this).removeClass("label");$(this).addClass("labelhover");
	},function(){
	$(this).removeClass("labelhover");$(this).addClass("label");});
});

setTimeout(function(){$("#UserName").focus();},500); 

function CheckForm(ObjForm) {
  if(ObjForm.UserName.value == '') {
    $.dialog.alert('请输入管理账号！',function(){ObjForm.UserName.focus();});
    return false;
  }
  if(ObjForm.PWD.value == '') {
    $.dialog.alert('请输入授权密码！',function(){ObjForm.PWD.focus();});
    return false;
  }
  if (ObjForm.PWD.value.length<6)
  {
   $.dialog.alert('授权密码不能少于六位！',function(){ObjForm.PWD.focus();});
    return false;
  }
  <%If ShowVerifyCode Then%>
  if (ObjForm.Verifycode.value == '') {
    alert ('请输入验证字符！');
    ObjForm.Verifycode.focus();
    return false;
  }
  <%End If%>
  <%if EnableSiteManageCode = True Then%>
  if (ObjForm.AdminLoginCode.value == '') {
    $.dialog.alert('请输入后台管理认证密码！',function(){ObjForm.AdminLoginCode.focus();});
    return false;
  }
  <%End If%>
}
//-->
</script>

<div class="foot">
	<p>漳州科兴信息技术有限公司 Copyright &copy;2006-<%=year(now)%> <a href="http://www.kesion.com" target="_blank"> www.kesion.com</a>,All Rights Reserved. </p>
</div>
<br/><br/><br/>
</div>
</body>
</html>
<%End Sub
Sub CheckLogin()
  Dim PWD,UserName,LoginRS,SqlStr,RndPassword
  Dim ScriptName,AdminLoginCode
  AdminLoginCode=KS.G("AdminLoginCode")
  IF lcase(Trim(Request.Form("Verifycode")))<>lcase(Trim(Session("Verifycode"))) And ShowVerifyCode then 
   Call KS.Echo("<script>$.dialog.alert('<br/>登录失败:验证码有误，请重新输入！',function(){history.back();});</script>")
   exit Sub
  end if
  If EnableSiteManageCode = True And AdminLoginCode <> SiteManageCode Then
   Call KS.Echo("<script>$.dialog.alert('<br/>登录失败:您输入的后台管理认证码不对，请重新输入！',function(){history.back();});</script>")
   exit Sub
  End If
  Pwd =MD5(KS.R(KS.S("pwd")),16)

  UserName = KS.R(trim(KS.S("username")))
  RndPassword=KS.R(KS.MakeRandomChar(20))
  ScriptName=KS.R(Trim(Request.ServerVariables("HTTP_REFERER")))
  Set LoginRS = Server.CreateObject("ADODB.RecordSet")
  SqlStr = "select top 1 a.*,b.PowerList,b.ModelPower,B.[Type],B.Role,B.ManageOtherDoc from KS_Admin a inner join KS_UserGroup b on a.GroupID=b.ID where a.UserName='" & UserName & "'"
  LoginRS.Open SqlStr,Conn,1,3
  If LoginRS.EOF AND LoginRS.BOF Then
	  Call KS.InsertLog(UserName,0,ScriptName,"输入了错误的帐号!")
      Call KS.Die("<script>$.dialog.alert('<br/>登录失败:您输入了错误的帐号，请再次输入！',function(){history.back();});</script>")
  Else
  
     IF LoginRS("PassWord")=pwd THEN
       IF Cint(LoginRS("Locked"))=1 Then
         Call KS.Die("<script>$.dialog.alert('<br/>登录失败:您的账号已被管理员锁定，请与您的系统管理员联系！',function(){history.back();});</script>")
	   Else
		  	 '登录成功，进行前台验证，并更新数据
			   on error resume next 
			  Dim UserRS:Set UserRS=Server.CreateObject("Adodb.Recordset")
			  UserRS.Open "Select top 1 * From KS_User Where UserName='" & LoginRS("PrUserName") & "' and GroupID=1",Conn,1,3
			  IF Not UserRS.Eof Then
			  
						If datediff("n",UserRS("LastLoginTime"),now)>=KS.Setting(36) then '判断时间
						UserRS("Score")=UserRS("Score")+KS.Setting(37)
						end if
					 UserRS("LastLoginIP") = KS.GetIP
					 UserRS("LastLoginTime") = Now()
					 UserRS("LoginTimes") = UserRS("LoginTimes") + 1
					 UserRS("RndPassWord") = RndPassWord
					 UserRS("IsOnline")=1
					 UserRS.Update	
			 if err then
			   ks.die "<script>$.dialog.alert(""登录失败！<br/><strong>失败原因：</strong> " & err.description &""",function(){history.back();});</script>"
			   err.clear
			 end if	
	
					'置前台会员登录状态
                    If EnabledSubDomain Then
							Response.Cookies(KS.SiteSn).domain=RootDomain					
					Else
                            Response.Cookies(KS.SiteSn).path = "/"
					End If		
					 Response.Cookies(KS.SiteSn)("UserID") = UserRS("UserID")
					 Response.Cookies(KS.SiteSn)("UserName") = KS.R(UserRS("UserName"))
			         Response.Cookies(KS.SiteSn)("Password") = UserRS("Password")
					 Response.Cookies(KS.SiteSn)("RndPassword") = KS.R(UserRS("RndPassword"))
					 Response.Cookies(KS.SiteSn)("AdminLoginCode") = AdminLoginCode
					 Response.Cookies(KS.SiteSn)("AdminID") =  LoginRS("AdminID")
					 Response.Cookies(KS.SiteSn)("AdminName") =  UserName
					 Response.Cookies(KS.SiteSn)("AdminPass") = pwd
					 If LoginRS("Type")=3 Then
					 Response.Cookies(KS.SiteSn)("SuperTF")   = 1
					 Else
					 Response.Cookies(KS.SiteSn)("SuperTF")   = 0
					 End If
					 If LoginRS("SuperTF")=1 Or  LoginRS("Type")=3 Then   '记录管理员角色
					 Response.Cookies(KS.SiteSn)("Role") = 3
					 Else
					 Response.Cookies(KS.SiteSn)("Role") = LoginRS("Role")
					 End IF
					 Response.Cookies(KS.SiteSn)("ManageOtherDoc") = KS.ChkClng(LoginRS("ManageOtherDoc"))
					 Response.Cookies(KS.SiteSn)("GroupID") = LoginRS("GroupID")
					 Response.Cookies(KS.SiteSn)("PowerList") = LoginRS("PowerList")
					 Response.Cookies(KS.SiteSn)("ModelPower") = LoginRS("ModelPower")
					 'Response.Cookies(KS.SiteSn).Expires = DateAdd("h", 3, Now())   '3小时没有操作自动失败
             Else 
				   Call KS.InsertLog(UserName,0,ScriptName,"找不到前台账号!")
                   Call KS.Die("<script>$.dialog.alert('<br/>登录失败:找不到前台账号！',function(){history.back();});</script>")
			 End If
			   UserRS.Close:Set UserRS=Nothing
			   
	  LoginRS("LastLoginTime")=Now
	  LoginRS("LastLoginIP")=KS.GetIP
	  LoginRS("LoginTimes")=LoginRS("LoginTimes")+1
	  LoginRS.UpDate
	  Call KS.InsertLog(UserName,1,ScriptName,"成功登录后台系统!")
      Call KS.Die("<script>$.dialog.tips('<br/><span style=""font-size:14px;color:#888;font-weight:bold""><img src=""images/succeed.gif"" align=""absmiddle""/> 恭喜，成功登录<span style=""color:#ff6600"">[" & KS.Setting(0) & "]</span>网站后台系统！</span>',2);setTimeout(""top.location.href='index.asp'"",2000);</script>")
	End IF
  ELse
     If EnabledSubDomain Then
		Response.Cookies(KS.SiteSn).domain=RootDomain					
	 Else
        Response.Cookies(KS.SiteSn).path = "/"
	End If
	Response.Cookies(KS.SiteSn)("AdminID") =""
    Response.Cookies(KS.SiteSn)("AdminName")=""
	Response.Cookies(KS.SiteSn)("AdminPass")=""
	Response.Cookies(KS.SiteSn)("SuperTF")=""
	Response.Cookies(KS.SiteSn)("AdminLoginCode")=""
	Response.Cookies(KS.SiteSn)("PowerList")=""
	Response.Cookies(KS.SiteSn)("ModelPower")=""
	Call KS.InsertLog(UserName,0,ScriptName,"输入了错误的口令:" & Request.form("pwd"))
    Call KS.Die("<script>$.dialog.alert('<br/>登录失败:您输入了错误的口令，请再次输入！',function(){history.back();});</script>")
  END IF
 End If
END Sub
Sub LoginOut()
		   Conn.Execute("Update KS_Admin Set LastLogoutTime=" & SqlNowString & " where UserName='" & KS.R(KS.C("AdminName")) &"'")
		   Dim AdminDir:AdminDir=KS.Setting(89)
		   If EnabledSubDomain Then
				Response.Cookies(KS.SiteSn).domain=RootDomain					
			Else
                Response.Cookies(KS.SiteSn).path = "/"
			End If
			Response.Cookies(KS.SiteSn)("Role")=""
			Response.Cookies(KS.SiteSn)("PowerList")=""
			Response.Cookies(KS.SiteSn)("AdminID") =""
			Response.Cookies(KS.SiteSn)("AdminName")=""
			Response.Cookies(KS.SiteSn)("AdminPass")=""
			Response.Cookies(KS.SiteSn)("SuperTF")=""
			Response.Cookies(KS.SiteSn)("AdminLoginCode")=""
			Response.Cookies(KS.SiteSn)("ModelPower")=""
			session.Abandon()
			Response.Write ("<script> top.location.href='" & KS.Setting(2) & KS.Setting(3) &"';</script>")
End Sub
Set KS=Nothing
%>
