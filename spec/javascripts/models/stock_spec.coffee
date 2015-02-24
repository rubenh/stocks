describe 'Stock', ->

  beforeEach(module('stocks'))

  beforeEach inject (Stock) ->
    @stock = new Stock('FOO')
    @round = (value) ->
      Math.round(value * 100) / 100

  it 'sets the symbol to FOO', ->
    expect(@stock.symbol).toBe('FOO')
