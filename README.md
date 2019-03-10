# Introducing the human_speakable gem

    require 'human_speakable'

    class Fun
      using HumanSpeakable

      def welcome
        Date.today.humanize
      end
    end

    fun = Fun.new
    fun.welcome  #=> "Sunday the 10th of March" 

## Resources

* human_speakable https://rubygems.org/gems/human_speakable

human speakable gem humanspeakable humanize ordinal date format
