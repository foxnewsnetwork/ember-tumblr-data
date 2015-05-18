`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from '../helpers/start-app'`

application = null
container = null
store = null
module 'Acceptance: TumblrTruck',
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

test "looking up all trucks", (assert) ->
  Ember.run ->
    store.find "truck"
    .then (trucks) ->
      assert.ok trucks, "we should have trucks"
      assert.equal trucks.get("length"), 1, "one truck"
      truck = trucks.get "firstObject"
      assert.ok truck, "the truck should be there"
      assert.ok truck.get("id"), "the truck should have a proper id:#{truck.get 'id'}"

test "direct find", (assert) ->
  Ember.run ->
    store.find "truck", 119307968005
    .then (truck) ->
      assert.ok truck
      assert.equal truck.get("message"), "hello world"
    .catch (error) ->
      console.log error
      assert.ok false, "we should not get here"