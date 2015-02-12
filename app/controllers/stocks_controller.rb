class StocksController < ApplicationController
  def index
  end

  def create
    @stock = YahooFinance.quotes([params[:stocks]])
  end

  def show
    @stock = YahooFinance.quotes([params[:stocks]])
  end
end
