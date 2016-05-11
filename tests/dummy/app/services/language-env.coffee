`import Ember from 'ember'`
`import moment from 'moment'`

{String, Evented, inject: {service}, computed: {alias}} = Ember
LanguageEnvService = Ember.Service.extend Evented,
  i18n: service()
  cookies: service()
  locales: alias "i18n.locales"
  locale: alias "i18n.locale"
  languageNormalizer:
    en: "en-us"
    "en-gb": "en-us"
    zh: "zh-cn"
  init: ->
    @_super arguments...
    env = navigator?.language ? navigator?.userLanguage ? cookies.read("language")
    @get "i18n"
    .set "locale", @normalizeLanguage env if env?

  normalizeLanguage: (code) ->
    env = String.dasherize code
    @languageNormalizer[env] ? env

  actions:
    flagify: (locale) ->
      switch @normalizeLanguage locale
        when "en-us" then "us"
        when "ja" then "jp"
        when "zh-cn" then "cn"
        when "zh-tw" then "tw"
        
    changeLocale: (obj) ->
      env = @normalizeLanguage obj.get("locale")
      @set "locale", env
      @get "cookies"
      .write "language", env, expires: moment().add(10, "years").toDate()
      @trigger "change", env

`export default LanguageEnvService`
