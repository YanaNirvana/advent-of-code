require 'pry-nav'

class AlchemicalReduction

  def polymer_reactions_dictionary
    dictionary = {}
    ('a'..'z').to_a.each do |letter|
      dictionary[letter] = letter.upcase
      dictionary[letter.upcase] = letter
    end
    dictionary
  end

  def initialize(polymer)
    @polymer = polymer
  end

  def react
    polymer_dup = @polymer.dup
    i = 0
    last_monomer = nil

    while i < polymer_dup.length
      current_monomer = polymer_dup[i]
      binding.pry

      case last_monomer
      when nil
        last_monomer = current_monomer
        i += 1
      when self.polymer_reactions_dictionary[current_monomer]
        last_monomer = nil
        polymer_dup.delete_at(i)
        polymer_dup.delete_at(i-1)
        i = i - 2
      else
        last_monomer = current_monomer
        i += 1
      end

    end

    polymer_dup
  end

end

# input = File.open('input_05.rb').collect {|l| l}.first.split('')
# input.pop
# sample = 'dabAcCaCBAcCcaDA'.split('')
#
# abc_lowercase = ('a'..'z').to_a
#
# pairs = {}
# abc_lowercase.each.with_index do |letter, i|
#   pairs[letter] = letter.upcase
#   pairs[letter.upcase] = letter
# end
#
# def remove_pairs(letters_array, pairs)
#
#   i = 0
#   last_char = nil
#
#   while i < letters_array.length - 1
#     current_char = letters_array[i]
#
#     case last_char
#     when nil
#       last_char = current_char
#       i += 1
#     when pairs[current_char]
#       last_char = nil
#       letters_array.delete_at(i)
#       letters_array.delete_at(i-1)
#       i = i - 2
#     else
#       last_char = current_char
#       i += 1
#     end
#
#   end
#
#   letters_array
# end
#
# # for solution to 5.1
# p remove_pairs(input, pairs).length
#
# def remove_one_monomer(letters_array, monomer)
#   ret = letters_array.select do |letter|
#     letter != monomer.upcase && letter != monomer.downcase
#   end
# end
#
# def length_after_removing_worst_polymer(letters_array, pairs)
#   abc = ('a'..'z').to_a
#
#   current_shortest = nil
#
#   abc.each do |letter|
#     letters_sans_problematic_polymer = remove_one_monomer(letters_array, letter)
#     binding.pry
#     length_after_pairing = remove_pairs(letters_sans_problematic_polymer, pairs).length
#     if current_shortest.nil? || current_shortest > length_after_pairing
#       current_shortest = length_after_pairing
#     end
#     p current_shortest
#   end
#
# end
#
# length_after_removing_worst_polymer(samplenext, pairs)
