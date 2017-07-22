import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'score-detail', 'Integration | Component | score detail', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{score-detail}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#score-detail}}
      template block text
    {{/score-detail}}
  """

  assert.equal @$().text().trim(), 'template block text'
