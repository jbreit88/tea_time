# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :price
      t.integer :status, default: 0
      t.integer :frequency
      t.references :customer, foreign_key: true, foreign_key: { on_delete: :cascade }
      t.references :tea, foreign_key: true

      t.timestamps
    end
  end
end
