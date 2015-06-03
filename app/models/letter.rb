class Letter < ActiveRecord::Base
  def self.top_10
    ids = LetterRedisRepository.top
    where(id: ids)
  end
end
