defmodule ExFactorioApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_factorio_api,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [
      extra_applications: [
        :logger
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      # For accessing and parsing/running lua files to get information
      {:luerl, git: "https://github.com/rvirding/luerl", branch: "new-engine", compile: "make && cp src/luerl.app.src ebin/luerl.app"},
      # For Parsing JSON, especially Factorio 0.15+ native blueprints
      {:poison, "~> 3.1"},
      # For development-time code consistency checking
      {:credo, "~> 0.7", only: [:dev, :test]}
    ]
  end
end
