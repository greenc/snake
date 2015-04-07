# Tests for grid.coffee

grid = new App.Grid 0, 15, 15

describe 'Grid', ->
    it 'should exist', -> expect(grid).to.be.instanceOf App.Grid


    it 'constructor', ->
        it 'should set height and width properties', ->
            expect(grid).to.have.ownProperty 'width', 15
            expect(grid).to.have.ownProperty 'height', 15

        it 'should populate the _grid array', ->
            expect(grid).to.have.ownProperty '_grid'
            expect(grid._grid).to.be.an 'array'
            expect(grid._grid).to.have.length 15
            expect(grid._grid[0]).to.have.length 15


    it 'get', ->
        it 'should exist', ->
            expect(grid).to.have.property 'get'
            expect(grid.get).to.be.a 'function'

        it 'should retrieve a grid coordinate', -> expect(grid.get(7, 7)).to.equal 0


    it 'set', ->
        it 'should exist', ->
            expect(grid).to.have.property 'set'
            expect(grid.set).to.be.a 'function'

        it 'should set a grid coordinate', ->
            grid.set(7, 7, 2)
            expect(grid.get(7,7)).to.equal 2
