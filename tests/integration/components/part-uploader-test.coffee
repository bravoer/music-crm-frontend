import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'file-upload', 'Integration | Component | file upload', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{file-upload}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#file-upload}}
      template block text
    {{/file-upload}}
  """

  assert.equal @$().text().trim(), 'template block text'
