#!/usr/bin/env ruby

# file: human_speakable.rb

module HumanSpeakable

  refine Integer do

    def ordinal
      self.to_s + ( (10...20).include?(self) ? 'th' : 
                          %w{ th st nd rd th th th th th th }[self % 10] )
    end

  end

  refine String do
    
    # assumes a string representation of a date

    def humanize()
      date = Date.parse(self)
      [Date::DAYNAMES[date.wday], 'the', date.day.ordinal, 'of', 
       Date::MONTHNAMES[date.month]].join(' ')   
    end

  end

  refine Date do
    
    def humanize()
      date = self
      [Date::DAYNAMES[date.wday], 'the', date.day.ordinal, 'of', 
       Date::MONTHNAMES[date.month]].join(' ')   
    end

  end

end
