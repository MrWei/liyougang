﻿<%
'******************************************************************
' Software name:KesionCMS X1.0
' Email: service@kesion.com . 营销QQ:4000080263  Tel:400-008-0263
' Web: http://www.kesion.com http://www.kesion.cn
' Copyright (C) Kesion Network All Rights Reserved.
'******************************************************************
'-----------------------------------------------------------------------------------------------
'科汛网站管理系统,通用刷新类
'开发:林文仲 版本 V 6.0
'-----------------------------------------------------------------------------------------------
Dim ShCls:Set ShCls=New RefreshSearchCls
Class RefreshSearchCls
		Private KS  
		Private Sub Class_Initialize()
		  Set KS=New PublicCls
		End Sub
        Private Sub Class_Terminate()
		 Set KS=Nothing
		 Set ShCls=Nothing
		End Sub
		
		'替换网站的所有搜索
		Function Run(byVal tag)
		 tag=Lcase(tag)
		 if tag="getsearchbydate" then
		   Run=GetSearchByDate()
		 elseif tag="getsearch" then
		   Run=GetSearch()
		 else
			 If not IsObject(Application(KS.SiteSN&"_ChannelConfig")) Then KS.LoadChannelConfig
				Dim ModelXML,Node
				Set ModelXML=Application(KS.SiteSN&"_ChannelConfig")
				For Each Node In ModelXML.DocumentElement.SelectNodes("channel")
					if tag=lcase("get" & Node.SelectSingleNode("@ks10").text & "search") then
					  run="<script src=""" & KS.Setting(3) & KS.Setting(93) & "S_" & Node.SelectSingleNode("@ks10").text & ".js""></script>"
					end if
				Next
		 end if
		End Function
		
		'取得高级日历搜索
		Function GetSearchByDate()
		     dim str:str="<link href=""" &KS.GetDomain &"ks_inc/calendar/calendar.css"" rel=""stylesheet"" />"&vbcrlf
		     str=str &"<script src=""" &KS.GetDomain &"ks_inc/calendar/jquery.easyui.min.js""></script>"
             str=str &"<script>" &vbcrlf
             str=str &"       $(function () { "&vbcrlf
			 str=str &"              $('#calendar').calendar({" &vbcrlf
             str=str &"               onSelect: function (date) {" &vbcrlf
             str=str &"               location.href = '" &KS.GetDomain &"plus/search/?m=1&stype=100&key=' + date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();" &vbcrlf
             str=str &"               }"&vbcrlf
             str=str &"           });"&vbcrlf
             str=str &"       });"&vbcrlf
             str=str &"   </script>"&vbcrlf
			 str=str &"<div id=""calendar"" style=""width:180px;height:180px;""></div> "
         GetSearchByDate=str
		End Function
		'取得总搜索
		Function GetSearch()
			   GetSearch = "<form id=""SearchForm"" name=""SearchForm"" method=""Get"" action=""" & KS.Setting(3) &"plus/search/"">" & vbCrLf
			   GetSearch = GetSearch & "<div class=""searchsd"">" & vbCrLf
			   GetSearch = GetSearch & " <input name=""key"" type=""text"" class=""textbox"" value=""请输入关键字"" onblur=""if(this.value=='') {this.style.color='#999';this.value='请输入关键字';}"" onfocus=""if(this.value=='请输入关键字'){this.value='';}else{this.style.color='#000';}"" /><span>" & vbCrLf
			   GetSearch = GetSearch & "<select style=""width:80px;"" name=""m"">" & vbCrLf
			   GetSearch = GetSearch & "<option value=""0"">全部</option>" & vbCrLf 
			   If not IsObject(Application(KS.SiteSN&"_ChannelConfig")) Then KS.LoadChannelConfig
				Dim ModelXML,Node
				Set ModelXML=Application(KS.SiteSN&"_ChannelConfig")
				For Each Node In ModelXML.DocumentElement.SelectNodes("channel")
			     if Node.SelectSingleNode("@ks21").text="1" and Node.SelectSingleNode("@ks0").text<>"6" and Node.SelectSingleNode("@ks0").text<>"9" and Node.SelectSingleNode("@ks0").text<>"10" Then
				 GetSearch = GetSearch & "<option value=""" &Node.SelectSingleNode("@ks0").text & """>" & Node.SelectSingleNode("@ks3").text & "</option>" & vbCrLf
				 End If
				Next

			   GetSearch = GetSearch & "</select>" & vbCrLf 
			   GetSearch = GetSearch & "<input type=""image"" class=""inputButton"" name=""Submit1"" src=""" & KS.GetDomain & "images/btn.gif"" align=""absmiddle"" />" & vbCrLf
			   GetSearch = GetSearch & "</span>" & vbCrLf
			   GetSearch = GetSearch & "</div>" & vbCrLf
			   GetSearch = GetSearch & "</form>" & vbCrLf
		End Function

End Class
%> 
