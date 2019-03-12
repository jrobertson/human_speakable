#!/usr/bin/env ruby

# file: human_speakable.rb

module Ordinals
  
  refine Integer do

    def ordinal
      self.to_s + ( (10...20).include?(self) ? 'th' : 
                          %w{ th st nd rd th th th th th th }[self % 10] )
    end

  end
  
end  

module HumanSpeakable
  using Ordinals
  
  def self.format_date(date, year=false)
        
    s = case (date - Date.today).to_i
    when (0)     then 'today'
    when (1)     then 'tomorrow'      
    when (2..6)  then 'this ' + Date::DAYNAMES[date.wday]
    when (7..10) then 'next ' + Date::DAYNAMES[date.wday]
    when (11..14) 
      ['next', Date::DAYNAMES[date.wday], 'the', (date.day.ordinal), 'of', 
        Date::MONTHNAMES[date.month]].join(' ')                         
    when (15..21)
      [Date::DAYNAMES[date.wday], 'the', (date.day.ordinal), 'of', 
        Date::MONTHNAMES[date.month]].join(' ')      
    else
      ['on the', (date.day.ordinal), 'of', 
        Date::MONTHNAMES[date.month]].join(' ')      
    end
    
    year ? s + ' ' + date.year.to_s : s
  end
  
  def self.format_time(time)  
    time.strftime("%-I:%M%P")
  end

  refine String do
    
    # assumes a string representation of a date

    def humanize()
      date = Date.parse(self)
      HumanSpeakable.format_date(date)
    end

  end

  refine Date do
    
    def humanize(year: false)
      date = self
      HumanSpeakable.format_date(date, year)
    end

  end
  
  refine Time do
    
    def humanize()
      time = self
      HumanSpeakable.format_time(time)
    end

  end  

end
