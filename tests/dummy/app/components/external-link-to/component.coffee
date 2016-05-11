`import Ember from 'ember'`
`import layout from './template'`

ExternalLinkToComponent = Ember.Component.extend
  layout: layout
  tagName: "a"
  attributeBindings: ["href"]

`export default ExternalLinkToComponent`
