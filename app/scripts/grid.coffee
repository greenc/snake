class App.Grid

    constructor: (def, cols, rows) ->
        if !def? or !cols? or !rows?
            throw new Error 'Missing arguments'
            return false

        @width  = cols
        @height = rows
        @_grid  = []

        x = 0
        while x < cols
            y = 0
            @_grid.push []
            while y < rows
                @_grid[x].push def
                y++
            x++


    set: (x, y, val) -> @_grid[x][y] = val


    get: (x, y) -> @_grid[x][y]