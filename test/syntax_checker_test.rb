require 'test/unit'
require './syntax_checker'

class SyntaxCheckerTest < Test::Unit::TestCase

    def test_rule_1
        assert_equal(true, SyntaxChecker.verify(""))
        assert_equal(true, SyntaxChecker.verify("<<>>"))
        assert_equal(false, SyntaxChecker.verify("<abd>"))
    end

    def test_rule_1_error_message
        SyntaxChecker.verify("<abd>")
        assert_equal(SyntaxChecker::RULES[:rule_1], SyntaxChecker.message)
    end

    def test_rule_2
        assert_equal(true, SyntaxChecker.verify("<>"))
        assert_equal(true, SyntaxChecker.verify("[[[]]]"))
        assert_equal(true, SyntaxChecker.verify("{{{}}}"))
        assert_equal(true, SyntaxChecker.verify("(((())))"))
        
        assert_equal(false, SyntaxChecker.verify("<>()]"))
        assert_equal(false, SyntaxChecker.verify("[])<>"))
        assert_equal(false, SyntaxChecker.verify("]()"))
    end

    def test_rule_2_error_message
        SyntaxChecker.verify("]()")
        assert_equal(SyntaxChecker::RULES[:rule_2]  % { bracket: "]" }, SyntaxChecker.message)
    end

    def test_rule_3
        assert_equal(true, SyntaxChecker.verify("{}"))
        assert_equal(true, SyntaxChecker.verify("<>[]"))

        assert_equal(false, SyntaxChecker.verify("<]"))
        assert_equal(false, SyntaxChecker.verify("<>(){]"))
    end

    def test_rule_3_error_message
        SyntaxChecker.verify("<>(){]")
        assert_equal(SyntaxChecker::RULES[:rule_3] % { bracket: "]", last_opening_bracket: "{" }, SyntaxChecker.message)
    end

    def test_rule_4
        assert_equal(true, SyntaxChecker.verify("([])"))
        assert_equal(true, SyntaxChecker.verify("([]<>)"))

        assert_equal(false, SyntaxChecker.verify("[()"))
        assert_equal(false, SyntaxChecker.verify("<><"))
    end

    def test_rule_4_error_message
        SyntaxChecker.verify("[()")
        assert_equal(SyntaxChecker::RULES[:rule_4]  % { bracket: "[" }, SyntaxChecker.message)
    end
end
