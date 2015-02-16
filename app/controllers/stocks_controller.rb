class StocksController < ApplicationController

  def info
    @stock = YahooFinance.quotes([params[:stock]])
  end

  def historical
    @stock = YahooFinance.historical_quotes(params[:stock]).reverse!
  end

end
