defmodule IExHome do
  def colorize(string, color), do: "#{apply(IO.ANSI, color, [])}#{string}#{IO.ANSI.reset}"

  def app_name do
    if :ets.whereis(Mix.State) != :undefined,
      do: Mix.Project.get.project()[:name] || Mix.Project.get.project()[:app] || "app",
      else: "iex"
  end

  def git_branch do
    with {:ok, branch} <- _run_cmd("git", ["rev-parse", "--abbrev-ref", "HEAD"], [stderr_to_stdout: true]),
         false <- String.starts_with?(branch, "fatal: not a git repository"),
         true <- byte_size(branch) > 0 do
      " on #{branch |> String.trim() |> colorize(:cyan)}"
    else
      _ -> ""
    end
  end

  defp _run_cmd(cmd, args, opts) do
    with path when not is_nil(path) <- System.find_executable(cmd),
         {output, _} <- System.cmd(cmd, args, opts) do
      {:ok, output}
    else
      _ -> {:error, ""}
    end
  end
end

import IExHome

IEx.configure(
  default_prompt: "\n#{colorize("", :magenta)} #{colorize(app_name(), :green)}#{git_branch()}\n❯",
  history_size: 50,
  alive_prompt: "%node ❯",
  alive_prompt: "\n#{colorize("", :magenta)} #{colorize("%node", :green)}\n❯",
  colors: [
    enabled: true,
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :green,
      boolean: :red,
      nil: [:magenta, :bright],
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline],
  ],
  inspect: [pretty: true, limit: :infinity, printable_limit: :infinity]
)

if :ets.whereis(Mix.State) == :undefined do
  Mix.install([
    :req
  ])
end
