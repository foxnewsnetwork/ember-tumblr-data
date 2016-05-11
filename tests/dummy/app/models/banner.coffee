`import Ember from 'ember'`
`import DS from 'ember-data'`
`import Polyglot from '../mixins/polyglot'`
`import Timestamps from '../mixins/timestamps'`

Banner = DS.Model.extend Polyglot, Timestamps,
  headline: DS.attr "string",
    label: "Banner Headline"
    description: "For example, 'Galaxia Cconert'"
  subtitle: DS.attr "string",
    label: "Banner Details"
    description: "For example, 'July 8 - July 10, Thousand Oaks Theatre'"
  pic: DS.attr "string"
  link: DS.attr "string"
  tags: DS.attr()

  isExternal: Ember.computed.match "link", /^https?:\/\//
    

`export default Banner`
