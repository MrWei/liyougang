﻿document.writeln('<table width=\"98%\" border=\"0\" align=\"center\">')
document.writeln('<form id=\"SearchForm\" onsubmit=\"return false\" name=\"SearchForm\" method=\"get\" action=\"/item/index.asp\">')
document.writeln('  <tr>')
document.writeln('    <td align=\"center\"><select name=\"t\" id=\"m_t\">')
document.writeln('        <option value=\"1\">标 题</option>')
document.writeln('        <option value=\"7\">简 介</option>')
document.writeln('        <option value=\"2\">内 容</option>')
document.writeln('        <option value=\"3\">作 者</option>')
document.writeln('        <option value=\"4\">录入者</option>')
document.writeln('        <option value=\"5\">关键字</option>')
document.writeln('        <option value=\"8\">发布时间</option>')
document.writeln('      </select>')
document.writeln('        <select name=\"tid\" id=\"m_tid\" style=\"width:150px\">')
document.writeln('          <option value=\"0\" selected=\"selected\">所有栏目</option>')
document.writeln('<option value=\'664\'>新闻频道 </option><option value=\'664:690\'>──国内 </option><option value=\'664:689\'>──国际 </option><option value=\'664:688\'>──社会 </option><option value=\'664:684\'>──经济 </option><option value=\'664:683\'>──文化 </option><option value=\'664:682\'>──娱乐 </option><option value=\'664:680\'>──教育 </option><option value=\'664:679\'>──健康 </option><option value=\'664:678\'>──生活 </option><option value=\'664:675\'>──视频 </option><option value=\'664:674\'>──房产 </option><option value=\'664:1202\'>──财经 </option><option value=\':1209\'>──动漫资讯 </option><option value=\'832\'>帮助中心 </option><option value=\'832:833\'>──新手指南 </option><option value=\'832:838\'>──如何付款 </option><option value=\'832:837\'>──配送指南 </option><option value=\'832:836\'>──帮助中心 </option><option value=\'832:835\'>──会员服务 </option><option value=\'832:834\'>──网站信息 </option><option value=\'1237\'>关于我们 </option>        </select>')
document.writeln('        <input name=\"key\" type=\"text\" id=\"m_key\" class=\"textbox\"  value=\"关键字\" onfocus=\"this.select();\"/>')
document.writeln('        <input name=\"ChannelID\" id=\"m_id\" value=\"1\" type=\"hidden\" />')
document.writeln('        <input type=\"button\" onclick=\"turnsearch()\" class=\"inputButton\" name=\"sbtn\" value=\"搜 索\" /></td>')
document.writeln('  </tr>')
document.writeln('</form>')
document.writeln('</table>')
function turnsearch(){location.href='http://localhost/item/index.asp?c-'+$('#m_id').val()+',tid-'+$('#m_tid').val()+',t-'+$('#m_t').val()+',key-'+$('#m_key').val()+'.html';}
$(document).ready(function() { $(document).keydown(function(e) { if (e.keyCode==13){ turnsearch();} }); });
