class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :url
      t.string :keyword
      t.string :google_page_rank
      t.string :alexa_us_rank
      t.string :alexa_global_rank
      t.string :google_rank
      t.string :yahoo_rank
      t.string :bing_rank

      t.timestamps
    end
  end
end
