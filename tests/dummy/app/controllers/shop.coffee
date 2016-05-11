`import Ember from 'ember'`
{inject: {service}} = Ember
ShopController = Ember.Controller.extend
  notify: service()
  i18n: service()
  actions:
    chooseProduct: (product) ->
      {notify, i18n} = @getProperties "notify", "i18n"
      notify.info i18n.t "shop.service-unavailable-in-preview"

`export default ShopController`
