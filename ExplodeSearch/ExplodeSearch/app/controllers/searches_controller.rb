class SearchesController < ApplicationController

	def index
		#@searches = Search.all
		@searches = Search.order("numberOfSearches desc").limit(20)
	end 

	def new
		#Making new crud screen, probably not needed
    end

    def create
      #Actually creating it in the DB
      #@abc = system('wget youtube.com')
      searchRecord = Search.find_by searchTerm: search_params[:searchTerm]

      if(searchRecord == nil)
        @search = Search.new(search_params)
        @search.numberOfSearches = 1
      else
      	@search = searchRecord
      	increment_search_count
      end

      @search.save
      #redirect_to searches_path, :notice => searchRecord
      redirect_to searches_path
   
    end

    private
      def search_params
        params.require(:search).permit(:searchTerm, :numberOfSearches)
      end

      def increment_search_count
      	if(@search.numberOfSearches == nil)
          @search.numberOfSearches = 1
      	else
      	  @search.numberOfSearches += 1
      	end
      end
end
