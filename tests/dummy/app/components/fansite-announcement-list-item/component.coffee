`import Ember from 'ember'`
`import layout from './template'`

FansiteAnnouncementListItemComponent = Ember.Component.extend
  tagName: "li"
  layout: layout
  classNames: ["fansite-announcement-list-item", "mdl-list__item", "mdl-list__item--three-line"]

`export default FansiteAnnouncementListItemComponent`
