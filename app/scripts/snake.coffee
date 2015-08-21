class App.Snake

    constructor: (d, x, y) ->
        @CONST     = App.constants
        @direction = d
        @_queue    = []
        @last      = {}

        @insert x, y


    insert: (x, y) ->
        @_queue.unshift x: x, y: y
        @last = @_queue[0]


    remove: -> @_queue.pop()


    update: (input) ->
        @direction = @CONST.LEFT  if input.isDown('left')  and @direction isnt @CONST.RIGHT
        @direction = @CONST.UP    if input.isDown('up')    and @direction isnt @CONST.DOWN
        @direction = @CONST.RIGHT if input.isDown('right') and @direction isnt @CONST.LEFT
        @direction = @CONST.DOWN  if input.isDown('down')  and @direction isnt @CONST.UP