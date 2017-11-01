`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'stats-attendances-per-attendee', 'Integration | Component | stats attendances per attendee', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{stats-attendances-per-attendee}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#stats-attendances-per-attendee}}
      template block text
    {{/stats-attendances-per-attendee}}
  """

  assert.equal @$().text().trim(), 'template block text'
