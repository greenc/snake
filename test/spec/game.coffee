# Tests for Game class
describe 'Game', ->

    game = null

    beforeEach -> game = new App.Game
    afterEach -> game = null

    it 'should exist', ->
        expect(game).to.be.instanceOf App.Game