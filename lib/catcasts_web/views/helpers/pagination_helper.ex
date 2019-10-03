defmodule CatcastsWeb.Helpers.PaginationHelper do
  use Phoenix.HTML

  def paginate_links(conn, list) do
    first = prev_button(conn, list)
    pages = page_buttons(conn, list)
    last = next_button(conn, list)

    content_tag(:div, [first, pages, last], class: "inline-flex")
  end

  defp prev_button(conn, list) do
    page = list.page - 1
    params = build_params(conn, page)

    if list.has_prev do
      link to: "?#{params}",
        rel: "prev",
        class: "bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-1" do
          "<"
      end
    else
      content_tag :span, class: "bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-1 cursor-default" do
        "<"
      end
    end
  end

  defp page_buttons(conn, list) do
    for page <- 1..list.count do
      params = build_params(conn, page)

      link(page,
            to: "?#{params}",
            class: "bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-1"
      )
    end
  end

  defp next_button(conn, list) do
    page = list.page + 1
    params = build_params(conn, page)

    if list.has_next do
      link to: "?#{params}",
        rel: "next",
        class: "bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-r" do
          ">"
        end
    else
      content_tag :span, class: "bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-r cursor-default" do
        ">"
      end
    end
  end

  defp build_params(conn, page) do
    conn.query_params |> Map.put("page", page) |> URI.encode_query()
  end
end
