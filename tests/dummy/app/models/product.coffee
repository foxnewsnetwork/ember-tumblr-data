`import DS from 'ember-data'`
`import Polyglot from '../mixins/polyglot'`
`import Timestamps from '../mixins/timestamps'`

Product = DS.Model.extend Polyglot, Timestamps,
  title: DS.attr "string",
    label: "Product Title"

  summary: DS.attr "string",
    label: "Product Summary"

  leadImage: DS.attr "string",
    label: "Showcase Image"
    description: "Card header image"

  pricePresentation: DS.attr "string",
    label: "Price Presentation"
    description: "The purchase cost of this product"

`export default Product`
