class AddUnconfirmToDevise < ActiveRecord::Migration[7.0]
  def self.up
    change_table :users do |t|
      t.string   :unconfirmed_email
    end
  end  
end
