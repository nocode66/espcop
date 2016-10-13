(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Growlyflash = (function() {
    var _titleize, h;

    function Growlyflash() {}

    Growlyflash.debug = false;

    Growlyflash.defaults = {
      align: 'right',
      delay: 4000,
      dismiss: true,
      spacing: 10,
      target: 'body',
      title: false,
      type: null,
      "class": ['alert', 'growlyflash', 'fade'],
      before_show: function() {
        return this.el.css(this.calc_css_position());
      }
    };

    Growlyflash.KEY_MAPPING = {
      alert: 'warning',
      error: 'danger',
      notice: 'info',
      success: 'success'
    };

    Growlyflash.DISMISS = "<button type=\"close\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>";

    _titleize = function(s) {
      return s.replace(/^./, function(m) {
        return m.toUpperCase();
      });
    };

    h = Growlyflash.helpers = {
      dismiss: function() {
        return Growlyflash.DISMISS;
      },
      title: function(s) {
        return "<strong>" + (_titleize(s)) + "!</strong> ";
      }
    };

    Growlyflash.FlashStruct = (function() {
      FlashStruct.prototype.toString = function() {
        var obj;
        return JSON.stringify((
          obj = {},
          obj["" + this.msg] = this.key,
          obj
        ));
      };

      function FlashStruct(msg1, key) {
        this.msg = msg1;
        this.key = key;
        this.type = Growlyflash.KEY_MAPPING[this.key];
      }

      return FlashStruct;

    })();

    Growlyflash.Alert = (function() {
      var _add, _top;

      _add = function(orig, add) {
        return this.splice(-(~this.indexOf(orig)), 0, orig + "-" + add);
      };

      _top = function(e) {
        return parseInt(($(e)).css('top'));
      };

      function Alert(flash1, opts) {
        var before_show, delay, dismiss, html, ref, target, title;
        this.flash = flash1;
        this.opts = opts;
        this.close = bind(this.close, this);
        this.show = bind(this.show, this);
        ref = this.opts, title = ref.title, target = ref.target, dismiss = ref.dismiss, delay = ref.delay, before_show = ref.before_show;
        html = "";
        if (dismiss) {
          html += h.dismiss();
        }
        if (title && (this.opts.type != null)) {
          html += h.title(this.opts.type);
        }
        html += this.flash.msg;
        this.el = $('<div>', {
          html: html,
          "class": this.class_list().join(' '),
          role: "alert"
        });
        this.el = this.el.appendTo($(target));
        if (before_show != null) {
          before_show.call(this);
        }
        if (Growlyflash.debug) {
          console.debug(this.flash);
        }
        this.show();
        if (delay) {
          setTimeout(this.close, this.opts.delay);
        }
      }

      Alert.prototype.class_list = function() {
        var add, list;
        list = [].concat(this.opts["class"]);
        add = _add.bind(list);
        if (this.opts.dismiss) {
          add('alert', "dismissable");
        }
        if (this.opts.type != null) {
          add('alert', this.opts.type);
        }
        if (this.opts.align != null) {
          add('growlyflash', this.opts.align);
        }
        return list;
      };

      Alert.prototype.show = function() {
        return this.el.toggleClass('in', true);
      };

      Alert.prototype.close = function() {
        return this.el.fadeOut((function(_this) {
          return function() {
            return _this.el.remove();
          };
        })(this));
      };

      Alert.prototype.calc_top_offset = function(arg) {
        var amount, spacing;
        spacing = arg.spacing;
        amount = _top(this.el);
        (this.el.siblings('.growlyflash')).each(function() {
          return amount = Math.max(amount, _top(this) + ($(this)).outerHeight() + spacing);
        });
        return amount;
      };

      Alert.prototype.calc_css_position = function(css) {
        if (css == null) {
          css = {};
        }
        css.top = (this.calc_top_offset(this.opts)) + "px";
        if (this.opts.align === 'center') {
          css.marginLeft = "-" + (this.el.outerWidth() / 2) + "px";
        }
        return css;
      };

      return Alert;

    })();

    Growlyflash.growl = function(flash, options) {
      var alert;
      if (options == null) {
        options = {};
      }
      options = $.extend(true, {}, Growlyflash.defaults, {
        type: flash.type
      }, options);
      alert = new Growlyflash.Alert(flash, options);
      if (flash instanceof Growlyflash.FlashStruct) {
        return flash;
      } else {
        return alert;
      }
    };

    Growlyflash.build_shorthands = function() {
      var name, ref, type;
      ref = this.KEY_MAPPING;
      for (type in ref) {
        name = ref[type];
        if (Growlyflash[type] == null) {
          Growlyflash[type] = function(msg) {
            return Growlyflash.growl(new Growlyflash.FlashStruct(msg, type));
          };
        }
        if (name !== type) {
          if (Growlyflash[name] == null) {
            Growlyflash[name] = Growlyflash[type];
          }
        }
      }
    };

    return Growlyflash;

  })();

  jQuery.growlyflash = Growlyflash.growl;

}).call(this);
(function() {
  var Listener,
    slice = [].slice,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  Listener = (function() {
    var Stack, process, process_from_header;

    Stack = (function() {
      function Stack() {
        var items;
        items = 1 <= arguments.length ? slice.call(arguments, 0) : [];
        this.items = items;
      }

      Stack.prototype.purge = function() {
        return setTimeout(((function(_this) {
          return function() {
            return _this.items.splice(0);
          };
        })(this)), 100);
      };

      Stack.prototype.push = function(alert, dumped) {
        if (dumped == null) {
          dumped = alert.toString();
        }
        if (Growlyflash.debug) {
          console.log("Add to Growlyflash stack: ", dumped);
        }
        Growlyflash.growl(alert);
        return this.items.push(dumped);
      };

      Stack.prototype.push_only_fresh = function(alerts) {
        var alert, dumped, i, len, recent;
        recent = this.items.slice(-alerts.length);
        for (i = 0, len = alerts.length; i < len; i++) {
          alert = alerts[i];
          dumped = alert.toString();
          if (indexOf.call(recent, dumped) < 0) {
            this.push(alert, dumped);
          }
        }
        return this.purge();
      };

      return Stack;

    })();

    Listener.HEADER = 'X-Message';

    Listener.EVENTS = 'ajax:complete ajaxComplete';

    process = function(alerts) {
      var msg, results, type;
      if (alerts == null) {
        alerts = {};
      }
      results = [];
      for (type in alerts) {
        msg = alerts[type];
        if (msg != null) {
          results.push(new Growlyflash.FlashStruct(msg, type));
        }
      }
      return results;
    };

    process_from_header = function(source) {
      if (source == null) {
        return [];
      }
      return process($.parseJSON(decodeURIComponent(source)));
    };

    function Listener(context) {
      if (this.stack == null) {
        this.stack = new Stack();
      }
      if (window.flashes != null) {
        this.process_static();
      }
      ($(context)).on(Growlyflash.Listener.EVENTS, (function(_this) {
        return function(event, xhr) {
          var ref, source;
          if (xhr != null ? xhr : xhr = (ref = event.data) != null ? ref.xhr : void 0) {
            source = process_from_header(xhr.getResponseHeader(Growlyflash.Listener.HEADER));
            _this.stack.push_only_fresh(source);
          }
        };
      })(this));
    }

    Listener.prototype.process_static = function() {
      var alert, i, len, ref;
      ref = process(window.flashes);
      for (i = 0, len = ref.length; i < len; i++) {
        alert = ref[i];
        this.stack.push(alert);
      }
      return delete window.flashes;
    };

    return Listener;

  })();

  this.Growlyflash.Listener = Listener;

  this.Growlyflash.listen_on = function(context) {
    return this.listener != null ? this.listener : this.listener = new this.Listener(context);
  };

}).call(this);
(function() {
  jQuery(function() {
    Growlyflash.build_shorthands();
    return Growlyflash.listen_on(this);
  });

}).call(this);