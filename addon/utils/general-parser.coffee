class ParseError extends Error
  constructor: (@token, @string) ->
    @message = "Expected #{@token} to match #{@string.slice 0, @token.length}"

consume = (token) -> (string) -> consumeCore token, string

consumeCore = (token, string) ->
  result = tryCore token, string
  throw result if result instanceof ParseError
  result

tryConsume = (token) -> (string) -> tryCore token, string

EOLTrim = (string) ->
  string: string.trim()
  tokens: []

tryCore = (token, string) ->
  i = 0
  while i < token.length
    if token.charAt(i) is string.charAt(i)
      i++
    else
      return new ParseError token, string
  rest: string.slice(i)
  tokens: [token]

tryOneOf = (choices...) ->
  chainParser.apply null, choices.map tryConsume

zeroParse = ({rest}) ->
  tokens: []
  rest: rest

liftP = (string) -> zeroParse rest: string

chainParser = (p, parsers...) ->
  p ?= zeroParse
  parsers.reduce chainParserCore, p

chainParserCore = (p1, p2) ->
  (string) ->
    p1result = log p1 string
    if p1result instanceof ParseError
      {rest, tokens} = p2 string
    else
      {rest, tokens} = p2 p1result.rest
      tokens = p1result.tokens.concat tokens
    rest: rest
    tokens: tokens

compose = (f, functions...) ->
  f ?= (x) -> x
  functions.reduce compose, f

composeCore = (f,g) ->
  (x) -> g f x

map = Ember.EnumerableUtils.map

getMeta = ({meta, total_posts}) ->
  meta.totalPosts = total_posts
  meta

getContent = ({response: {posts: [post, ...]}}) ->
  findPostParser(post)?(post)

getContents = ({response: {posts}}) ->
  map posts, parsePost

findPostParser = ({type}) ->
  switch type
    when "photo" then parsePhoto
    when "text" then parseText
    else throw new Error "I don't know how to parse posts of type #{type}"

parsePhoto = ({id, date, tags, title, caption, photos}) ->
  hash = camelizeKeys jsyaml.load caption
  hash.id = id
  hash.createdAt = date
  hash.tags = tags
  hash.title = title
  hash.photos = photos
  hash

parseText = ({id, date, tags, title, body}) ->
  hash = camelizeKeys jsyaml.load body
  hash.id = id
  hash.createdAt = date
  hash.tags = tags
  hash.title = title
  hash
log = (x) ->
  console.log x
  x
killDirectiveParse = (string) ->
  chainParser tryConsume("#!"),
    tryOneOf("yaml", "json"), 
    EOLTrim
  .call(null, string)
  
  
decideType = (body) ->
  {rest, tokens} = killDirectiveParse body
  type = tokens?[1]
  {type, rest}

transformBody = (body) ->
  {type, rest} = decideType body
  transform = switch type
    when "json" then compose JSON.parse, cleanString
    when "yaml" then compose jsyaml.load
    else throw new Error "I couldn't decide what type the following is: #{body}"
  transform body

class Parser
  @decideType = decideType
  @chainParser = chainParser
  @tryConsume = tryConsume
  @tryOneOf = tryOneOf
  @consume = consume

`export default Parser`