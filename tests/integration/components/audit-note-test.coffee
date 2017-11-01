import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'audit-note', 'Integration | Component | audit note', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{audit-note}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#audit-note}}
      template block text
    {{/audit-note}}
  """

  assert.equal @$().text().trim(), 'template block text'
