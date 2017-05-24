$sim_err = false

def lookup; [1, 2, 3, 4]; end

def process(email, dob, &block)
  return 'error' if $sim_err

  tmp = lookup
  tmp = block_given? ? block.call(tmp) : tmp

  if tmp.length != 1
    return 'error'
  end

  return 'ok'
end

tmp = process('a', 'b') do |members|
  members.find_all { |m| m.even? }
end

puts tmp.inspect
