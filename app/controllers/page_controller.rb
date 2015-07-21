class PageController < ApplicationController

  def faqs
    @faq = Text.find_by(code: 'faq')
  end

  def legal
    @legal = Text.find_by(code: 'legal')
  end

  def tos
  end

  def about
  end

  def privacy
  end
  
  def translate
  end

end
