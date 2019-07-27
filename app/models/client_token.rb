# == Schema Information
#
# Table name: client_tokens
#
#  id                :bigint           not null, primary key
#  token             :string           not null
#  secret_token_hash :string           not null
#

class ClientToken < ApplicationRecord
  validates :token, length: { minimum: 8 }, uniqueness: true
  validates :secret_token_hash, length: { minimum: 8 }, uniqueness: true

  def self.authenticate?(token, secret_token)
    return false unless client = where(token)

    client.secret_token_hash == Digest::SHA256.hexdigest(secret_token)
  end
end
