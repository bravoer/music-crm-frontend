`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'download-score-per-instrument-card', 'Integration | Component | download score per instrument card', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{download-score-per-instrument-card}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#download-score-per-instrument-card}}
      template block text
    {{/download-score-per-instrument-card}}
  """

  assert.equal @$().text().trim(), 'template block text'
