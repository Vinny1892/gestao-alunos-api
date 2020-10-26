defmodule GestaoAlunosWeb.ErrorView do
  use GestaoAlunosWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("404.json", _assigns) do
    %{errors: %{detail: "not found"}}
  end

  def render("405.json" ,_assigns) do
    %{errors: %{detail: "method not allowed"}}
   end
  def render("500.json",  assigns) do
    IO.inspect "aqui"
    seila =  List.first(assigns.stack)
    {_,_,errors,_} = seila
    [_,mapErrors] = errors
    %{changeset: changeset} = mapErrors
    [error] = changeset.errors
    %{errors: %{detail: "problem in server contact Bulhoes Diego"}}
  end


  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  # def template_not_found(template, _assigns) do
  #   %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  # end

end
