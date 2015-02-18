describe 'Stock', ->

  beforeEach(module('stocks'))

  beforeEach inject (Stock) ->
    @stock = new Stock('FOO')
    @round = (value) ->
      Math.round(value * 100) / 100

  it 'sets the symbol to FOO', ->
    expect(@stock.symbol).toBe('FOO')


  describe 'smaAt', ->

    describe 'scenario 1', ->
      beforeEach ->
        @stock.historicalData = [{ trade_date: "2015-02-01", close: '11' },
        { trade_date: "2015-02-02", close: '12' },
        { trade_date: "2015-02-03", close: '13' },
        { trade_date: "2015-02-04", close: '14' },
        { trade_date: "2015-02-05", close: '15' },
        { trade_date: "2015-02-06", close: '16' },
        { trade_date: "2015-02-07", close: '17' }]

      it 'has a SMA5 of 13 at 2015-02-05', ->
        expect(@stock.smaAt('2015-02-05', 5)).toBe(13)

      it 'has a SMA5 of 14 at 2015-02-06', ->
        expect(@stock.smaAt('2015-02-06', 5)).toBe(14)

    describe 'scenerio 2', ->
      beforeEach ->
        @stock.historicalData = [{ trade_date: "2010-03-24", close: '22.27' },
        { trade_date: "2015-03-25", close: '22.19' },
        { trade_date: "2015-03-26", close: '22.08' },
        { trade_date: "2015-03-29", close: '22.17' },
        { trade_date: "2015-03-30", close: '22.18' },
        { trade_date: "2015-03-31", close: '22.13' },
        { trade_date: "2015-04-01", close: '22.23' },
        { trade_date: "2015-04-05", close: '22.43' },
        { trade_date: "2015-04-06", close: '22.24' },
        { trade_date: "2015-04-07", close: '22.29' },
        { trade_date: "2015-04-08", close: '22.15' },
        { trade_date: "2015-04-09", close: '22.39' },
        { trade_date: "2015-04-12", close: '22.38' },
        { trade_date: "2015-04-13", close: '22.61' },
        { trade_date: "2015-04-14", close: '23.36' },
        { trade_date: "2015-04-15", close: '24.05' },
        { trade_date: "2015-04-16", close: '23.75' }]

      it 'calculates correct SMA', ->
        expect(@round(@stock.smaAt('2015-04-07', 10))).toBe(22.22)



