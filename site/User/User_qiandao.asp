<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%option explicit%>
<!--#include file="../Conn.asp"-->
<!--#include file="../KS_Cls/Kesion.MemberCls.asp"-->
<!--#include file="../KS_Cls/Kesion.Label.CommonCls.asp"-->
<!--#include file="../KS_Cls/Kesion.EscapeCls.asp"-->
<%
'******************************************************************
' Software name:KesionCMS X1.0
' Email: service@kesion.com . 营销QQ:4000080263  Tel:400-008-0263
' Web: http://www.kesion.com http://www.kesion.cn
' Copyright (C) Kesion Network All Rights Reserved.
'******************************************************************
Dim KSCls
Set KSCls = New User_ItemSign
KSCls.Kesion()
Set KSCls = Nothing

Class User_ItemSign
        Private KS,KSUser
		Private CurrentPage,totalPut
		Private RS,MaxPerPage
		Private TempStr,SqlStr
		Private Sub Class_Initialize()
		  MaxPerPage =20
		  Set KS=New PublicCls
		  Set KSUser = New UserCls
		End Sub
        Private Sub Class_Terminate()
		 Set KS=Nothing
		 Set KSUser=Nothing
		End Sub
		%>
		<!--#include file="../KS_Cls/UserFunction.asp"-->
		<%
       Public Sub loadMain()
		IF Cbool(KSUser.UserLoginChecked)=false Then
		  Response.Write "<script>top.location.href='Login';</script>"
		  Exit Sub
		End If
		  
		
		dim Action,Rs,Content,qdxq
		if ks.Setting(201)="1" then
			Action=KS.S("Action")
			select case Action
			case "qiandao"
				call dosave()
			case "qiandao_me"
				call qiandao_me()
			case else
				call qdMain()
			end select
		end if	
		
  End Sub
      sub qdMain()
		 Call KSUser.Head()
		 Call KSUser.InnerLocation("签到排行")
		 If KS.S("page") <> "" Then
				CurrentPage = CInt(KS.S("page"))
		 Else
				CurrentPage = 1
		 End If
	    %>
		<% 

			%>
		<div class="tabs">	
			<ul>
				<li class="puton"><a href="User_qiandao.asp">签到排行榜</a></li>
				<li><a href="User_qiandao.asp?Action=qiandao_me">我的签到统计</a></li>
			</ul>
		</div>
		<div style="border:1px solid #CCCCCC; background:#F6F6F6; width:90%; margin:10px; padding-left:10px; height:30px;">
		<span style="color:#006699; font-size:14px;font-weight:bold;">签到统计:</span>
		<%dim day_z:day_z= DateAdd("d",-1,now())%>
		 今天已签到 <%=ks.chkclng(conn.execute("select count(1) from KS_qiandao where Status=0  and year(AddDate)=" & Year(now()) & " and month(AddDate)=" & month(now()) &" and day(AddDate)=" & day(now())  & "")(0))%> 人 | 
		 昨天共签到 <%=ks.chkclng(conn.execute("select count(1) from KS_qiandao where Status=0 and year(AddDate)=" & Year(day_z) & " and month(AddDate)=" & month(day_z) &" and day(AddDate)=" & day(day_z)  & "")(0))%> 人 | 
		 历史总签到 <%=ks.chkclng(conn.execute("select count(1) from KS_qiandao where Status=0 ")(0))%> 人
		</div>
		
		<div style=" background:#F6F6F6; padding-left:15px; height:25px; margin:0px;"><span style=" font-weight:bold; font-size:14px;"> 签到次数排行榜</span></div>
				<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="border">
					<tr class=titlename align=middle>
					  <td width=50 height="25">排名</td>
					   <td width=100>用户名</td>
					  <td width=80>总次数</td>
					  <td width=80>月次数</td>
					  <td width=80>签到心情</td>
					  <td>状态</td>
					</tr>
					<%  
						 SqlStr="Select * From KS_user where qiandao<>0 and Locked=0 order By qiandao desc"
						 Set RS=Server.createobject("adodb.recordset")
						 RS.open SqlStr,conn,1,1
						 If RS.EOF And RS.BOF Then
								  Response.Write "<tr class='tdbg'><td align=center height=25 colspan=9 valign=top>找不到您要的记录!</td></tr>"
								 Else
								 totalPut = RS.RecordCount
						
								If CurrentPage>1 and (CurrentPage - 1) * MaxPerPage < totalPut Then
										RS.Move (CurrentPage - 1) * MaxPerPage
								End If
								Call ShowContent
				End If

						
						 %>
					
          </table>
		  </td>
		  </tr>
</table>
		  <%
		  Call KS.ShowPage(totalput, MaxPerPage, "", CurrentPage,false,true)%>
		 
		<%
		
	  end sub
	  
	  sub qiandao_me()
	  	
		 Call KSUser.Head()
		 Call KSUser.InnerLocation("我的签到统计")
		 If KS.S("page") <> "" Then
				CurrentPage = CInt(KS.S("page"))
		 Else
				CurrentPage = 1
		 End If
	    %>
		<% 

			%>
		<div class="tabs">	
			<ul>
				<li ><a href="User_qiandao.asp">签到排行榜</a></li>
				<li class="puton"><a href="User_qiandao.asp?Action=qiandao_me">我的签到统计</a></li>
			</ul>
		</div>
	
		
				<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="border">
					<tr class=titlename align=middle>
					  <td  width="30%"height="25">签到时间</td>
					   <td width="10%">签到心情</td>
					  <td width="40%">签到内容</td>
					  <td width="20%">签到状态</td>
					</tr>
					<%  
						 SqlStr="Select * From KS_qiandao where username='" & ksuser.username &"'  order By adddate desc"
						 Set RS=Server.createobject("adodb.recordset")
						 RS.open SqlStr,conn,1,1
						 If RS.EOF And RS.BOF Then
								  Response.Write "<tr class='tdbg'><td align=center height=25 colspan=9 valign=top>找不到您要的记录!</td></tr>"
								 Else
								 totalPut = RS.RecordCount
						
									If CurrentPage < 1 Then CurrentPage = 1
								
			
								If CurrentPage<1 and (CurrentPage - 1) * MaxPerPage < totalPut Then
										RS.Move (CurrentPage - 1) * MaxPerPage
								End If
								Call ShowContent_me
				End If

						
						 %>		
</table>
		  <%
		  Call KS.ShowPage(totalput, MaxPerPage, "", CurrentPage,false,true)%>
		 
		<%
		
	  end sub
	  
	  sub dosave()
	   	   if not conn.execute("select top 1 username from KS_qiandao where username='" & ksuser.username &"' and year(AddDate)=year(" & SqlNowString & ") and month(AddDate)=month(" & SqlNowString &") and day(AddDate)=day(" & SqlNowString & ") ").eof then
		    Response.Write("qiandaook")
			Response.end()
		   end if
		   dim LastQDSJ,Content
		   Content=KS.CheckXSS(LEFT(replace(KS.DelSQL(UnEscape(Request("qdContent"))),"'",""),255))
			Set RS=Server.CreateObject("ADODB.RECORDSET")
			RS.Open "Select top 1 * From KS_qiandao",conn,1,3
			RS.AddNew
			rs("Content")=Content
			rs("qdxq")=KS.ChkClng(KS.G("qdxq"))
			rs("AddDate")=now()
			rs("username")=ksuser.username
			rs("UserIP")=ks.getip
			rs("Status")=0								
			RS.Update
			RS.close
			Set RS = Nothing
			dim ii,Date_ii
			dim day_ks:day_ks=conn.execute("select top 1 adddate from KS_qiandao where username='" & ksuser.username &"' order by adddate")(0)
			dim days:days=ks.chkclng(conn.execute("select count(1) from KS_qiandao where username='" & ksuser.username &"' and Status=0")(0))
			conn.execute("update KS_user set qiandao="& days &" where username='" & ksuser.username &"'")
			if conn.execute("select count(1) from KS_qiandao where  year(AddDate)=year(" & SqlNowString & ") and month(AddDate)=month(" & SqlNowString &") ")(0)=0 then 
				conn.execute("update KS_user set qiandao_m=0 ")'清空签到月次数
			end if
			conn.execute("update KS_user set qiandao_m=qiandao_m+1 where username='" & ksuser.username &"'")	
			
			if conn.execute("select count(1) from KS_qiandao where  username='" & ksuser.username &"' and year(AddDate)=year(" & SqlNowString & ") and month(AddDate)=month(" & SqlNowString &")  and day(AddDate)=day(" & SqlNowString & ") ")(0)=0 then 
				conn.execute("update KS_user set qqiandao_xqco='' where username='" & ksuser.username &"'")'清空签到今日心情内容
			end if
			conn.execute("update KS_user set qiandao_xqco='"& KS.ChkClng(KS.G("qdxq")) &"|1|1|"& Content &"|1|1|" & CStr(now()) &"' where username='" & ksuser.username &"'")	
			
			dim Score:Score= KS.ChkClng(ks.Setting(202))
			dim lxdays:lxdays=KS.ChkClng(ks.Setting(203))
            dim lxscore:lxscore=KS.ChkClng(ks.Setting(204))
			if lxdays>0 then
			   if (days mod lxdays=0) then
					'连续签到增加积分
					Call KS.ScoreInOrOut(KSUser.UserName,1,lxscore,"system","连续签到" & lxdays & "天得分！",0,0)
			   end if
			end if
			Response.Write("qiandao-o-k")
			'增加积分
			Call KS.ScoreInOrOut(KSUser.UserName,1,Score,"system",now & "签到得分！",0,0)
			Response.end()
	  end sub
	
	 Sub ShowContent()
	 
     Dim I,intotalmoney,outtotalmoney,Page_s,qdxq,RSkc,Content,adddate,qiandao_xqco,qiandao_dateend,qdnow
	 Page_s=(CurrentPage-1)* MaxPerPage
     Do While Not rs.eof 
		qdnow=0 : qdxq=0 :Content=""
		qiandao_xqco= Split(rs("qiandao_xqco")&"","|1|1|")
	 	if Ubound(qiandao_xqco)>1 then
			qiandao_dateend=CDate(qiandao_xqco(2))
			if year(qiandao_dateend)= year(now()) and  month(qiandao_dateend)=month(now()) and  day(qiandao_dateend)=day(now()) then
	 			qdxq=qiandao_xqco(0)
				Content=qiandao_xqco(1)
				qdnow=1
			end if
		end if
	%>
    <tr class=tdbg onMouseOver="this.className='tdbgmouseover'" onMouseOut="this.className='tdbg'">
	  
      <td  class="splittd" align=middle><%=Page_s+i+1%></td>
      <td  class="splittd" align=middle ><%=rs("username")%></td>
	  <td  class="splittd" align=middle ><%=rs("qiandao")%></td>
	  <td  class="splittd" align=middle ><%=conn.execute("select count(1) from KS_qiandao where  username='" & rs("username") &"' and year(AddDate)=year(" & SqlNowString & ") and month(AddDate)=month(" & SqlNowString &") ")(0)%></td>
      <td   class="splittd" align=middle width=60><%	  
	  %>
	  <img src="/images/emot/<%=qdxq%>.gif"  style="border:1px solid  #ccc;width:24px;height:24px;">
	  </td>
      <td class="splittd" align=middle>
	    <%
			if qdnow=1 then Response.Write("<font color=""green"">今天已签到</font>") else Response.Write("<font color=""#FF0000"">今天未签到</font>")
		   %>
	
	   
	   </td>
    </tr>
	 <tr>
		<td colspan="5"  class="splittd"  align="left" style="background:#F5F5F5; line-height:25px;" > 
		<span style="color:#333; font-size:12px;font-weight:bold; padding-left:15px; color:#006699">我今天想说: <font color="#333"><%=Content%></font></span>
		</td>
	</tr>
	<%
	            
				I = I + 1
				RS.MoveNext
				If I >= MaxPerPage Then Exit Do

	 loop
	%>
  
		<%
		End Sub
		
		 Sub ShowContent_me()
			 Dim I,intotalmoney,outtotalmoney,Page_s,qdxq,RSkc,Content,adddate,qiandao_xqco,qiandao_dateend,qdnow
			 Do While Not rs.eof 
			%>
			<tr class=tdbg onMouseOver="this.className='tdbgmouseover'" onMouseOut="this.className='tdbg'">
			  
			  <td  class="splittd" align=middle><%=rs("adddate")%></td>
			  <td  class="splittd" align=middle ><img src="/images/emot/<%=rs("qdxq")%>.gif"  style="border:1px solid  #ccc;width:24px;height:24px;"></td>
			  <td  class="splittd" align=middle ><%=rs("Content")%></td>
			  <td  class="splittd" align=middle >
			 <% if KS.ChkClng(rs("Status"))=0 then Response.Write("<font color=""green"">已签到</font>") else Response.Write("<font color=""#FF0000"">未签到</font>")%>	  
			  </td>
			  </tr>
			<%
						
						I = I + 1
						RS.MoveNext
						If I >= MaxPerPage Then Exit Do
		
			 loop
			%>
		<%
		End Sub
	  
End Class
%> 
