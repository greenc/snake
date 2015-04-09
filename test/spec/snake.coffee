# Tests for Snake class
spy = sinon.spy App.Snake.prototype, 'insert'
snake = new App.Snake 1, 7, 17

describe 'Snake', ->
    it 'should exist', ->
        expect(snake).to.be.instanceOf App.Snake

    it 'constructor', ->
        it 'should set "direction" property', ->
            expect(snake).to.have.ownProperty 'direction'
            expect(snake.direction).to.be.a 'number'
        it 'should set "_queue" property', ->
            expect(snake).to.have.ownProperty '_queue'
            expect(snake._queue).to.be.an 'array'
        it 'should call "insert" method once', ->
            expect(spy).to.have.been.calledOnce

    it 'insert', ->
        it 'should exist', ->
            expect(snake.insert).to.be.a 'function'
        it 'should insert a new element into the beginning of the queue', ->
            queueLength = snake._queue.length
            snake.insert(5, 5)
            expect(snake._queue).to.have.length queueLength + 1
        it 'should update "last" to be the inserted item', ->
            snake.insert(5, 5)
            expect(snake.last).to.eql { x: 5, y: 5 }

    it 'remove', ->
        it 'should exist', ->
            expect(snake.remove).to.be.a 'function'
        it 'should remove the last element in the queue', ->
            queueLength = snake._queue.length
            snake.remove()
            expect(snake._queue).to.have.length queueLength - 1

    it 'update', ->
        mockInput = {}
        dirs = { LEFT: 0, UP: 1, RIGHT: 2, DOWN: 3 }
        it 'should exist', ->
            expect(snake.update).to.be.a 'function'
        it 'should set "direction" property to keyboard input if new direction is NOT the inverse of current one', ->
            mockInput.isDown = (dir) -> return if dir is 'right' then true else false
            snake.update mockInput, dirs
            expect(snake.direction).to.equal 2
        it 'should not set "direction" property to keyboard input if new direction IS the inverse of current one', ->
            mockInput.isDown = (dir) -> return if dir is 'up' then true else false
            snake.update mockInput, dirs
            expect(snake.direction).to.equal 1