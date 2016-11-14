def brackets(bracket_string)

  stack = []
  openers_map = {
    '[' => ']'
    '(' => ')'
    '{' => '}'
  }

  closers = openers_map.values
  bracket_string.length.times do |i|
    char = bracket_string[i]

    # truthy if char is an opener
    if openers_map[char]
      # push bracket onto the stack
      stack << char

    elsif closers.include?(char)
      # not matched if you get a closer without opener
      return false if stack.empty?

      # not matched if your closer doesn't match with top of stack
      last = stack.pop
      return false if openers_map[last] != char
    end
  end

  # if you made it this far, it's true with an empty stack; false otherwise
  stack.empty?
end