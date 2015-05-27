`import Ember from 'ember'`
`import { camelizeKeys, lll } from './json-parser'`

map = Ember.EnumerableUtils.map

getMeta = ({meta, total_posts}) ->
  meta.totalPosts = total_posts
  meta

getContent = ({response: {posts: [post, ...]}}) ->
  parsePost post

getContents = ({response: {posts}}) ->
  map posts, parsePost

parsePost = ({id, date, tags, title, body, photos}) ->
  hash = camelizeKeys jsyaml.load body
  hash.id = id
  hash.createdAt = date
  hash.tags = tags
  hash.title = title
  hash.photos = photos
  hash

`export default getContents`
`export {
  getMeta,
  getContent,
  getContents,
  parsePost
}`