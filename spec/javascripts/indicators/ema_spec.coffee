describe 'EMA', ->

  beforeEach(module('stocks'))

  beforeEach inject (EMA) ->
    @ema = EMA
    @round = (value) ->
      Math.round(value * 100) / 100
    @data =  [{ trade_date: "2010-03-24", close: '22.27' },
        { trade_date: "2015-03-25", close: '22.19' },
        { trade_date: "2015-03-26", close: '22.08' },
        { trade_date: "2015-03-29", close: '22.17' },
        { trade_date: "2015-03-30", close: '22.18' },
        { trade_date: "2015-03-31", close: '22.13' },
        { trade_date: "2015-04-01", close: '22.23' },
        { trade_date: "2015-04-05", close: '22.43' },
        { trade_date: "2015-04-06", close: '22.24' },
        { trade_date: "2015-04-07", close: '22.29' }]

    @options = { period: 10 }
  it 'returns nothing if the range is too short', ->
    expect(@ema.calculate([], @options)).toEqual(undefined)

  it 'returns the correct value for correct range', ->
    expect(@round(@ema.calculate(@data, @options))).toEqual(22.22)

  it 'is correct with an additional value', ->
    @data.push({ trade_date: '2015-04-08', close: 22.15 })
    expect(@round(@ema.calculate(@data, @options))).toEqual(22.21)

  it 'is correct with an additional value', ->
    @data.push({ trade_date: '2015-04-08', close: 22.15 })
    @data.push({ trade_date: '2015-04-09', close: 22.39 })
    expect(@round(@ema.calculate(@data, @options))).toEqual(22.24)

  it 'is correct with an additional value', ->
    @data.push({ trade_date: '2015-04-08', close: 22.15 })
    @data.push({ trade_date: '2015-04-09', close: 22.39 })
    @data.push({ trade_date: '2015-04-12', close: 22.38 })
    expect(@round(@ema.calculate(@data, @options))).toEqual(22.27)

  it 'is correct with an additional value', ->
    @data.push({ trade_date: '2015-04-08', close: 22.15 })
    @data.push({ trade_date: '2015-04-09', close: 22.39 })
    @data.push({ trade_date: '2015-04-12', close: 22.38 })
    @data.push({ trade_date: '2015-04-13', close: 22.61 })
    @data.push({ trade_date: '2015-04-14', close: 23.36 })
    @data.push({ trade_date: '2015-04-15', close: 24.05 })
    @data.push({ trade_date: '2015-04-16', close: 23.75 })
    expect(@round(@ema.calculate(@data, @options))).toEqual(22.97)
