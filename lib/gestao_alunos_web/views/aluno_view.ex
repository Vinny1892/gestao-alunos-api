defmodule GestaoAlunosWeb.UserView do
   use GestaoAlunosWeb , :view

   def render("show.json", %{aluno: aluno }) do
      %{ nome: aluno.nome  , rga: aluno.rga  , curso: aluno.curso }
   end


end
