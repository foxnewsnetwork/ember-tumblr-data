`import Ember from 'ember'`
`import DS from 'ember-data'`

get = Ember.get

lll = (x) ->
  console.log x
  x

TumblrAdapter = DS.RESTAdapter.extend
  host: 'http://api.tumblr.com'
  defaultSerializer: '-tumblr'
  apiKey: "PUT YOUR OWN KEY HERE"

  ajaxOptions: ->
    hash = @_super arguments...
    hash.crossDomain = true
    hash.dataType = "jsonp"
    hash
    
  buildURL: ->
    uri = @urlPrefix()
    [uri, "posts"].join('/')

  find: (store, type, id, snapshot) ->
    data = @buildUrlOptions
      typeKey: type.typeKey
      id: id
      snapshot: snapshot
    uri = @buildURL()
    @ajax uri, 'GET', data: data

  findAll: (store, type, sinceToken) ->
    data = @buildUrlOptions
      typeKey: type.typeKey
      sinceToken: sinceToken
    uri = @buildURL()
    @ajax uri, 'GET', data: data

  findQuery: (store, type, query) ->
    data = @buildUrlOptions
      typeKey: type.typeKey
      hash: query
    uri = @buildURL()
    @ajax uri, 'GET', data: data

  buildUrlOptions: ({typeKey, id, snapshot, sinceToken, hash}) ->
    hash ?= {}
    hash.api_key = get(@, 'apiKey')
    hash.filter = 'text'
    hash.tag = typeKey
    hash.id = id if Ember.isPresent id
    hash.since = sinceToken if Ember.isPresent sinceToken
    hash

`export default TumblrAdapter`
