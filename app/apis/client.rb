class Client
    NEWS_URL = "https://cryptopanic.com"
    UPDATES_URL = "https://api.coingecko.com"

    def headlines
        connection = Faraday.new(NEWS_URL)
        response = connection.get("/api/v1/posts/?auth_token=#{Rails.application.credentials.news[:key]}&kind=news")
        JSON.parse(response.body)
    end

    def coin_updates
        connection = Faraday.new(UPDATES_URL)
        response = connection.get("/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false")
        JSON.parse(response.body)
    end
end