#= require active_admin/base
#= require tinymce


$(document).ready ->
  tinyMCE.init
    mode: 'textareas'
    plugins: "uploadimage"
    theme_advanced_buttons1_add : "separator,forecolor,backcolor"
    theme_advanced_buttons2_add :"bullist,numlist,separator,outdent,indent,undo,redo,link,unlink,anchor,image,uploadimage,cleanup,code"
    theme_advanced_buttons3_add : "hr,removeformat,sub,sup,separator"
    relative_urls: false
    remove_script_host: false
    document_base_url: (if !window.location.origin then window.location.protocol + '//' + window.location.host else window.location.origin) + '/'
  return