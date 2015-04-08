# Tests for Grid class
grid = {}
describe 'Grid', ->
    beforeEach -> grid = new App.Grid 0, 10, 20
    it 'should exist', ->
        expect(grid).to.be.instanceOf App.Grid

    it 'constructor', ->
        it 'should set height and width properties', ->
            expect(grid).to.have.property 'width', 10
            expect(grid).to.have.property 'height', 20
        it 'should populate the _grid array', ->
            expect(grid._grid).to.be.an 'array'
            expect(grid._grid).to.have.length 10
            expect(grid._grid[0]).to.have.length 20

    it 'get', ->
        it 'should exist', ->
            expect(grid.get).to.be.a 'function'
        it 'should retrieve a grid coordinate', ->
            result = grid.get 7, 7
            expect(result).to.equal 0

    it 'set', ->
        it 'should exist', ->
            expect(grid.set).to.be.a 'function'
        it 'should set a grid coordinate', ->
            grid.set(7, 7, 2)
            result = grid.get 7, 7
            expect(result).to.equal 2

describe 'Grid instantiated with missing arguments', ->
    it 'should throw an error', ->
        expect(App.Grid).to.throw Error