// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function getGrep(text) {
    var sign;
    if (location.search == "") sign = "?"; else sign = "&";
    var query = location.pathname + 'grep' + location.search + sign + 'query=' + text;
    console.log(text=='');
    sendRequest(query)
}

function sendRequest(url) {
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
        httpRequest = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE
        try {
            httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
            try {
                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e) {
            }
        }
    }
    if (!httpRequest) {
        return false;
    }
    httpRequest.open("GET", url);
    httpRequest.onreadystatechange = function () {
        if (httpRequest.readyState != 4 || httpRequest.status != 200) return;
//        console.log("Success: " + httpRequest.responseText);
        document.getElementById('main').innerHTML = httpRequest.responseText;
        window.scrollTo(0, document.body.scrollHeight);
    };
    httpRequest.send();
    return true;
}


