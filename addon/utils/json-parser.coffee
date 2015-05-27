`import Ember from 'ember'`

map = Ember.EnumerableUtils.map
lll = (x) ->
  console.log x
  x

getMeta = ({meta, total_posts}) ->
  meta.totalPosts = total_posts
  meta

getContent = ({response: {posts: [post, ...]}}) ->
  parsePost post

getContents = ({response: {posts}}) ->
  map posts, parsePost

camelizeKeys = (hash) ->
  for key, value of hash
    camelKey = Ember.String.camelize key
    if key isnt camelKey
      hash[camelKey] = value
      delete hash[key]
  hash

cleanString = (string) ->
  string
  .replace /“/gi, '"'
  .replace /”/gi, '"'

parsePost = ({id, date, tags, title, body, photos}) ->
  hash = camelizeKeys JSON.parse cleanString body
  hash.id = id
  hash.createdAt = date
  hash.tags = tags
  hash.title = title
  hash.photos = photos
  hash

`export default getContents`
`export {
  lll,
  getMeta,
  getContent,
  getContents,
  camelizeKeys,
  cleanString,
  parsePost
}`