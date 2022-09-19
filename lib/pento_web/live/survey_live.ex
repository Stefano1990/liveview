defmodule PentoWeb.SurveyLive do
  use PentoWeb, :live_view
  alias Pento.Survey
  alias PentoWeb.SurveyLive.Component
  alias PentoWeb.DemographicLive

  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> assign_demographic()
    }
  end

  defp assign_demographic(socket = %{assigns: %{current_user: current_user}}) do
    assign(
      socket,
      :demographic,
      Survey.get_demographic_by_user(current_user)
    )
  end
end
