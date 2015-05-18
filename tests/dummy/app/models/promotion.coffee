`import Ember from 'ember'`
`import DS from 'ember-data'`

Promotion = DS.Model.extend
  title: DS.attr "string"
  message: DS.attr "string"
  createdAt: DS.attr "date"
  pic: DS.attr "string"
  link: DS.attr "string"
  tags: DS.attr()

  isExternal: Ember.computed.match "link", /^https?:\/\//
    

`export default Promotion`
