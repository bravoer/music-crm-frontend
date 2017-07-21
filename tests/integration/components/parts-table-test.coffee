import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'parts-table', 'Integration | Component | parts table', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{parts-table}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#parts-table}}
      template block text
    {{/parts-table}}
  """

  assert.equal @$().text().trim(), 'template block text'
