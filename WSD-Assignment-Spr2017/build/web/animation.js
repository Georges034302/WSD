function handleSelect() {
    var b1 = document.getElementById("box1");
    var f = b1.options[b1.selectedIndex].value;
    var b2 = document.getElementById("box2");
    if (f === "Student") {
        b2.disabled = "disabled";
    } else {
        b2.disabled = "";
    }
}
function startTime() {
    var date = new Date();
    var n = date.toDateString();
    var time = date.toLocaleTimeString();

    document.getElementById('time').innerHTML = n + ' - ' + time;
    tt = display_c();
}
function display_c() {
    var refresh = 1000; 
    mytime = setTimeout('startTime()', refresh);
}
function typeChange() {
  var selectBox = document.getElementById('selectBox');
  var inputBox = document.getElementById('inputBox');
  selectBox.value === 'date' ? inputBox.type = 'date' : inputBox.type = 'text';
}

document.getElementById('inputBox').addEventListener('change', typeChange);
