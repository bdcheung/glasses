class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :location

      t.timestamps
    end
  end
end
