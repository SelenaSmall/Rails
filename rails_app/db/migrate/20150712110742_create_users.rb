class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 128
      t.string :phone, null: false, limit: 12
      t.string :address, null: false, limit: 128
      t.string :email, null: false, limit: 128
    #  t.datetime :start_date, null: false
    #  t.datetime :opening_time, null: false
    #  t.datetime :closing_time, null: false
      t.string :number_of_tabs, null: false, limit: 128

      t.timestamps null: false
    end

    create_table :venues do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false, limit: 100
      t.string :phone, null: false, limit: 10
      t.string :email, null: false, limit: 100
      t.string :address, null: false, limit: 128

      t.timestamps null: false
    end
    
    create_table :customers do |t|
      t.belongs_to :venue, index: true
      t.string :name, null: false, limit: 100
      t.string :phone, null: false, limit: 10
      t.string :email, null: false, limit: 100
    #  t.datetime :start_time, null: false
    #  t.datetime :end_time, null: false
    #  t.string :tab_name, null: false, limit: 10

      t.timestamps null: false
    end

    create_table :bookings do |t|
      t.belongs_to :venue, index: true
      t.string :name, null: false, limit: 100
      t.string :phone, null: false, limit: 10
      t.string :email, null: false, limit: 100
      t.datetime :start_time, null: false
    #  t.datetime :end_time, null: false
      t.string :tab_name, null: false, limit: 10

      t.timestamps null: false
    end

   # add_index :bookings, :start_time
   # add_index :bookings, :end_time
   # add_index :bookings, :tab_name
  end
end
