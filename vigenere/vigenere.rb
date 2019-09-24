def encrypt(text, key, action)
  m = 0
  k = 0
  space_count = 0
  upper = true
  alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')
  text_to_encrypt = text.split('')
  key_char_array = key.upcase.split('')
  encrypted_text_array = []
  for i in 0..text_to_encrypt.length - 1 do
    if text_to_encrypt[i] == ' '
      encrypted_text_array[i] = ' '
      space_count += 1
    elsif text_to_encrypt[i] == '\r'
      encrypted_text_array[i] = '\r'
      space_count += 1
    elsif text_to_encrypt[i] == '\n'
      encrypted_text_array[i] = '\n'
      space_count += 1
    elsif text_to_encrypt[i] == '.'
      encrypted_text_array[i] = '.'
      space_count += 1
    else
      text_to_encrypt[i] == text_to_encrypt[i].upcase ? upper = true : upper = false
      for_key = (i - space_count) % key.length
      for j in 0..alphabet.length - 1 do
        m = j if text_to_encrypt[i].upcase == alphabet[j]
        k = j if key_char_array[for_key] == alphabet[j]
      end
      for n in 0..alphabet.length - 1 do
        if action == 'encrypt'
          if (n == (m + k) % 26)
            upper == true ? encrypted_text_array[i] = alphabet[n].upcase : encrypted_text_array[i] = alphabet[n].downcase
          end
        elsif action == 'decipher'
          if (n == (((m - k) + 26) % 26))
            upper == true ? encrypted_text_array[i] = alphabet[n].upcase : encrypted_text_array[i] = alphabet[n].downcase
          end
        end
      end
    end
  end
  encrypted_text = encrypted_text_array.join('')
  encrypted_text
end

puts 'Jeigu nori sifruoti spauskite 1, jeigu norite desifruoti spauskite 2'
pasirinkimas = gets.chomp
pasirinkimas == 1 ? pasirinkimas = 'encrypt' : pasirinkimas = 'decipher'
puts 'irasykite zodi'
zodis = gets.chomp
puts 'irasykite rakta'
raktas = gets.chomp
puts 'gautas tekstas:'
puts encrypt(zodis, raktas, pasirinkimas)
