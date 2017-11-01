import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'musician-form', 'Integration | Component | musician form', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{musician-form}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#musician-form}}
      template block text
    {{/musician-form}}
  """

  assert.equal @$().text().trim(), 'template block text'
