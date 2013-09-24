class RanksController < ApplicationController

  include(UsefulMethodsHelper)

  # GET /ranks
  # GET /ranks.json
  def index
    #@ranks = Rank.all
    @ranks = Rank.paginate(page: params[:page], :per_page => 10, order: "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ranks }
    end
  end

  # GET /ranks/1
  # GET /ranks/1.json
  def show
    @rank = Rank.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rank }
    end
  end

  # GET /ranks/new
  # GET /ranks/new.json
  def new
    @rank = Rank.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rank }
    end
  end

  # GET /ranks/1/edit
  def edit
    @rank = Rank.find(params[:id])
  end

  # POST /ranks
  # POST /ranks.json
  def create
    @rank = Rank.new(rank_params)

    keyword = @rank.keyword
    the_url = @rank.url
    url = strip_url(the_url)

    # Define the search engines array
    search_engines = { google: 'google_rank', yahoo: 'yahoo_rank', bing: 'bing_rank'}
    # Get search engine ranks for the supplied keyword and url combination
    search_engines.each do |key, value|
      @se = Rankstar.rank(key, keyword, url, :res_per_page => 10, :limit => 100)

      case key
        when :google
          if @se.nil?
            @rank.google_rank = '-'
          else
            @rank.google_rank = @se
          end
        when :yahoo
          if @se.nil?
            @rank.yahoo_rank = '-'
          else
            @rank.yahoo_rank = @se
          end
        else
          if @se.nil?
            @rank.bing_rank = '-'
          else
            @rank.bing_rank = @se
          end
      end

    end

=begin
    # Get search engine ranks for the supplied keyword and url combination
    # Get Google rank for the supplied keyword and url combination
    @google_rank = Rankstar.rank(:google, keyword, url, :res_per_page => 10, :limit => 100)
    if @google_rank.nil?
      @rank.google_rank = '-'
    else
      @rank.google_rank = @google_rank
    end

    # Get Yahoo rank for the supplied keyword and url combination
    @yahoo_rank = Rankstar.rank(:yahoo, keyword, url, :res_per_page => 10, :limit => 100)
    if @yahoo_rank.nil?
      @rank.yahoo_rank = '-'
    else
      @rank.yahoo_rank = @yahoo_rank
    end

    # Get Bing rank for the supplied keyword and url combination
    @bing_rank = Rankstar.rank(:bing, keyword, url, :res_per_page => 10, :limit => 100)
    if @bing_rank.nil?
      @rank.bing_rank = '-'
    else
      @rank.bing_rank = @bing_rank
    end
=end
    # Get Google Page Rank, Alexa US rank, and Alexa Global rank for the supplied domain
    page_ranks = PageRankr.ranks('http://www.' + @rank.url)
    if page_ranks[:google].nil?
      @rank.google_page_rank = "-"
    else
      @rank.google_page_rank = page_ranks[:google]
    end
    if page_ranks[:alexa_us].nil?
      @rank.alexa_us_rank = "-"
    else
      @rank.alexa_us_rank = page_ranks[:alexa_us]
    end
    if page_ranks[:alexa_global].nil?
      @rank.alexa_global_rank = "-"
    else
      @rank.alexa_global_rank = page_ranks[:alexa_us]
    end

    respond_to do |format|
      if @rank.save
        format.html { redirect_to @rank, notice: 'Rank was successfully created.' }
        format.json { render json: @rank, status: :created, location: @rank }
      else
        format.html { render action: "new" }
        format.json { render json: @rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ranks/1
  # PUT /ranks/1.json
  def update
    @rank = Rank.find(params[:id])

    respond_to do |format|
      if @rank.update_attributes(rank_params)
        format.html { redirect_to @rank, notice: 'Rank was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ranks/1
  # DELETE /ranks/1.json
  def destroy
    @rank = Rank.find(params[:id])
    @rank.destroy

    respond_to do |format|
      format.html { redirect_to ranks_url }
      format.json { head :no_content }
    end
  end

  private

  def rank_params
    params.require(:rank).permit(:url, :keyword, :google_page_rank, :alexa_us_rank, :alexa_global_rank, :google_rank, :yahoo_rank, :bing_rank)
  end

end
