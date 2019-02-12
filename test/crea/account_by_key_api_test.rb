require 'test_helper'

module Crea
  class AccountByKeyApiTest < Crea::Test
    def setup
      @api = Crea::AccountByKeyApi.new(url: TEST_NODE)
      @jsonrpc = Jsonrpc.new(url: TEST_NODE)
      @methods = @jsonrpc.get_api_methods[@api.class.api_name]
    end
    
    def test_api_class_name
      assert_equal 'AccountByKeyApi', Crea::AccountByKeyApi::api_class_name
    end
    
    def test_inspect
      assert_equal "#<AccountByKeyApi [@chain=crea, @methods=<1 element>]>", @api.inspect
    end
    
    def test_method_missing
      assert_raises NoMethodError do
        @api.bogus
      end
    end
    
    def test_all_respond_to
      @methods.each do |key|
        assert @api.respond_to?(key), "expect rpc respond to #{key}"
      end
    end
    
    def test_get_key_references
      vcr_cassette('account_by_key_api_get_key_references', record: :once) do
        options = {
          accounts: ['CREA5jZtLoV8YbxCxr4imnbWn61zMB24wwonpnVhfXRmv7j6fk3dTH']
        }
        
        @api.get_key_references(options) do |result|
          assert_equal Hashie::Array, result.accounts.class
        end
      end
    end
  end
end