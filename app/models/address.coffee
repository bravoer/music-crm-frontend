`import DS from 'ember-data';`

Address = DS.Model.extend
  street: DS.attr('string')
  number: DS.attr('string')
  postCode: DS.attr('string')
  city: DS.attr('string')
  
`export default Address`
