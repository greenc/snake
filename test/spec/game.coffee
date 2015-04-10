# Tests for Game class
describe 'Game', ->

    describe 'constructor', ->

        game = startSpy = foodSpy = null
        before ->
            startSpy = sinon.spy App.Game.prototype, 'setStart'
            foodSpy = sinon.spy App.Game.prototype, 'setFood'
            game = new App.Game
        after ->
            startSpy.restore()
            foodSpy.restore()
            game = null

        it 'should exist', ->
            expect(game).to.be.instanceOf App.Game

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

        game = updateSpy = screenDrawSpy = null
        before ->
            updateSpy = sinon.spy App.Game.prototype, 'update'
            screenDrawSpy = sinon.spy App.Screen.prototype, 'draw'
            game = new App.Game
            game.run()
        after ->
            updateSpy.restore()
            screenDrawSpy.restore()
            game = null

        it 'should exist', ->
            expect(game.run).to.be.a 'function'

        it 'should call update method once', ->
            expect(updateSpy).to.have.been.calledOnce

        it 'should call screen.draw method once', ->
            expect(screenDrawSpy).to.have.been.calledOnce


    describe 'update', ->

        game = null
        before -> game = new App.Game
        after -> game = null

        it 'should exist', ->
            expect(game.update).to.be.a 'function'

        it 'should increment frame counter by one', ->
            frame = game.frames
            game.update()
            expect(game.frames).to.equal frame + 1
