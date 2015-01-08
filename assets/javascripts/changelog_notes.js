/**
 * Utility functions
 */

function redirectVersion() {
    var url = document.URL.split("?");
    var selected_resource_id = document.getElementById('version_id').value;
    var query = window.location.search.substring(1);
    var parameters = query.split("&");
    var params = parameters[0] + '&id=' + selected_resource_id;
    window.location = url[0] + '?' + params;
}