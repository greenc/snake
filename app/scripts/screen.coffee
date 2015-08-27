class App.Screen

    constructor: (width, height) ->
        @CONST = App.constants
        @dpr = window.devicePixelRatio
        @canvas = document.createElement 'canvas'
        @ctx = @canvas.getContext '2d'

        @canvas.width = width * @dpr
        @canvas.height = height * @dpr
        @canvas.style.width = width + 'px'
        @canvas.style.height = height + 'px'
        @ctx.scale @dpr, @dpr

        document.body.appendChild @canvas


    draw: (grid, score) ->
        @clear()

        tw = @canvas.width / grid.width / @dpr
        th = @canvas.height / grid.height / @dpr

        x = 0
        while x < grid.width
            y = 0
            while y < grid.height
                switch grid.get x, y
                    when @CONST.EMPTY then color = @CONST.EMPTY_CL
                    when @CONST.SNAKE then color = @CONST.SNAKE_CL
                    when @CONST.FOOD  then color = @CONST.FOOD_CL
                @ctx.fillStyle = color
                @ctx.fillRect x * tw, y * th, tw, th
                y++
            x++

        @ctx.font = @CONST.FONT
        @ctx.fillStyle = @CONST.SCORE_CL
        @ctx.fillText score, 7, 20


    clear: -> @ctx.clearRect 0, 0, @canvas.width, @canvas.height