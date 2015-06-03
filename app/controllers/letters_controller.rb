class LettersController < ApplicationController
  def index
    @letters = Letter.order(name: :asc).limit(50)
  end

  def upvote
    @letter = Letter.find(params[:id])
    @letter.update_attribute :score, @letter.score + 1
    LetterRedisRepository.increment @letter
    MessageWorker.perform_async "Anonymous", <<EOF, letters_url
The letter #{@letter.name} has been upvoted
EOF
    redirect_to letters_path, notice: "Upvoted the letter"
  end

  def downvote
    @letter = Letter.find(params[:id])
    @letter.update_attribute :score, @letter.score - 1
    LetterRedisRepository.decrement @letter
    MessageWorker.perform_async "Anonymous", <<EOF, letters_url
The letter #{@letter.name} has been downvoted
EOF

    redirect_to letters_path, notice: "Downvoted the letter"
  end
end
