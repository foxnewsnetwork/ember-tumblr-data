`import Ember from 'ember'`

{inject: {service}} = Ember
ApplicationRoute = Ember.Route.extend
  languageEnv: service "language-env"
  init: ->
    @_super arguments...
    Ember.on "languageEnv.change", @refresh.bind(@)

`export default ApplicationRoute`
