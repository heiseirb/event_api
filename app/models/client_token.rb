# == Schema Information
#
# Table name: client_tokens
#
#  id                :bigint           not null, primary key
#  token             :string           not null
#  secret_token_hash :string           not null
#

class ClientToken < ApplicationRecord
end
