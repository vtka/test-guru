# GistQuestionService class
class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  class Success
    attr_reader :url, :id

    def initialize(url:, id:)
      @url = url
      @id = id
    end

    def success?
      true
    end
  end

  def call
    response = @client.create_gist(gist_params)
    if response.html_url.present?
      Success.new(url: response.html_url, id: response.id)
    end
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def gist_params
    {
      "description": "A question about #{@test.title} from TestGuru",
      "files": {
        "test-guru-question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join('\n')
  end
end
