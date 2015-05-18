`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from '../helpers/start-app'`

application = null
container = null
store = null
module 'Acceptance: TumblrPromotion',
  beforeEach: ->
    application = startApp()
    container = application.__container__
    store = container.lookup "store:main"
    ###
    Don't return as Ember.Application.then is deprecated.
    Newer version of QUnit uses the return value's .then
    function to wait for promises if it exists.
    ###
    return

  afterEach: ->
    Ember.run application, 'destroy'

test 'hitting up remote tumblr', (assert) ->
  Ember.run ->
    store.find 'promotion', '118064140679'
    .then (promotion) ->
      assert.ok promotion, "it should find a promotion from tumblr"
      assert.equal promotion.get("message"), "you should be able to read this from ember", 'it should have the correct message attr'
      assert.deepEqual promotion.get("tags"), ["promotion"], 'it should have the correct tag attribute'
    .catch (error) ->
      console.log error
      assert.ok false, "should not have error"