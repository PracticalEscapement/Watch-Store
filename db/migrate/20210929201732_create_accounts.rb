class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :accountable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
