var GetRandomn = 1;
function GetRandom(n){GetRandomn=Math.floor(Math.random()*n+1)}
 var a29=new Array();
var t29=new Array();
var ts29=new Array();
a29[0]="<span onclick=\"addHits29(0,24)\"><a href=\"http://www.kesion.com\" target=\"_blank\"><img  alt=\"KESIONCMS X1\"  border=\"0\"  height=80  width=998  src=\"/images/cmsbanner.png\"></a></span>";
t29[0]=0;
ts29[0]="2014-6-19";
var temp29=new Array();
var k=0;
for(var i=0;i<a29.length;i++){
if (t29[i]==1){
if (checkDate29(ts29[i])){
	temp29[k++]=a29[i];
}
	}else{
 temp29[k++]=a29[i];
}
}
if (temp29.length>0){
GetRandom(temp29.length);
document.write(a29[GetRandomn-1]);
}
function addHits29(c,id){if(c==1){try{jQuery.getScript('http://192.168.0.10:95/plus/ajaxs.asp?action=HitsGuangGao&id='+id,function(){});}catch(e){}}}
function checkDate29(date_arr){
 var date=new Date();
 date_arr=date_arr.split("-");
var year=parseInt(date_arr[0]);
var month=parseInt(date_arr[1])-1;
var day=0;
if (date_arr[2].indexOf(" ")!=-1)
day=parseInt(date_arr[2].split(" ")[0]);
else
day=parseInt(date_arr[2]);
var date1=new Date(year,month,day);
if(date.valueOf()>date1.valueOf())
 return false;
else
 return true
}
