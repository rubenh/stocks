#= require spec_helper
describe 'SMA', ->

  beforeEach(module('stocks'))

  beforeEach(inject (SMA) ->
    @sma = SMA
  )

  it 'returns nothing if the range is too short', ->
    expect(@sma.plottableData([], 10)).toEqual([])

  it 'returns something if the range is correct', ->
    range = [{ trade_date: "2015-02-01", close: '11' },
      { trade_date: "2015-02-02", close: '12' },
      { trade_date: "2015-02-03", close: '13' },
      { trade_date: "2015-02-04", close: '14' },
      { trade_date: "2015-02-05", close: '15' },
      { trade_date: "2015-02-06", close: '16' },
      { trade_date: "2015-02-07", close: '17' }
    ]

    expect(@sma.plottableData(range, 5)).toEqual([[Date.parse("2015-02-06"), 13], [Date.parse("2015-02-07"), 14]])
