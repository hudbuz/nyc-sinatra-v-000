class Fixfiguretitles < ActiveRecord::Migration
  def change

    drop_table :figure_titles 

    create_table :figure_titles do |t|
      t.integer :figure_id
      t.integer :title_id
    end
  end
end
