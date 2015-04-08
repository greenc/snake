class App.Keyboard

    constructor: ->
        @down = {}
        @key  =
            left  : 37
            up    : 38
            right : 39
            down  : 40

        document.addEventListener 'keydown', (evt) => @down[evt.keyCode] = true
        document.addEventListener 'keyup',   (evt) => @down[evt.keyCode] = false


    isDown: (keyName) -> @down[@key[keyName]]