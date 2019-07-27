class CreateClientTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :client_tokens do |t|
      t.string :token, null: false, index: { unique: true }
      t.string :secret_token_hash, null: false
    end
  end
end
