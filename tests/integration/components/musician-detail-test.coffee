import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'musician-detail', 'Integration | Component | musician detail', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{musician-detail}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#musician-detail}}
      template block text
    {{/musician-detail}}
  """

  assert.equal @$().text().trim(), 'template block text'
