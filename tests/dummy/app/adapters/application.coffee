`import Ember from 'ember'`
`import DS from 'ember-data'`
`import TumblrAdapter from 'ember-tumblr-data/adapters/tumblr'`
`import Keys from 'dummy/fixtures/keys'`
`import Env from 'dummy/config/environment'`
{A, inject: {service}} = Ember
ApplicationAdapter = TumblrAdapter.extend
  blogURL: Env.blogURL
  apiKey: Keys.key
  apiSecret: Keys.secret
  languageEnv: service "language-env"
  buildTumblrTags: ->
    locale = @get("languageEnv.locale")
    tag = @_super arguments...
    tag + ":" + locale

`export default ApplicationAdapter`
