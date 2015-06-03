class LettersController < ApplicationController
  def index
    @letters = Letter.order(name: :asc).limit(50)
  end

  def upvote
    @letter = Letter.find(params[:id])
    @letter.update_attribute :score, @letter.score + 1
    LetterRedisRepository.increment @letter

    redirect_to letters_path, notice: "Upvoted the letter"
  end

  def downvote
    @letter = Letter.find(params[:id])
    @letter.update_attribute :score, @letter.score - 1
    LetterRedisRepository.decrement @letter

    redirect_to letters_path, notice: "Downvoted the letter"
  end
end
