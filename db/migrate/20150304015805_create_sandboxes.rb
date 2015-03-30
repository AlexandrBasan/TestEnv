class CreateSandboxes < ActiveRecord::Migration
  def change
    create_table :sandboxes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
