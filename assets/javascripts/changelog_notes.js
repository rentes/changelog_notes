/**
 * Utility functions
 */

function redirectVersion() {
    var url = document.URL.split("?");
    var selected_version = document.getElementById('version_id').value;
    var parameters = window.location.search.substring(1).split("&");
    if (selected_version != "") {
        window.location = url[0] + '?' + parameters[0] + '&id=' + selected_version;
    }
    else {
        window.location = url[0] + '?' + parameters[0];
    }
}