`import DS from 'ember-data'`

PhotosTransform = DS.Transform.extend
  deserialize: (photos=[]) ->
    photos.map (photo) ->
      photo.altSizes = photo.alt_sizes
      delete photo.alt_sizes
      photo
  serialize: (unpacked) -> throw new Error "not implemented"

`export default PhotosTransform`