defmodule Game.Goal.DummyGenerator do
    @behaviour Game.Goal.Api

    def generate do
        Enum.random(["palabraclave","hangman","fortune","dummy"])
    end 
end