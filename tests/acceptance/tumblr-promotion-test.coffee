`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAccpetance from '../helpers/module-for-acceptance'`

moduleForAccpetance 'Acceptance: TumblrPromotion'

test "looking up all promotions", (assert) ->
  store = @application.__container__.lookup("service:store")
  Ember.run ->
    store.findAll "promotion"
    .then (promotions) ->
      assert.ok promotions, "we should have promotions"
      assert.equal promotions.get("length"), 1, "one promotion"

test 'hitting up remote tumblr', (assert) ->
  store = @application.__container__.lookup("service:store")
  Ember.run ->
    store.findRecord 'promotion', '119308465280'
    .then (promotion) ->
      assert.ok promotion, "it should find a promotion from tumblr"
      assert.equal promotion.get("message"), "this is a test of the message system", 'it should have the correct message attr'
      assert.deepEqual promotion.get("tags"), ["promotion"], 'it should have the correct tag attribute'
    .catch (error) ->
      console.log error
      assert.ok false, "should not have error"