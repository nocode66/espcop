(function() { this.JST || (this.JST = {}); this.JST["active_admin/editor/templates/toolbar"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<div id="',  id ,'" class="toolbar">\n  <ul>\n    <li><a data-wysihtml5-action="change_view">Source</a></li>\n    <li><a data-wysihtml5-command="bold" title="Bold">Bold</a></li>\n    <li><a data-wysihtml5-command="italic" title="Italic">Italic</a></li>\n    <li><a data-wysihtml5-command="createLink" title="Link">Link</a></li>\n    <li><a data-wysihtml5-command="insertImage" class="insertImage" title="Image">Image</a></li>\n    <li><a data-wysihtml5-command="insertUnorderedList" title="Unordered list">Bulleted List</a></li>\n    <li><a data-wysihtml5-command="insertOrderedList" title="Ordered list">Numbered List</a></li>\n    <li><a data-wysihtml5-command="indent" title="Indent">Indent</a></li>\n    <li><a data-wysihtml5-command="outdent" title="Outdent">Outdent</a></li>\n    <li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h1">h1</a></li>\n    <li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h2">h2</a></li>\n    <li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h3">h3</a></li>\n  </ul>\n\n  <div class="dialog" data-wysihtml5-dialog="createLink" style="display: none;">\n    <div class="action-group">\n      <a href="#" data-wysihtml5-dialog-action="save" class="button">OK</a>\n      <a href="#" data-wysihtml5-dialog-action="cancel">Cancel</a>\n    </div>\n    <label>\n      Link:\n      <input class="uploadable" type="text" data-wysihtml5-dialog-field="href" value="http://">\n    </label>\n    <div style="clear: both;"></div>\n  </div>\n\n  <div class="dialog" data-wysihtml5-dialog="insertImage" style="display: none;">\n    <div class="action-group">\n      <a href="#" data-wysihtml5-dialog-action="save" class="button">OK</a>\n      <a href="#" data-wysihtml5-dialog-action="cancel">Cancel</a>\n    </div>\n    <label>\n      Image URL:\n      <input class="uploadable" type="text" data-wysihtml5-dialog-field="src" value="http://" id="image_url">\n    </label>\n    <label>\n      Align:\n      <select data-wysihtml5-dialog-field="className">\n        <option value="">default</option>\n        <option value="wysiwyg-float-left">left</option>\n        <option value="wysiwyg-float-right">right</option>\n      </select>\n    </label>\n    <div style="clear: both;"></div>\n  </div>\n  \n</div>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["active_admin/editor/templates/uploader"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<div class="upload">\n  or\n  <input type="file" />\n  <img src="',  spinner ,'" class="spinner"></img>\n</div>\n<div style="clear: both;"></div>\n');}return __p.join('');};
}).call(this);

;(function(window, wysihtml5) {
  window.AA = (window.AA || {})
  var config

  var Editor = function(options, el) {
    config          = options
    var _this       = this
    this.$el        = $(el)
    this.$textarea  = this.$el.find('textarea')
    this.policy     = this.$el.data('policy')

    this._addToolbar()
    this._attachEditor()
  }

  /**
   * Returns the wysihtml5 editor instance for this editor.
   */
  Editor.prototype.editor = function() {
    return this._editor
  }

  /**
   * Adds the wysihtml5 toolbar. If uploads are enabled, also adds the
   * necessary file inputs for uploading.
   */
  Editor.prototype._addToolbar = function() {
    var template = JST['active_admin/editor/templates/toolbar']({
      id: this.$el.attr('id') + '-toolbar'
    })

    this.$toolbar = $(template)

    if (config.uploads_enabled) {
      var _this = this
      this.$toolbar.find('input.uploadable').each(function() {
        _this._addUploader(this)
      })
    }

    this.$el.find('.wrap').prepend(this.$toolbar)
  }

  /**
   * Adds a file input attached to the supplied text input. And upload is
   * triggered if the source of the input is changed.
   *
   * @input Text input to attach a file input to. 
   */
  Editor.prototype._addUploader = function(input) {
    var $input = $(input)

    var template = JST['active_admin/editor/templates/uploader']({ spinner: config.spinner })
    var $uploader = $(template)

    var $dialog = $input.closest('[data-wysihtml5-dialog]')
    $dialog.append($uploader)

    var _this = this
    $uploader.find('input:file').on('change', function() {
      var file = this.files[0]
      if (file) {
        $input.val('')
        _this.upload(file, function(location) {
          $input.val(location)
        })
      }
    })
  }

  /**
   * Initializes the wysihtml5 editor for the textarea.
   */
  Editor.prototype._attachEditor = function() {
    this._editor = new wysihtml5.Editor(this.$textarea.attr('id'), {
      toolbar: this.$toolbar.attr('id'),
      stylesheets: config.stylesheets,
      parserRules: config.parserRules
    })
  }

  /**
   * Sets the internal uploading state to true or false. Adds the .uploading
   * class to the root element for stying.
   *
   * @uploading {Boolean} Whether or not something is being uploaded.
   */
  Editor.prototype._uploading = function(uploading) {
    this.__uploading = uploading
    this.$el.toggleClass('uploading', this.__uploading)
    return this.__uploading
  }

  /**
   * Uploads a file to S3. When the upload is complete, calls callback with the
   * location of the uploaded file.
   *
   * @file The file to upload
   * @callback A function to be called when the upload completes.
   */
  Editor.prototype.upload = function(file, callback) {
    var _this = this
    _this._uploading(true)

    var xhr = new XMLHttpRequest()
      , fd = new FormData()
      , key = config.storage_dir + '/' + Date.now().toString() + '-' + file.name

    fd.append('key', key)
    fd.append('AWSAccessKeyId', config.aws_access_key_id)
    fd.append('acl', 'public-read')
    fd.append('policy', this.policy.document)
    fd.append('signature', this.policy.signature)
    fd.append('Content-Type', file.type)
    fd.append('file', file)

    xhr.upload.addEventListener('progress', function(e) {
      _this.loaded   = e.loaded
      _this.total    = e.total
      _this.progress = e.loaded / e.total
    }, false)

    xhr.onreadystatechange = function() {
      if (xhr.readyState != 4) { return }
      _this._uploading(false)
      if (xhr.status == 204) {
        callback(xhr.getResponseHeader('Location'))
      } else {
        alert('Failed to upload file. Have you configured S3 properly?')
      }
    }

    xhr.open('POST', 'https://' + config.s3_bucket + '.s3.amazonaws.com', true)
    xhr.send(fd)

    return xhr
  }

  window.AA.Editor = Editor
})(window, wysihtml5)

;(function(window, $) {
  if ($.widget) {
    $.widget.bridge('editor', window.AA.Editor)
  }
})(window, jQuery)
;
