class LetterRedisRepository
  def self.top
    redis = Redis.new
    list = redis.zrevrange 'top_letters', 0, 9

    if list.empty?
      letters = Letter.limit(10).order(score: :desc)
      letters.each do |letter|
        redis.zadd "top_letters", letter.score, letter.id
      end
      return letters.map(&:id)
    else
      return list
    end

    letters
  end
end
