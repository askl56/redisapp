require 'letter_redis_repository'

class Letter < ActiveRecord::Base
  def self.top_10
    ids = LetterRedisRepository.top
    where(id: ids).order(score: :desc)
  end
end
