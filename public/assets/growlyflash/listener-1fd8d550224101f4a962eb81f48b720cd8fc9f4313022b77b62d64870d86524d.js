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
