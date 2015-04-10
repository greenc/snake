# Tests for Game class
describe 'Game', ->

    game = startSpy = foodSpy = null

    beforeEach ->
        startSpy = sinon.spy App.Game.prototype, 'setStart'
        foodSpy = sinon.spy App.Game.prototype, 'setFood'
        game = new App.Game
    afterEach ->
        game = null
        startSpy.restore()
        foodSpy.restore()


    it 'should exist', ->
        expect(game).to.be.instanceOf App.Game


    describe 'constructor', ->
        it 'should set cell state constants', ->
            expect(game).to.have.ownProperty 'EMPTY'
            expect(game).to.have.ownProperty 'SNAKE'
            expect(game).to.have.ownProperty 'FOOD'
            expect(game.EMPTY).to.be.a 'number'
            expect(game.SNAKE).to.be.a 'number'
            expect(game.FOOD).to.be.a 'number'

        it 'should set snake direction constants', ->
            expect(game).to.have.ownProperty 'LEFT'
            expect(game).to.have.ownProperty 'UP'
            expect(game).to.have.ownProperty 'RIGHT'
            expect(game).to.have.ownProperty 'DOWN'
            expect(game.LEFT).to.be.a 'number'
            expect(game.UP).to.be.a 'number'
            expect(game.RIGHT).to.be.a 'number'
            expect(game.DOWN).to.be.a 'number'

        it 'should initialize frame counter', ->
            expect(game).to.have.ownProperty 'frames'
            expect(game.frames).to.equal 0

        it 'should initialize score counter', ->
            expect(game).to.have.ownProperty 'score'
            expect(game.score).to.equal 0

        it 'should initialize a new screen', ->
            expect(game).to.have.ownProperty 'screen'
            expect(game.screen).to.be.instanceOf App.Screen

        it 'should initialize a new keyboard', ->
            expect(game).to.have.ownProperty 'input'
            expect(game.input).to.be.instanceOf App.Keyboard

        it 'should initialize a new snake', ->
            expect(game).to.have.ownProperty 'snake'
            expect(game.snake).to.be.instanceOf App.Snake

        it 'should initialize a new grid', ->
            expect(game).to.have.ownProperty 'grid'
            expect(game.grid).to.be.instanceOf App.Grid

        it 'should call setStart method once', ->
            expect(startSpy).to.have.been.calledOnce

        it 'should call setFood method once', ->
            expect(foodSpy).to.have.been.calledOnce


    describe 'run', ->
        it 'should exist', ->
            expect(game.run).to.be.a 'function'
