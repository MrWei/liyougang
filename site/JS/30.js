var GetRandomn = 1;
function GetRandom(n){GetRandomn=Math.floor(Math.random()*n+1)}
 var a30=new Array();
var t30=new Array();
var ts30=new Array();
a30[0]="<span onclick=\"addHits30(0,25)\"><a href=\"http://www.kesion.com/e\" target=\"_blank\"><img  alt=\"科汛网校\"  border=\"0\"  height=30  width=998  src=\"/images/wxbanner.gif\"></a></span>";
t30[0]=0;
ts30[0]="2014-6-19";
var temp30=new Array();
var k=0;
for(var i=0;i<a30.length;i++){
if (t30[i]==1){
if (checkDate30(ts30[i])){
	temp30[k++]=a30[i];
}
	}else{
 temp30[k++]=a30[i];
}
}
if (temp30.length>0){
GetRandom(temp30.length);
document.write(a30[GetRandomn-1]);
}
function addHits30(c,id){if(c==1){try{jQuery.getScript('http://192.168.0.10:95/plus/ajaxs.asp?action=HitsGuangGao&id='+id,function(){});}catch(e){}}}
function checkDate30(date_arr){
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
