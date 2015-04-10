class App.Snake

    constructor: (d, x, y) ->
        @direction = d
        @_queue    = []
        @last      = {}

        @insert x, y


    insert: (x, y) ->
        @_queue.unshift x: x, y: y
        @last = @_queue[0]


    remove: -> @_queue.pop()


    update: (input, dirs) ->
        @direction = dirs.LEFT  if input.isDown('left')  and @direction isnt dirs.RIGHT
        @direction = dirs.UP    if input.isDown('up')    and @direction isnt dirs.DOWN
        @direction = dirs.RIGHT if input.isDown('right') and @direction isnt dirs.LEFT
        @direction = dirs.DOWN  if input.isDown('down')  and @direction isnt dirs.UP