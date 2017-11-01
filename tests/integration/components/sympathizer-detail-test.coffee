import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'sympathizer-detail', 'Integration | Component | sympathizer detail', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{sympathizer-detail}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#sympathizer-detail}}
      template block text
    {{/sympathizer-detail}}
  """

  assert.equal @$().text().trim(), 'template block text'
