`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'route:admin/music-scores/add', 'AdminMusicScoresAddRoute', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', ->
  route = @subject()
  ok route
