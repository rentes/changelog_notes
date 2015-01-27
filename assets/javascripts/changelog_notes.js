/**
 * Utility functions
 */

/* redirects the page with the id of the version selected from the combo-box */
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

/* selects or de-selects all changelog notes check-boxes */
function check_uncheck_all(source) {
    var issues_checkboxes = [];
    var all_issues_checkboxes = document.getElementsByTagName("input");
    for (var i = 0; i < all_issues_checkboxes.length; i++) {
        if (all_issues_checkboxes[i].name.indexOf('issues_check_box') == 0) {
            issues_checkboxes.push(all_issues_checkboxes[i]);
        }
    }
    for(var i in issues_checkboxes) {
        issues_checkboxes[i].checked = source.checked;
    }
}