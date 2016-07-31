`import DS from 'ember-data'`

Part = DS.Model.extend
  name: DS.attr('string')
  instrument: DS.attr('string')
  instrumentPart: DS.attr('string')
  key: DS.attr('string')
  clef: DS.attr('string')
  file: DS.attr('string')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  score: DS.belongsTo('score')

  description: Ember.computed 'instrument', 'instrumentPart', 'key', 'clef', ->
    description = ""
    description += "#{@i18n.t(@get('instrumentPart'))}" if @get('instrumentPart')
    description += " #{@i18n.t(@get('instrument'))}" if @get('instrument')
    description += " #{@i18n.t(@get('key'))}" if @get('key')
    description += " (#{@i18n.t(@get('clef'))})" if @get('clef')
    description || @get('name')

  downloadFileName: Ember.computed 'score', 'instrument', 'instrumentPart', ->
    name = @get('score.title').replace(/[^A-Z0-9]+/ig, "_")
    name += "_#{@i18n.t(@get('instrumentPart'))}" if @get('instrumentPart')
    name += "_#{@i18n.t(@get('instrument'))}" if @get('instrument')
    name += ".pdf" if name
    name

`export default Part`
