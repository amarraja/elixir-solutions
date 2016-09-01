defmodule Issues.GithubIssues do
  require Logger

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get!([{ "User-agent", "elixir" }])
    |> handle_response
  end

  @github_url Application.get_env(:issues, :github_url)
  defp issues_url(user, project) do
    url = "#{@github_url}/repos/#{user}/#{project}/issues"
    Logger.info "Hitting: #{url}"
    url
  end

  defp handle_response(%{ status_code: 200, body: body }) do
    { :ok, :jsx.decode(body) }
  end

  defp handle_response(%{ status_code: _, body: body }) do
    { :error, :jsx.decode(body) }
  end

end
