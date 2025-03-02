/* global top, self */

//Active Login 
$(document).ready(function () {
    $("#Login-div").hide();
    $("#Login-Tab").click(function () {
        $("#Login-div").toggle();
    });
});

//reload iframe
function reload() {
    document.getElementById('Display-frame').src += 'default.jsp';
}

//Select view
$(function () {
    $("#Register-Tab").click(function () {
        $("#Display-frame").attr("src", "register.jsp");
    });
    $("#Search-Tab").click(function () {
        $("#Display-frame").attr("src", "search.jsp");
    });
    $("#Login-Tab").click(function () {
        $("#Display-frame").attr("src", "login.jsp");
    });
    $("#Default-Tab").click(function () {
        $("#Display-frame").attr("src", "default.jsp");
    });
    $("#Results-Tab").click(function () {
        $("#Display-frame").attr("src", "results.jsp");
    });
    $("#View-Tab").click(function () {
        $("#Display-frame").attr("src", "movies.jsp");
    });
    $("#Myaccount-Tab").click(function () {
        $("#Display-frame").attr("src", "edit_user.jsp");
    });
});


//Bind iframe to sources
$('#myNavbar').bind('show', function (e) {
    paneID = $(e.target).attr('href');
    src = $(paneID).attr('data-src');
    // if the iframe hasn't already been loaded once
    if ($(paneID + " iframe").attr("src") === "")
    {
        $(paneID + " iframe").attr("src", src);
    }
});


