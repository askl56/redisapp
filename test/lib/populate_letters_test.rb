require "minitest/autorun"
require "populate_letters"

describe PopulateLetters do
  it "populates an array from A to Z" do
    service = PopulateLetters.new
    service.execute

    service.letters.join("").must_equal(("A".."Z").to_a.join(""))
  end

  it "populates a two letters deep array (AA -> ZZ)" do
    service = PopulateLetters.new 2
    service.execute
    service.letters.must_include "AA"
  end

  it "populates a three letters deep array (AAA -> ZZZ)" do
    service = PopulateLetters.new 3
    service.execute

    service.letters.must_include "AAA"
  end
end
