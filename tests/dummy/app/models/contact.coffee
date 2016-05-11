`import DS from 'ember-data'`
`import Timestamps from '../mixins/timestamps'`

Contact = DS.Model.extend Timestamps,
  flavor: DS.attr "string",
    label: "Contact Flavor"
    description: "Describes what sort of contact this is, in general, this is some sort of social-media service provider"
    among: ["twitter", "gmail", "facebook", "youtube"]

  handle: DS.attr "string",
    label: "Contact Handle"
    description: "The handle could be an username, a twitter handle, an email, etc., that depends on the flavor of this contact"

`export default Contact`
