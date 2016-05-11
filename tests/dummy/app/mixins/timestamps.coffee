`import Ember from 'ember'`
`import DS from 'ember-data'`

TimestampsMixin = Ember.Mixin.create
  createdAt: DS.attr "date"
  updatedAt: DS.attr "date"

`export default TimestampsMixin`
