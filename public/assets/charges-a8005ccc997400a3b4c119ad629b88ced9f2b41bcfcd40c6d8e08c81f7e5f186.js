(function() {
  var user;

  jQuery(function() {
    Stripe.setPublishableKey('');
    user.setupForm();
    $(document).on('turbolinks:load', function() {});
    $('#card_number').keypress(function(e) {
      if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
        return false;
      }
      this.value = this.value.replace(RegExp(' ', 'g'), '');
      this.value = this.value.replace(/\B(?=(\d{4})+(?!\d))/g, ' ');
    });
  });

  user = {
    setupForm: function() {
      return $('#new_user').submit(function() {
        $('input[type=submit]').attr('disabled', true);
        if ($('#card_number').length) {
          user.processCard();
          return false;
        } else {
          return true;
        }
      });
    },
    processCard: function() {
      var card;
      card = {
        number: $('#card_number').val(),
        cvc: $('#card_code').val(),
        expMonth: $('#card_month').val(),
        expYear: $('#card_year').val()
      };
      return Stripe.createToken(card, user.handleStripeResponse);
    },
    handleStripeResponse: function(status, response) {
      if (status === 200) {
        $('#user_stripe_card_token').val(response.id);
        return $('#new_user')[0].submit();
      } else {
        $('#stripe_error').text(response.error.message);
        $('#stripe_error').show();
        return $('input[type=submit]').attr('disabled', false);
      }
    }
  };

}).call(this);
