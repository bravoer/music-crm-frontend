import DS from 'ember-data'

export default DS.Model.extend
  street: DS.attr('string')
  number: DS.attr('string')
  postCode: DS.attr('string')
  city: DS.attr('string')

  oneLine: Ember.computed 'street', 'number', 'postCode', 'city', ->
    line1 = "#{@get('street') || ''} #{@get('number') || ''}".trim()
    line2 = "#{@get('postCode') || ''} #{@get('city') || ''}".trim()
    [line1, line2].filter( (l) -> l.length > 0).join(', ')
