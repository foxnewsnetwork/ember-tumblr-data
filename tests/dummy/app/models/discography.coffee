`import DS from 'ember-data'`
`import Polyglot from '../mixins/polyglot'`
`import Timestamps from '../mixins/timestamps'`

Discography = DS.Model.extend Polyglot, Timestamps,
  title: DS.attr "string",
    label: "Work Title"

  summary: DS.attr "string",
    label: "One Sentence Summary"
    description: "Something catchy slogan or whatever that summarizes this work; for example, if we were making a movie poster, we might say something like 'This summer is going to get a lot chiller'"

  exposition: DS.attr "string",
    label: "Full Description"
    description: "The markdown-flavored full description text of this discography"

  type: DS.attr "string",
    label: "Work Type"
    description: "Types describe what sort of work this is, in the case of a dancer, it would be either a cover, an original choreography, or a collaboration"
    among: ["cover", "original", "collaboration"]

  leadImage: DS.attr "string",
    label: "Showcase Image"
    description: "Card header image"

  youtubeLink: DS.attr "string",
    label: "Youtube Link"
    description: "This is the link to where this thing is hosted"

  nicoLink: DS.attr "string",
    label: "Nico Nico Douga Link"
    description: "The nico link where this is hosted"
`export default Discography`
