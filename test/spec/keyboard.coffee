# Tests for Keyboard class

describe 'Keyboard', ->

    keyboard = null
    beforeEach -> keyboard = new App.Keyboard
    afterEach -> keyboard = null

    it 'should exist', ->
        expect(keyboard).to.be.instanceOf App.Keyboard


    describe 'constructor', ->
        it 'should set "key" property', ->
            expect(keyboard).to.have.ownProperty 'key'

        it 'should set "down" property', ->
            expect(keyboard).to.have.ownProperty 'down'

        it 'should import app constants', ->
            expect(keyboard).to.have.ownProperty 'CONST'
            expect(keyboard.CONST).to.be.an 'object'

    describe 'isDown', ->
        it 'should exist', ->
            expect(keyboard.isDown).to.be.a 'function'

        it 'should return undefined or false for a key that is not currently pressed', ->
            expect(keyboard.isDown 'left').to.not.be.ok

        it 'should return true for a key that is currently pressed', ->
            keyboard.down[37] = true
            expect(keyboard.isDown 'left').to.be.true