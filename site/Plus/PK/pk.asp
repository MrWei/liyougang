﻿<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%option explicit%>
<!--#include file="../../Conn.asp"-->
<!--#include file="../../KS_Cls/Kesion.CommonCls.asp"-->
<!--#include file="../../KS_Cls/Kesion.Label.CommonCls.asp"-->
<%
'****************************************************
' Software name:Kesion CMS 5.5
' Email: service@kesion.com . 营销QQ:4000080263  Tel:400-008-0263
' Web: http://www.kesion.com http://www.kesion.cn
' Copyright (C) Kesion Network All Rights Reserved.
'****************************************************
Dim KSCls
Set KSCls = New SiteIndex
KSCls.Kesion()
Set KSCls = Nothing

Class SiteIndex
        Private KS, KSR,str,c_str,ID,Template,categoryname
		Private TotalPut,CurrentPage,MaxPerPage
		Private Sub Class_Initialize()
		 If (Not Response.IsClientConnected)Then
			Response.Clear
			Response.End
		 End If
		  MaxPerPage=20
		  Set KS=New PublicCls
		  Set KSR = New Refresh
		End Sub
        Private Sub Class_Terminate()
		 Call CloseConn()
		 Set KS=Nothing
		End Sub
		Public Sub Kesion()
		   Dim I
		   ID=KS.ChkClng(Request("id"))
		   If ID=0 Then 
		     ks.die "非法参数!"
		   End If
		   Template = KSR.LoadTemplate(KS.Setting(103))
		   FCls.RefreshFolderID = "0" '设置当前刷新目录ID 为"0" 以取得通用标签
		   Call GetSubject()
		   
		   Template=KSR.KSLabelReplaceAll(Template)
		   Response.Write Template  
		End Sub
		
		Sub GetSubject()
		      Dim RS:Set RS=Server.CreateObject("adodb.recordset")
			  RS.Open "select top 1 * from KS_PKZT where id=" & id,conn,1,1
			  If RS.Eof And RS.Bof Then
			    RS.Close
				Set RS=Nothing
				KS.Die "找不到PK主题!"
			  End If
			  Template=replace(template,"{$GetPKID}",rs("id"))
			  if not ks.isnul(rs("title2")) then
			   Template=replace(template,"{$GetPKTitle}",rs("title") &" <font class=""pk"">PK</font> " & rs("title2"))
			  else
			   Template=replace(template,"{$GetPKTitle}",rs("title"))
			  end if
			  If KS.IsNul(rs("newslink")) Then
			  Template=replace(template,"{$GetBackGroundNews}","")
			  Else
			  Template=replace(template,"{$GetBackGroundNews}","<a href='" & rs("newslink") & "' target='_blank'>对比 >></a>")
			  End If
			  Template=replace(template,"{$GetZFTips}",rs("zftips"))
			  Template=replace(template,"{$GetFFTips}",rs("fftips"))
		End Sub
		
End Class
%>
