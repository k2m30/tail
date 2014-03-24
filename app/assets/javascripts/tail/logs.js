// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.onreadystatechange = function () {
    if (document.readyState == "interactive") {
        initApplication();
    }
}

function initApplication(){
    var appended = false, up_arrow = document.querySelector("#up");

    onscroll = function () {
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;

        if (scrollTop < -5) {
            console.log('scrolled', scrollTop, appended);
            var old_value = parseInt(getPageVar('n'));
            var new_value = (old_value * 1.1).toFixed();

            var query = location.pathname + 'grep' + location.search.replace('n=' + old_value, 'n=' + new_value);
//            sendRequest(query, false)
            console.log('scrolled', query);
        }
        if (scrollTop > 500) {
            if (!appended) {
                up_arrow.hidden = false;
                appended = true;
            }
        } else {
            if (appended) {
                up_arrow.hidden = true;
                appended = false;
            }
        }
    };

}

function getPageVar(sVar) {
    return decodeURI(window.location.search.replace(new RegExp("^(?:.*[&\\?]" + encodeURI(sVar).replace(/[\.\+\*]/g, "\\$&") + "(?:\\=([^&]*))?)?.*$", "i"), "$1"));
}

function getGrep(text) {
    var sign;
    if (location.search == "") sign = "?"; else sign = "&";
    var search = sign + 'query=' + text;
    var query = location.pathname + 'grep' + location.search + search;
    sendRequest(query, true)
}

function sendRequest(url, isGoToBottom) {
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
        document.getElementById('main').innerHTML = httpRequest.responseText;
        if (isGoToBottom) {
            window.scrollTo(0, document.body.scrollHeight);
        }
    };
    httpRequest.send();
    return true;
}


