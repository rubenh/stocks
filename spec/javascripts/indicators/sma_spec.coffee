describe 'SMA', ->

  beforeEach(module('stocks'))

  beforeEach inject (SMA) ->
    @sma = SMA

  it 'returns nothing if the range is too short', ->
    expect(@sma.calculate([], { period: 10 })).toEqual(undefined)

  it 'returns something if the range is correct', ->
    range = [{ trade_date: "2015-02-01", close: '11' },
      { trade_date: "2015-02-02", close: '12' },
      { trade_date: "2015-02-03", close: '13' },
      { trade_date: "2015-02-04", close: '14' },
      { trade_date: "2015-02-05", close: '15' }
    ]
    expect(@sma.calculate(range, { period: 5 })).toEqual(13)

  it 'returns the correct value', ->
    range = [{ trade_date: "2015-02-01", close: '11' },
      { trade_date: "2015-02-02", close: '12' },
      { trade_date: "2015-02-03", close: '13' },
      { trade_date: "2015-02-04", close: '14' },
      { trade_date: "2015-02-05", close: '15' },
      { trade_date: "2015-02-06", close: '16' }
    ]

    expect(@sma.calculate(range, { period: 5 })).toEqual(14)
