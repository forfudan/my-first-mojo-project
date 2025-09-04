# src/basic/control/repeat_until_in_ruby.rb
def main
  prev = 0
  curr = 1
  threshold = 1_000_000_000

  begin
    prev, curr = curr, prev + curr
  end until curr > threshold
  puts "First Fibonacci number > #{threshold}: #{curr}"
end

main