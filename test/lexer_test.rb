require "test_helper"
require "lexer"

class LexerTest < Test::Unit::TestCase
  def test_number
    assert_equal [[:NUMBER, 1]], Lexer.new.tokenize("1")
  end

  def test_array
    assert_equal [[:ARRAY, "1,2"]], Lexer.new.tokenize("[1,2]")
  end

  def test_string
    assert_equal [[:STRING, "hi"]], Lexer.new.tokenize('"hi"')
  end

  def test_identifier
    assert_equal [[:IDENTIFIER, "name"]], Lexer.new.tokenize('name')
  end

  def test_constant
    assert_equal [[:CONSTANT, "Name"]], Lexer.new.tokenize('Name')
  end

  def test_operator
    assert_equal [["+", "+"]], Lexer.new.tokenize('+')
    assert_equal [["||", "||"]], Lexer.new.tokenize('||')
  end

  def test_indent
    code = load_test_code "example_1.bio"
    tokens = eval load_test_code "example_1.tokens"
    assert_equal tokens, Lexer.new.tokenize(code)
  end
end

