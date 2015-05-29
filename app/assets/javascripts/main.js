/**
 * Created by studennt_score_system on 15-4-16.
 */

function openNewPage() {
    window.location.href = "landing.html";
}
function openRegisterPage(){
    window.location.href="register.html";
}
function openManagerPage(){
    window.location.href="manager.html"
}
function openSearchPage(){
    window.location.href='search.html'
}
function returnLandingPage(){
    window.location.href='landing.html'
}
function opensiji(){
    window.location.href='siji.html'
}
function openliuji(){
    window.location.href='liuji.html'
}
function showNumber(str)
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            document.getElementById("number").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET","/ajax_number?name="+str,true);
    xmlhttp.send();
}