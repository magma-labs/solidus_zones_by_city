Spree.ready(function() {
  'use strict';

  Spree.Views.Zones.Form = Backbone.View.extend({
    events: {
      'click [name="zone[kind]"]': 'render'
    },

    render: function() {
      var kind = this.$('[name="zone[kind]"]:checked').val() || 'state';
      this.$('[name="zone[kind]"]').val([kind]);

      $('#state_members').toggleClass('hidden', kind !== 'state');
      $('#state_members :input').prop('disabled', kind !== 'state');

      $('#country_members').toggleClass('hidden', kind !== 'country');
      $('#country_members :input').prop('disabled', kind !== 'country');

      $('#city_members').toggleClass('hidden', kind !== 'city');
      $('#city_members :input').prop('disabled', kind !== 'city');
    }
  });

  if($('.js-zones-form').length) {
    var view = new Spree.Views.Zones.Form({
      el: $('.js-zones-form')
    });
    view.render()
  }
});
