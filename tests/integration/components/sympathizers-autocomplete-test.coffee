import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'sympathizers-autocomplete', 'Integration | Component | sympathizers autocomplete', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{sympathizers-autocomplete}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#sympathizers-autocomplete}}
      template block text
    {{/sympathizers-autocomplete}}
  """

  assert.equal @$().text().trim(), 'template block text'
