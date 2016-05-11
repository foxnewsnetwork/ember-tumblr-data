`import Ember from 'ember'`
`import DS from 'ember-data'`
`import { getContent, getContents, getMeta } from '../utils/json-parser'`

{A, isPresent, String} = Ember

TumblrSerializer = DS.RESTSerializer.extend
  normalizeArrayResponse: (store, primaryModelClass, payload) ->
    typeKey = primaryModelClass.modelName
    reformedPayload = 
      meta: getMeta payload
    reformedPayload[String.pluralize typeKey] = getContents payload
    @_super store, primaryModelClass, reformedPayload

  normalizeFindRecordResponse: (store, primaryModelClass, payload, id, requestType) ->
    typeKey = primaryModelClass.modelName
    reformedPayload = 
      meta: getMeta payload
    reformedPayload[typeKey] = getContent payload
    @_super store, primaryModelClass, reformedPayload, id, requestType
`export default TumblrSerializer`
