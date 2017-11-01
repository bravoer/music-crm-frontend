import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'sympathizer-form', 'Integration | Component | sympathizer form', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{sympathizer-form}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#sympathizer-form}}
      template block text
    {{/sympathizer-form}}
  """

  assert.equal @$().text().trim(), 'template block text'
