import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'parts-upload-grid', 'Integration | Component | parts upload grid', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{parts-upload-grid}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#parts-upload-grid}}
      template block text
    {{/parts-upload-grid}}
  """

  assert.equal @$().text().trim(), 'template block text'
