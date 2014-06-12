module Nesta
  class App
    def author_biography(name = nil)
      name ||= @page.metadata('author')
      if name
        template = name.downcase.gsub(/\W+/, '_').to_sym
        haml template, :layout => true
      end
    end
  end
end
