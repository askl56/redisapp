class LetterRedisRepository
  def self.top
    list = redis.zrevrange "top_letters", 0, 9

    if list.empty?
      letters = Letter.limit(10).order(score: :desc)
      letters.each do |letter|
        redis.zadd "top_letters", letter.score, letter.id
      end
      return letters.map(&:id)
    else
      return list
    end
  end

  def self.increment letter
    redis.zincrby "top_letters", 1, letter.id
  end

  def self.decrement letter
    redis.zincrby "top_letters", -1, letter.id
  end

  private

  def self.redis
    @redis ||= Redis.new
  end
end
