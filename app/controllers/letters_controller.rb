class LettersController < ApplicationController
  def index
    @letters = Letter.order(name: :asc).limit(50)
  end
end
