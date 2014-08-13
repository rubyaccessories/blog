module Nesta
  class App
    def author_biography(name = nil)
      name ||= @page.metadata('author')
      if name
        template = name.downcase.gsub(/\W+/, '_').to_sym
        haml template, :layout => true
      end
    end
    get '/robots.txt' do
      content_type 'text/plain', :charset => 'utf-8'
      <<-EOF
# robots.txt
# See http://en.wikipedia.org/wiki/Robots_exclusion_standard
EOF
    end

    get '/css/:sheet.css' do
      content_type 'text/css', :charset => 'utf-8'
      cache sass(params[:sheet].to_sym)
    end

    get %r{/attachments/([\w/.-]+)} do
      file = File.join(Nesta::Config.attachment_path, params[:captures].first)
      send_file(file, :disposition => nil)
    end

    get '/articles.xml' do
      content_type :xml, :charset => 'utf-8'
      set_from_config(:title, :subtitle, :author)
      @articles = Page.find_articles.select { |a| a.date }[0..9]
      cache haml(:atom, :format => :xhtml, :layout => false)
    end

    get '/sitemap.xml' do
      content_type :xml, :charset => 'utf-8'
      @pages = Page.find_all
      @last = @pages.map { |page| page.last_modified }.inject do |latest, page|
        (page > latest) ? page : latest
      end
      cache haml(:sitemap, :format => :xhtml, :layout => false)
    end

    get '*' do
      set_common_variables
      @heading = @title
      parts = params[:splat].map { |p| p.sub(/\/$/, '') }
      @page = Nesta::Page.find_by_path(File.join(parts))
      raise Sinatra::NotFound if @page.nil?
      @title = @page.title
      @body_class = @page.date.nil? ? 'page' : 'article'
      @body_class = 'category ' + @body_class if @page.is_category?
      set_from_page(:description, :keywords)
      cache haml(@page.template, :layout => @page.layout)
    end

    helpers do
      def list_articles(articles)
        haml_tag :ol do
          articles.each do |article|
            haml_tag :li do
              haml_tag :a, article.heading, :href => path_to(article.abspath)
            end
          end
        end
      end

      def article_years
        articles = Page.find_articles
        last, first = articles[0].date.year, articles[-1].date.year
        (first..last).to_a.reverse
      end

      def archive_by_year
        article_years.each do |year|
          haml_tag :li do
            haml_tag :a, :id => "#{year}"
            haml_tag :h2, year
            haml_tag :ol do
              articles = Page.find_articles.select { |a| a.date.year == year }
              list_articles(articles)
            end
          end
        end
      end

      def archive_by_month
        article_months.each do |month_name|
          haml_tag :li do
            haml_tag :a, :id => "#{month_name}"
            haml_tag :h2, month
            haml_tag :ol do
              articles = Page.find_articles.select { |a| a.date.month == month }
              list_articles(articles)
            end
          end
        end
      end

    end
  end

  class Page
     def is_category?
      !pages.empty? or !articles.empty?
    end
  end
end
