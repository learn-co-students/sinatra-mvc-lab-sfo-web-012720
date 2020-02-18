class PigLatinizer    

    def piglatinize(user_input)
        user_input.split(" ").length == 1 ? piglatinize_word(user_input) : piglatinize_sentence(user_input)

        # split = user_input.split(" ")
        # split_latinize = split.map{|word| piglatinize_word(word)}
        # split_latinize.join(" ")
    end

    def piglatinize_word(word)
        first_letter = word[0].downcase
        vowels = ['a', 'e', 'i', 'o', 'u']

        if vowels.include?(first_letter)
            "#{word}way"
        else
            if !vowels.include?(word[0]) && !vowels.include?(word[1]) && !vowels.include?(word[2])
                word = word.slice(3..-1) + word.slice(0,3)            
            elsif !vowels.include?(word[0]) && !vowels.include?(word[1])
                word = word.slice(2..-1) + word.slice(0,2)
            else
                word = word.slice(1..-1) + word.slice(0)
            end
            word << "ay"
        end
    end

    def piglatinize_sentence(sentence)
        sentence.split.map{ |word| piglatinize_word(word)}.join(" ")
    end
end