`import Ember from 'ember'`
`import DS from 'ember-data'`

PolyglotMixin = Ember.Mixin.create
  env: DS.attr "string"

`export default PolyglotMixin`
