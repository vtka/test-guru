# # GitHub Client
# class GitHubClient
#   ROOT_ENDPOINT = 'https://api.github.com'.freeze
#   ACCESS_TOKEN = '89a087c145865e1c6accec011039e48a501510c2'.freeze

#   def initialize
#     @http_client = setup_http_client
#   end

#   def create_gist(params)
#     @htttp_client.post('gists') do |request|
#       request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
#       request.headers['Content-Type'] = 'application/json'
#       request.body = params.to_json
#     end
#   end

#   private

#   def setup_http_client
#     Faraday.new(url: ROOT_ENDPOINT)
#   end
# end
