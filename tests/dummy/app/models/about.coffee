`import DS from 'ember-data'`
`import Polyglot from '../mixins/polyglot'`
`import Timestamps from '../mixins/timestamps'`

About = DS.Model.extend Polyglot, Timestamps,
  leadImage: DS.attr "string",
    label: "Banner Image"
    description: "This is the picture shown at the top of a big card"

  exposition: DS.attr "string",
    label: "Exposition"
    description: "The exposition is the markdown-flavored copy text of the big card"

  title: DS.attr "string",
    label: "Card Title"
    description: "The lead title of the about card; for example, a good title might be 'My Journey Here'"

`export default About`
