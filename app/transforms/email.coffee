`import DS from 'ember-data'`

EmailTransform = DS.Transform.extend
  deserialize: (serialized) ->
    if serialized.match(/^mailto:/) then serialized.substring('mailto:'.length) else serialized
  serialize: (deserialized) ->
    'mailto:' + deserialized

`export default EmailTransform`
