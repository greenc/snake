window.App = {}

class App.Game

    constructor: (@cols = 15, @rows = 15, @scale = 16) ->
        # Cell state constants
        @EMPTY = 0
        @SNAKE = 1
        @FOOD  = 2

        # Snake direction constants
        @LEFT  = 0
        @UP    = 1
        @RIGHT = 2
        @DOWN  = 3

        # Initialize frame counter and score
        @frames = @score  = 0

        # Create canvas and keyboard
        @screen  = new App.Screen @cols, @rows, @scale
        @input   = new App.Keyboard

        # Create the snake
        start = @setStart()
        @snake = new App.Snake @UP, start.x, start.y

        # Create the playing grid
        @grid  = new App.Grid @EMPTY, @cols, @rows
        @grid.set start.x, start.y, @SNAKE

        # Set food on grid
        @setFood()

        # Begin!
        @run()

    run: ->
        state = {@EMPTY, @SNAKE, @FOOD}
        @update()
        @screen.draw @grid, @score, state
        window.requestAnimationFrame @run.bind @


    update: ->
        @frames++

        dirs = {@LEFT, @UP, @RIGHT, @DOWN}

        # Update snake direction based on player input
        @snake.update @input, dirs

        # Update grid every 15 frames
        if @frames % 15 is 0
            newX = @snake.last.x
            newY = @snake.last.y

            # Set head of snake to new position
            switch @snake.direction
                when @LEFT  then newX--
                when @RIGHT then newX++
                when @UP    then newY--
                when @DOWN  then newY++

            # Reset game if collision
            if newX < 0 or
               newY < 0 or
               newX > @grid.width  - 1 or
               newY > @grid.height - 1 or
               @grid.get(newX, newY) is @SNAKE
                return @reset()

            # Update score and set new food if player eats food,
            # else remove tail end as snake moves
            if @grid.get(newX, newY) is @FOOD
                @score++
                @setFood()
            else
                tail = @snake.remove()
                @grid.set tail.x, tail.y, @EMPTY

            @grid.set newX, newY, @SNAKE
            @snake.insert newX, newY


    setFood: ->
        empty = []
        x = 0
        while x < @grid.width
            y = 0
            while y < @grid.height
                empty.push(x: x, y: y) if @grid.get(x, y) is @EMPTY
                y++
            x++

        position = empty[Math.round(Math.random() * (empty.length - 1))]
        @grid.set position.x, position.y, @FOOD


    setStart: -> x: (Math.floor @cols / 2), y: (@rows - 1)


    reset: ->
        @frames = @score  = 0
        start = @setStart()
        @snake = new App.Snake @UP, start.x, start.y
        @grid = new App.Grid @EMPTY, @cols, @rows
        @grid.set start.x, start.y, @SNAKE
        @setFood()
