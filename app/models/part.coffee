import DS from 'ember-data'

export default DS.Model.extend {
  name: DS.attr('string')
  instrument: DS.attr('string')
  instrumentPart: DS.attr('string')
  file: DS.attr('string')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  score: DS.belongsTo('score')

  description: Ember.computed 'instrument', 'instrumentPart', ->
    description = ''
    description += @get('instrumentPart') if @get('instrumentPart')
    description += ' ' + @get('instrument') if @get('instrument')
    description.trim()

  downloadFileName: Ember.computed 'score', 'instrument', 'instrumentPart', ->
    name = @get('score.title').replace(/[^A-Z0-9]+/ig, '_')
    name += @get('instrumentPart') if @get('instrumentPart')
    name += @get('instrument') if @get('instrument')
    name += '.pdf' if name
    name
}
