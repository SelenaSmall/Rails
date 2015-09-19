class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
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
      t.belongs_to :organisation, index: true
      t.string :name, null: false, limit: 100
      t.string :phone, null: false, limit: 10
      t.string :email, null: false, limit: 100
      t.string :address, null: false, limit: 128

      t.timestamps null: false
    end
    
    create_table :customers do |t|
      t.belongs_to :organisation, index: true
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
      t.belongs_to :organisation, index: true
      t.belongs_to :venue, index: true
      t.string :name, null: false, limit: 100
      t.string :phone, null: false, limit: 10
      t.string :email, null: false, limit: 100
      t.datetime :start_time, null: false
      t.string :tab_name, null: false, limit: 10

      t.timestamps null: false
    end

    create_table :hours do |t|
      t.belongs_to :venue, index: true
      t.string :day, null: false, limit: 100
      t.datetime :open_time, null: false
      t.datetime :close_time, null: false
      t.string :interval, null: false, limit: 100
      t.integer :covers_per_interval, null: false

      t.timestamps null: false
    end

    create_table :covers do |t|
      t.belongs_to :venue, index: true
      t.string :covers, null: false, limit: 100
      t.string :covers_group, null: false, limit: 100
      t.string :turn_time, null: false

      t.timestamps null: false
    end

    create_table :sections do |t|
      t.belongs_to :venue, index: true
      t.string :section, null: false, limit: 100
      t.string :first_num, null: false, limit: 100
      t.string :last_num, null: false, limit: 100
      t.string :bookable, null: false, limit: 100

      t.timestamps null: false
    end

    create_table :tables do |t|
      t.belongs_to :venue, index: true
      t.belongs_to :grid, index: true
      t.string :tab, null: false, limit: 100
      t.string :section, null: false, limit: 100
      t.integer :min_covers, null: false
      t.integer :max_covers, null: false
      t.integer :booking_order, null: false

      t.timestamps null: false
    end

    create_table :users do |t|
      t.belongs_to :organisation, index: true
      t.belongs_to :venue, index: true
      t.string :user_name, null: false, limit: 100
      t.string :password, null: false, limit: 100
      t.string :first_name, null: false, limit: 100
      t.string :last_name, null: false, limit: 100
      t.string :email, null: false, limit: 100
      t.string :phone, null: false, limit: 100
      t.string :facebook, null: false, limit: 100

      t.timestamps null: false
    end

      create_table :grids do |t|
      t.belongs_to :venue, index: true
      t.string :grid_name, null: false, limit: 100

      t.timestamps null: false
    end

   # add_index :bookings, :start_time
   # add_index :bookings, :end_time
   # add_index :bookings, :tab_name
  end
end
