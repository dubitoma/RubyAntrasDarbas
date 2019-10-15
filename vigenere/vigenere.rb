# frozen_string_literal: true

def encrypt(text, key, action)
  space_count = 0
  text_to_encrypt = text.split('')
  encrypted_array = []
  each_in_text_encrypt(text_to_encrypt, encrypted_array,
                       space_count, key, action)
  get_joined_string(encrypted_array)
end

def each_in_text_encrypt(text_to_encrypt, encrypted_array,
                         space_count, key, action)
  text_to_encrypt.each_with_index do |char, index|
    if text_to_encrypt[index] == ' ' || text_to_encrypt[index] == '\r'
      encrypted_array[index] = char
      space_count += 1
    else
      encrypt_process(text_to_encrypt, encrypted_array, key.upcase.split(''),
                      index, [0, key, action])
    end
  end
  text_to_encrypt
end

def get_joined_string(encrypted_array)
  encrypted_text = encrypted_array.join('')
  encrypted_text
end

def encrypt_process(text_to_encrypt, encrypted_array, key_arr, index, vars)
  alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')
  for_key = (index - vars[0]) % vars[1].length
  m = get_m_k(alphabet, index, text_to_encrypt, key_arr, for_key)[0]
  k = get_m_k(alphabet, index, text_to_encrypt, key_arr, for_key)[1]
  change_letters_in(vars[2], [m, k, index], alphabet,
                    encrypted_array, check_upper(text_to_encrypt, index))
end

def check_upper(text_to_encrypt, index)
  upper = (text_to_encrypt[index] == text_to_encrypt[index].upcase)
  upper
end

def get_m_k(alphabet, index, text_to_encrypt, key_char_array, for_key)
  m = 0
  k = 0
  alphabet.each_with_index do |_letter, index_next|
    m = index_next if text_to_encrypt[index].upcase == alphabet[index_next]
    k = index_next if key_char_array[for_key] == alphabet[index_next]
  end
  [m, k]
end

def change_letters_in(action, nums, alphabet, encrypted_text_array, upper)
  alphabet.each_with_index do |_letter, n|
    change_letters(action, [n, nums[0], nums[1], nums[2]], alphabet,
                   encrypted_text_array, upper)
  end
end

def change_letters(action, num, alphabet, encrypted_text_array, upper)
  if action == 'encrypt'
    encrypt_method(num, alphabet, encrypted_text_array, upper)
  elsif action == 'decipher'
    decipher_method(num, alphabet, encrypted_text_array, upper)
  end
end

def encrypt_method(num, alphabet, encrypted_text_array, upper)
  return unless num[0] == (num[1] + num[2]) % 26

  alp = alphabet
  encr = encrypted_text_array
  encr[num[3]] = (upper == true ? alp[num[0]].upcase : alp[num[0]].downcase)
end

def decipher_method(num, alphabet, encrypted_text_array, upper)
  return unless num[0] == (((num[1] - num[2]) + 26) % 26)

  alp = alphabet
  encr = encrypted_text_array
  encr[num[3]] = (upper == true ? alp[num[0]].upcase : alp[num[0]].downcase)
end

puts 'Jeigu nori sifruoti spauskite 1, jeigu norite desifruoti spauskite 2'
pasirinkimas = gets.chomp
pasirinkimas = (pasirinkimas == '1' ? 'encrypt' : 'decipher')
puts 'irasykite zodi'
zodis = gets.chomp
puts 'irasykite rakta'
raktas = gets.chomp
puts 'gautas tekstas:'
puts encrypt(zodis, raktas, pasirinkimas)
