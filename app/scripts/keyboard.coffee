class App.Keyboard

    constructor: ->
        @CONST = App.constants
        @down  = {}
        @key   =
            left  : @CONST.KEY_LEFT
            up    : @CONST.KEY_UP
            right : @CONST.KEY_RIGHT
            down  : @CONST.KEY_DOWN

        document.addEventListener 'keydown', (evt) => @down[evt.keyCode] = true
        document.addEventListener 'keyup',   (evt) => @down[evt.keyCode] = false


    isDown: (keyName) -> @down[@key[keyName]]