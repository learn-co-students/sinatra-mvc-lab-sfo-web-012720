class PigLatinizer
    attr_accessor :entry

    def piglatinize(words)
        words_arr = words.split(" ")
        out_arr = words_arr.map { |word| piglatinize_word(word) }
        out_arr.join(' ')
    end
    
    def vowel_pos(word)
        vowels = ['a', 'e', 'i', 'o', 'u','A', 'E', 'I', 'O', 'U']
        vowels.map { |vowel| word.split("").find_index(vowel) }.compact.min
    end
    
    def piglatinize_word(word)
        if vowel_pos(word) == 0
            out = word + "way"
        elsif vowel_pos(word) == nil
            out = word
        else
            con = word[0, vowel_pos(word)]
            rest = word[vowel_pos(word), word.length - 1]
            out = rest + con + "ay"
        end
        out
    end

end