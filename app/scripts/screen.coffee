class App.Screen

    constructor: (width, height, scale) ->
        @canvas = document.createElement 'canvas'
        @canvas.width = width * scale
        @canvas.height = height * scale
        @ctx = @canvas.getContext '2d'
        @ctx.font = '16px Impact, Helvetica, Arial, sans-serif'
        document.body.appendChild @canvas


    draw: (grid, score, state) ->
        tw = @canvas.width / grid.width
        th = @canvas.height / grid.height

        @clear

        x = 0
        while x < grid.width
            y = 0
            while y < grid.height
                switch grid.get x, y
                    when state.EMPTY then color = '#000'
                    when state.SNAKE then color = '#666'
                    when state.FOOD  then color = '#999'
                @ctx.fillStyle = color
                @ctx.fillRect x * tw, y * th, tw, th
                y++
            x++

        @ctx.fillStyle = '#fff'
        @ctx.fillText score, 10, 20


    clear: -> @ctx.clearRect 0, 0, @canvas.width, @canvas.height
