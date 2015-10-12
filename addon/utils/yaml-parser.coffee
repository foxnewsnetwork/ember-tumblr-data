`import Ember from 'ember'`
`import { camelizeKeys, lll } from './json-parser'`

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

parsePost = ({id, date, tags, title, body}) ->
  hash = camelizeKeys jsyaml.load body
  hash.id = id
  hash.createdAt = date
  hash.tags = tags
  hash.title = title
  hash

`export default getContents`
`export {
  getMeta,
  getContent,
  getContents,
  parsePost
}`