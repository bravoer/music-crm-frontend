import DS from 'ember-data'
import moment from 'moment'

export default DS.Model.extend
  prefix: DS.attr('string')
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  instrument: DS.attr('string')
  email: DS.attr('email')
  birthdate: DS.attr('date')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  address: DS.belongsTo 'address'
  telephones: DS.hasMany 'telephone'

  user: DS.belongsTo 'user'
  groups: DS.hasMany 'musicianGroup'

  attendances: DS.hasMany 'event'
  absences: DS.hasMany 'event'

  name: Ember.computed 'firstName', 'lastName', ->
    @get('firstName') + ' ' + @get('lastName')
  birthdateStr: Ember.computed 'birthdate',
    get: ->
      if @get('birthdate')
        moment(@get('birthdate')).format('YYYY-MM-DD')
      else
        null
    set: (_key, value, prevValue) ->
      if value then @set('birthdate', new Date(value)) else @set('birthdate', null)
      value
