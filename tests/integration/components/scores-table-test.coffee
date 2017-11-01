import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'scores-table', 'Integration | Component | scores table', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{scores-table}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#scores-table}}
      template block text
    {{/scores-table}}
  """

  assert.equal @$().text().trim(), 'template block text'
