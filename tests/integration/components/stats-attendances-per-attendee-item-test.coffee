`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'stats-attendances-per-attendee-item', 'Integration | Component | stats attendances per attendee item', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{stats-attendances-per-attendee-item}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#stats-attendances-per-attendee-item}}
      template block text
    {{/stats-attendances-per-attendee-item}}
  """

  assert.equal @$().text().trim(), 'template block text'
