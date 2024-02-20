HEX_CHARS = %w[0 1 2 3 4 5 6 7 8 9 a b c d e f A B C D E F]
UUID_STRUCTURE = [8,4,4,4,12]
def make_UUID
  uuid = []
  UUID_STRUCTURE.each do |num_characters|
    substr = ''
    num_characters.times do
      substr << HEX_CHARS.sample
    end
    uuid << substr
  end
  uuid.join('-')
end

p make_UUID