class App.Sprite
    constructor: (@img, @x, @y, @width, @height) ->

    draw: (ctx, x, y) -> ctx.drawImage @img, @x, @y, @width, @height, x, y, @width, @height
