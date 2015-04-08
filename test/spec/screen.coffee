# Tests for Screen class
screen = {}

describe 'Screen', ->
    beforeEach -> screen = new App.Screen 15, 15, 16
    it 'should exist', ->
        expect(screen).to.be.instanceOf App.Screen

    it 'constructor', ->
        it 'should set "canvas" property', ->
            expect(screen).to.have.ownProperty 'canvas'
            expect(screen.canvas).to.be.an 'object'
        it 'should set "ctx" property', ->
            expect(screen).to.have.ownProperty 'ctx'
            expect(screen.ctx).to.be.an 'object'

    it 'draw', ->
        it 'should exist', ->
            expect(screen.draw).to.be.a 'function'
        it 'should return undefined or false for a key that is not currently pressed', ->
            expect(screen.isDown 'left').to.not.be.ok
        it 'should return true for a key that is currently pressed', ->
            screen.down[37] = true
            expect(screen.isDown 'left').to.be.true
