defmodule GifGenerator do
  @moduledoc """
  Documentation for `GifGenerator`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GifGenerator.hello()
      :world

  """
  def hello do
    :world
  end


  def generate(theme) do
    {:ok, <<1,2,3,4,5>>}
  end

  defp image_url(theme) do
    %{"data" => %{"image_url" => image_url}} = GiphyEx.Gifs.random(theme)

    {:ok, image_url}
  end

  defp download_image(url) do
    {:ok, <<1,2,3,4,5>>}
  end

end
