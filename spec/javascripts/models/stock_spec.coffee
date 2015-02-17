describe 'SMA', ->

  beforeEach(module('stocks'))

  beforeEach inject (Stock) ->
    @stock = new Stock('FOO')

  it 'sets the symbol to FOO', ->
    expect(@stock.symbol).toBe('FOO')

  describe 'smaAt', ->

    beforeEach ->
      @stock.historicalData = [{ trade_date: "2015-02-01", close: '11' },
      { trade_date: "2015-02-02", close: '12' },
      { trade_date: "2015-02-03", close: '13' },
      { trade_date: "2015-02-04", close: '14' },
      { trade_date: "2015-02-05", close: '15' },
      { trade_date: "2015-02-06", close: '16' },
      { trade_date: "2015-02-07", close: '17' }]

    it 'has a SMA5 of 13 at 2015-02-06', ->
      expect(@stock.smaAt('2015-02-06', 5)).toBe(13)

    it 'has a SMA5 of 14 at 2015-02-07', ->
      expect(@stock.smaAt('2015-02-07', 5)).toBe(14)
