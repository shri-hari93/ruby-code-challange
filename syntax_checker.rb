# frozen_string_literal: true

class SyntaxChecker
  BRACKET_MATCHER = { '[' => ']', '<' => '>', '{' => '}', '(' => ')' }.freeze

  RULES = {
    rule_1: 'Expression must contain only brackets or empty',
    rule_2: 'For a closing bracket "%{bracket}", there must be an opening of the same type before',
    rule_3: 'For a closing bracket type "%{bracket}", must match the last opening bracket type ' \
      '"%{last_opening_bracket}" that is opened before and has not been closed',
    rule_4: 'For a opening bracket "%{bracket}", there must be a closing one of the same type',
  }.freeze

  @@message = ''

  # Verifying given expression statisfying all the rules
  def self.verify(expression)
    
  end

  # Verifying brackets in the expression follow rule_2, rule_3 and rule_4
  def self.verify_brackets(expression)
  end

  # Displays message for the recent self.verify 
  def self.message
  end

  private_class_method :verify_brackets
end