import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'dialog-delete-item', 'Integration | Component | dialog delete item', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{dialog-delete-item}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#dialog-delete-item}}
      template block text
    {{/dialog-delete-item}}
  """

  assert.equal @$().text().trim(), 'template block text'
