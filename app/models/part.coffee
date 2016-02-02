`import DS from 'ember-data'`

Part = DS.Model.extend
  name: DS.attr('string')
  instrument: DS.attr('string')
  instrumentPart: DS.attr('string')
  key: DS.attr('string')
  clef: DS.attr('string')
  file: DS.attr('string')

  score: DS.belongsTo('score')

  description: Ember.computed 'instrument', 'instrumentPart', 'key', 'clef', ->
    description = ""
    description += "#{@i18n.t(@get('instrumentPart'))}" if @get('instrumentPart')
    description += " #{@i18n.t(@get('instrument'))}" if @get('instrument')
    description += " #{@i18n.t(@get('key'))}" if @get('key')
    description += " (#{@i18n.t(@get('clef'))})" if @get('clef')
    description || @get('name')


`export default Part`
