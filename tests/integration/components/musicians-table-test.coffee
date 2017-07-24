import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'musicians-table', 'Integration | Component | musicians table', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{musicians-table}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#musicians-table}}
      template block text
    {{/musicians-table}}
  """

  assert.equal @$().text().trim(), 'template block text'
