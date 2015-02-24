describe 'SafeZone', ->

  beforeEach(module('stocks'))

  beforeEach inject (SafeZone) ->
    @safeZone = SafeZone
    @round = (value) ->
      Math.round(value * 100) / 100

    @data =  [{ trade_date: "2010-04-19", close: '114.47', low: '110.30', high: '115.90' },
        { trade_date: "2015-04-20", close: '114.83', low: '113.75', high: '116.40' },
        { trade_date: "2015-04-23", close: '112.00', low: '111.68', high: '114.05' },
        { trade_date: "2015-04-24", close: '112.67', low: '112.28', high: '114.75' },
        { trade_date: "2015-04-25", close: '114.85', low: '111.99', high: '114.85' },
        { trade_date: "2015-04-26", close: '113.74', low: '113.68', high: '116.70' },
        { trade_date: "2015-04-27", close: '116.20', low: '114.55', high: '116.90' },
        { trade_date: "2015-04-30", close: '115.14', low: '114.72', high: '118.05' },
        { trade_date: "2015-05-01", close: '118.51', low: '114.90', high: '118.65' },
        { trade_date: "2015-05-02", close: '115.40', low: '113.74', high: '118.95' },
        { trade_date: "2015-05-03", close: '113.70', low: '112.35', high: '115.10' },
        { trade_date: "2015-05-04", close: '115.86', low: '111.20', high: '115.86' },
        { trade_date: "2015-05-07", close: '115.90', low: '115.00', high: '117.25' },
        { trade_date: "2015-05-08", close: '117.70', low: '115.50', high: '117.75' }]

  it 'returns the expected value', ->
    expect(@round(@safeZone.calculate(@data, { period: 10 }))).toEqual(113.51)

  it 'returns the expected value', ->
    @data.push( { trade_date: "2015-05-09", close: '116.98', low: '115.30', high: '118.18' })
    expect(@round(@safeZone.calculate(@data, { period: 10 }))).toEqual(113.35)

  it 'returns the expected value', ->
    @data.push( { trade_date: "2015-05-09", close: '116.98', low: '115.30', high: '118.18' })
    @data.push( { trade_date: "2015-05-10", close: '115.20', low: '115.20', high: '118.90' })
    expect(@round(@safeZone.calculate(@data, { period: 10 }))).toEqual(113.60)

  it 'returns the expected value', ->
    @data.push( { trade_date: "2015-05-09", close: '116.98', low: '115.30', high: '118.18' })
    @data.push( { trade_date: "2015-05-10", close: '115.20', low: '115.20', high: '118.90' })
    @data.push( { trade_date: "2015-05-11", close: '111.81', low: '110.96', high: '114.15' })
    expect(@round(@safeZone.calculate(@data, { period: 10 }))).toEqual(108.21)
