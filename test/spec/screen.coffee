# Tests for Screen class
describe 'Screen', ->

    screen = spy = grid = state = null

    beforeEach -> screen = new App.Screen 15, 15, 16
    afterEach -> screen = null

    it 'should exist', ->
        expect(screen).to.be.instanceOf App.Screen

    describe 'constructor', ->
        it 'should set "canvas" property', ->
            expect(screen).to.have.ownProperty 'canvas'
            expect(screen.canvas).to.be.an 'object'

        it 'should set "canvas.width" numerical property', ->
            expect(screen.canvas).to.have.ownProperty 'width'
            expect(screen.canvas.width).to.be.a 'number'

        it 'should set "canvas.height" numerical property', ->
            expect(screen.canvas).to.have.ownProperty 'height'
            expect(screen.canvas.height).to.be.a 'number'

        it 'should set "ctx" property', ->
            expect(screen).to.have.ownProperty 'ctx'
            expect(screen.ctx).to.be.an 'object'

        it 'should set "ctx.font" property', ->
            expect(screen.ctx).to.have.ownProperty 'font'
            expect(screen.ctx.font).to.be.a 'string'


    describe 'draw', ->

        before ->
            spy = sinon.spy App.Screen.prototype, 'clear'
            grid = new App.Grid 0, 15, 15
            state = { EMPTY : 0, SNAKE : 1, FOOD : 2 }
        after ->
            spy.restore()
            grid = state = null

        it 'should exist', ->
            expect(screen.draw).to.be.a 'function'

        it 'should call clear method once', ->
            screen.draw grid, 12, state
            expect(spy).to.have.been.calledOnce


    describe 'clear', ->
        it 'should exist', ->
            expect(screen.clear).to.be.a 'function'