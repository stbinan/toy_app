class GameOfLife
  currentCellGeneration: null
  cellSize: 7
  numberOfRows: 50
  numberOfColumns: 50
  seedProbability: 0.5
  tickLength: 100
  canvas: null
  drawingContext: null

  constructor: ->
    @createCanvas()
    @resizeCanvas()
    @createDrawingContext()

    @seed()

    @tick()

  createCanvas: ->
    @canvas = document.createElement 'canvas'
    document.body.appendChild @canvas

  resizeCanvas: ->
    @canvas.height = @cellSize * @numberOfRows
    @canvas.width = @cellSize * @numberOfColumns

  createDrawingContext: ->
    @drawingContext = @canvas.getContext '2d'

  seed: ->
    @currentCellGeneration = math.matrix( \
            math.zeros([@numberOfRows, @numberOfColumns]))

    for row in [0...@numberOfRows]
      for column in [0...@numberOfColumns]
        seedCell = @createSeedCell()
        @currentCellGeneration._data[row][column] = seedCell

  createSeedCell: ->
    isAlive: Math.random() < @seedProbability

  drawGrid: ->
    for row in [0...@numberOfRows]
      for column in [0...@numberOfColumns]
        @drawCell @currentCellGeneration._data[row][column], row, column

  drawCell: (cell, row, column) ->
    x = column * @cellSize
    y = row * @cellSize

    if cell.isAlive
      fillStyle = 'rgb(242, 198, 65)'
    else
      fillStyle = 'rgb(38, 38, 38)'

    @drawingContext.strokeStyle = 'rgba(242, 198, 65, 0.1)'
    @drawingContext.strokeRect x, y, @cellSize, @cellSize

    @drawingContext.fillStyle = fillStyle
    @drawingContext.fillRect x, y, @cellSize, @cellSize

  tick: =>
    @drawGrid()
    @evolveCellGeneration()

    setTimeout @tick, @tickLength

  evolveCellGeneration: ->
    newCellGeneration = math.matrix( \
            math.zeros([@numberOfRows, @numberOfColumns]))

    for row in [0...@numberOfRows]
      for column in [0...@numberOfColumns]
        evolvedCell = @evolveCell \
                @currentCellGeneration._data[row][column], row, column
        newCellGeneration._data[row][column] = evolvedCell

    @currentCellGeneration = newCellGeneration

  evolveCell: (cell, row, column) ->
    evolvedCell =
      isAlive: cell.isAlive

    numberOfAliveNeighbors = @countAliveNeighbors cell, row, column

    if cell.isAlive or numberOfAliveNeighbors is 3
      evolvedCell.isAlive = 1 < numberOfAliveNeighbors < 4

    evolvedCell

  countAliveNeighbors: (cell, row, column) ->
    lowerRowBound = Math.max row - 1, 0
    upperRowBound = Math.min row + 1, @numberOfRows - 1
    lowerColumnBound = Math.max column - 1, 0
    upperColumnBound = Math.min column + 1, @numberOfColumns - 1
    numberOfAliveNeighbors = 0

    for row2 in [lowerRowBound..upperRowBound]
      for column2 in [lowerColumnBound..upperColumnBound]
        continue if row2 is row and column2 is column

        if @currentCellGeneration._data[row2][column2].isAlive
          numberOfAliveNeighbors++

    numberOfAliveNeighbors

window.GameOfLife = GameOfLife
