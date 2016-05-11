`import Ember from 'ember'`
`import layout from './template'`

{computed, String} = Ember
FansiteImageCardComponent = Ember.Component.extend
  layout: layout
  classNames: ["fansite-image-card", "mdl-card", "mdl-shadow--2dp"]
  attributeBindings: ["style"]
  style: computed "imgSrc", ->
    {imgSrc} = @getProperties "imgSrc"
    String.htmlSafe """
    background-image: url("#{imgSrc}");
    """

`export default FansiteImageCardComponent`
