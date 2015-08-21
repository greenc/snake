class App.Game

    constructor: () ->
        # Import constants
        @CONST = App.constants

        # Initialize frame counter and score
        @frames = @score  = 0

        # Create canvas and keyboard
        width  = @CONST.COLS * @CONST.SCALE
        height = @CONST.ROWS * @CONST.SCALE
        @screen  = new App.Screen width, height
        @input   = new App.Keyboard

        # Create the snake
        start = @setStart()
        @snake = new App.Snake @CONST.UP, start.x, start.y

        # Create the playing grid
        @grid = new App.Grid @CONST.EMPTY, @CONST.COLS, @CONST.ROWS
        @grid.set start.x, start.y, @CONST.SNAKE

        # Set food on grid
        @setFood()

    run: ->
        @update()
        @screen.draw @grid, @score
        window.requestAnimationFrame @run.bind @


    update: ->
        @frames++

        # Update snake direction based on player input
        @snake.update @input

        # Update grid
        if @frames % @CONST.FRAMES is 0
            newX = @snake.last.x
            newY = @snake.last.y

            # Set head of snake to new position
            switch @snake.direction
                when @CONST.LEFT  then newX--
                when @CONST.RIGHT then newX++
                when @CONST.UP    then newY--
                when @CONST.DOWN  then newY++

            # Reset game if collision
            if newX < 0 or
               newY < 0 or
               newX > @grid.width  - 1 or
               newY > @grid.height - 1 or
               @grid.get(newX, newY) is @CONST.SNAKE
                return @reset()

            # Update score and set new food if player eats food,
            # else remove tail end as snake moves
            if @grid.get(newX, newY) is @CONST.FOOD
                @score++
                @setFood()
            else
                tail = @snake.remove()
                @grid.set tail.x, tail.y, @CONST.EMPTY

            @grid.set newX, newY, @CONST.SNAKE
            @snake.insert newX, newY


    setFood: ->
        empty = []
        x = 0
        while x < @grid.width
            y = 0
            while y < @grid.height
                empty.push(x: x, y: y) if @grid.get(x, y) is @CONST.EMPTY
                y++
            x++

        position = empty[Math.round(Math.random() * (empty.length - 1))]
        @grid.set position.x, position.y, @CONST.FOOD


    setStart: -> x: (Math.floor @CONST.COLS / 2), y: (@CONST.ROWS - 1)


    reset: ->
        @frames = @score  = 0
        start = @setStart()
        @snake = new App.Snake @CONST.UP, start.x, start.y
        @grid = new App.Grid @CONST.EMPTY, @CONST.COLS, @CONST.ROWS
        @grid.set start.x, start.y, @CONST.SNAKE
        @setFood()