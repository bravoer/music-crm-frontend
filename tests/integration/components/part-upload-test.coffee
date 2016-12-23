`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'part-upload', 'Integration | Component | part upload', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{part-upload}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#part-upload}}
      template block text
    {{/part-upload}}
  """

  assert.equal @$().text().trim(), 'template block text'
