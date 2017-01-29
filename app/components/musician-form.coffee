`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import ContactPrefixOptions from 'client/config/contact-prefix-options'`

MusicianFormComponent = Ember.Component.extend InstrumentOptions, ContactPrefixOptions,
  init: () ->
    @_super(arguments...)
    @get('store').findAll('musicianGroup').then (groups) =>
      @get('musician.groups').then (currentGroups) =>
        wrappers = groups.map (group) ->
          group: group
          isSelected: currentGroups.contains(group)
          name: group.get('name')
        @set('groups', wrappers)
  store: Ember.inject.service()
  instruments: InstrumentOptions.get('all')
  prefixes: ContactPrefixOptions.get('prefixes')
  actions:
    updateBirthdate: (birthdate, valid) ->
      @set('musician.birthdate', birthdate)
    updateGroupSelection: () ->
      selectedGroups = @get('groups').filterBy('isSelected').map (wrapper) -> wrapper.group
      @set('musician.groups', selectedGroups)
      @set('musician.modified', new Date()) # change attribute of musician to force save action in route

`export default MusicianFormComponent`
