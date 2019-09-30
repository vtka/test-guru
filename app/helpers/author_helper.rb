module AuthorHelper
  def github_url(author, repo)
    "#{author} | #{repo}"
    link_to "#{author}", "https://github.com/#{author}/#{repo}"
  end
end
