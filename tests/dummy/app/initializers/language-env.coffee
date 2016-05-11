# Takes two parameters: container and application
`import Ember from 'ember'`

initialize = (application) ->
  application.inject "controller", "languageEnv", "service:language-env"
  application.inject "component", "languageEnv", "service:language-env"

LanguageEnvInitializer =
  name: 'language-env'
  initialize: initialize

`export {initialize}`
`export default LanguageEnvInitializer`
