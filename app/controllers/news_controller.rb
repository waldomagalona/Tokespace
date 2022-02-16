class NewsController < ApplicationController
    def main
        client = Client.new
        @headlines = client.headlines
        @updates = client.coin_updates
    end
end