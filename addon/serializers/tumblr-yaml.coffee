`import Ember from 'ember'`
`import DS from 'ember-data'`
`import { getContent, getContents, getMeta } from '../utils/yaml-parser'`

map = Ember.EnumerableUtils.map

TumblrYamlSerializer = DS.RESTSerializer.extend
  extract: (store, type, payload, id, requestType) ->
    reformedPayload = 
      meta: getMeta payload
    if Ember.isPresent id
      reformedPayload[type.typeKey] = getContent payload
    else
      reformedPayload[Ember.String.pluralize type.typeKey] = getContents payload
    @_super store, type, reformedPayload, id, requestType

`export default TumblrYamlSerializer`
