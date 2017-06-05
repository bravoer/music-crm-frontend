import DS from 'ember-data'

export default DS.Model.extend
  street: DS.attr('string')
  number: DS.attr('string')
  postCode: DS.attr('string')
  city: DS.attr('string')

  oneLine: Ember.computed 'street', 'number', 'postCode', 'city', ->
    "#{@get('street') || ''} #{@get('number') || ''}, #{@get('postCode') || ''} #{@get('city') || ''}"
