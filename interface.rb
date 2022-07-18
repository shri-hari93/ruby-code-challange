# frozend_string_literal: true

require "./syntax_checker"

puts "Enter multiline expression ending with a 'exit'"
expressions = gets("exit\n").gsub("exit\n", "").lines.map(&:strip)

expressions.each do |expression| 
    puts "#{expression.empty? ? '""' : expression } is " \
        "#{SyntaxChecker.verify(expression) ? "Valid" : "Invalid: (reason) -> #{SyntaxChecker.message}"}"
end
