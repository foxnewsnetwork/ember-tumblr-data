`import Ember from 'ember'`
`import DS from 'ember-data'`

{computed, get, isPresent} = Ember

TumblrAdapter = DS.RESTAdapter.extend
  host: 'http://api.tumblr.com'
  defaultSerializer: '-tumblr'
  apiKey: "PUT YOUR OWN KEY HERE"
  blogURL: ''

  namespace: computed "blogURL", ->
    "v2/blog/" + @get "blogURL"
  ajaxOptions: ->
    hash = @_super arguments...
    hash.data = hash.data || {};
    hash.crossDomain = true
    hash.dataType = "jsonp"
    hash
    
  buildURL: ->
    uri = @urlPrefix()
    [uri, "posts"].join('/')

  findRecord: (store, factory, id, snapshot) ->
    data = @buildURLOptions
      typeKey: factory.modelName
      id: id
      snapshot: snapshot
    uri = @buildURL()
    @ajax uri, 'GET', data: data

  findAll: (store, factory, sinceToken) ->
    data = @buildURLOptions
      typeKey: factory.modelName
      sinceToken: sinceToken
    uri = @buildURL()
    @ajax uri, 'GET', data: data

  findQuery: (store, factory, query) ->
    data = @buildURLOptions
      typeKey: factory.modelName
      hash: query
    uri = @buildURL()
    @ajax uri, 'GET', data: data

  buildTumblrTags: ({typeKey, id, snapshot, sinceToken, hash}) ->
    "model:#{typeKey}"

  buildURLOptions: ({typeKey, id, snapshot, sinceToken, hash}) ->
    hash ?= {}
    hash.api_key = get(@, 'apiKey')
    hash.filter = 'text'
    hash.tag = @buildTumblrTags({typeKey, id, snapshot, sinceToken, hash})
    hash.id = id if isPresent id
    hash.since = sinceToken if isPresent sinceToken
    hash

`export default TumblrAdapter`
