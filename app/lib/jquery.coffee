# FIXME: this isn't really the ember way

jQuery.ajaxSetup
  dataType: 'application/json'
  xhrFields:
    withCredentials: true
  crossDomain: true
