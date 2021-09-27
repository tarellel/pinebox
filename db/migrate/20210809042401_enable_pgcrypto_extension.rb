# frozen_string_literal: true

class EnablePgcryptoExtension < ActiveRecord::Migration[6.1]
  def change
    if ActiveRecord::Base.connection.adapter_name.downcase.to_sym == :postgresql
      enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    end
  end
end
