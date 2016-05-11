`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAccpetance from '../helpers/module-for-acceptance'`

moduleForAccpetance 'Acceptance: TumblrTruck'

test "looking up all trucks", (assert) ->
  store = @application.__container__.lookup("service:store")
  Ember.run ->
    store.findAll "truck"
    .then (trucks) ->
      assert.ok trucks, "we should have trucks"
      assert.equal trucks.get("length"), 1, "one truck"
      truck = trucks.get "firstObject"
      assert.ok truck, "the truck should be there"
      assert.ok truck.get("id"), "the truck should have a proper id:#{truck.get 'id'}"

test "direct find", (assert) ->
  store = @application.__container__.lookup("service:store")
  Ember.run ->
    store.findRecord "truck", 119307968005
    .then (truck) ->
      assert.ok truck
      assert.equal truck.get("message"), "hello world"
    .catch (error) ->
      console.log error
      assert.ok false, "we should not get here"