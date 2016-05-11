`import DS from 'ember-data'`
`import Polyglot from '../mixins/polyglot'`
`import Timestamps from '../mixins/timestamps'`

Announcement = DS.Model.extend Polyglot, Timestamps,
  title: DS.attr "string"
  message: DS.attr "string"
  type: DS.attr "string",
   label: "Announcement Type"
   description: "Depending on the type of announcement, the software will decide how to link this. If no type is given, we don't link anywhere."
   among: ["internal", "youtube", "external"]
  external: DS.attr "string",
    label: "External Link Slug"
    description: "Depending on link type, this is the slug core that helps the system decide how to link, for example, if we're a youtube link, this value might be: 9zs25WogrIw"
  path: DS.attr "string",
    label: "Model Path"
    description: "If we're an internally referencing announcement, I expect this to be a valid path such as shop.index or something"
  slug: DS.attr "string",
    label: "Path Slug"
    description: "If we're an internal path, it's possible we might need a path id value, provide that here"


`export default Announcement`
