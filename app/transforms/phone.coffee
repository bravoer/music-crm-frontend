`import DS from 'ember-data'`

PhoneTransform = DS.Transform.extend
  deserialize: (serialized) ->
    if serialized.match(/^tel:/) then serialized.substring('tel:'.length) else serialized
  serialize: (deserialized) ->
    'tel:' + deserialized

`export default PhoneTransform`
