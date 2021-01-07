defmodule ReactSurface do
  @moduledoc """
  Documentation for `ReactSurface`.
  """

  @spec ssr(String.t(), map(), Keyword.t()) :: String.t()
  def ssr(component_name, props, opts \\ []) do
    {:ok, %{markup: html}} = fetch_component(component_name, props, opts)
    html
  end

  defp fetch_component(name, props, _opts) do
    Application.ensure_all_started(:node_ssr)
    NodeSsr.render(name, props)
  end


  def default_opts() do
    script_path = "#{File.cwd!()}/assets"
    [ssr_script: script_path, component_path: "#{script_path}/js/components"]
  end
end
