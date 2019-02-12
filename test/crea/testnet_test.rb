require 'test_helper'

module Crea
  class TestnetTest < Crea::Test
    def setup
      @api = Api.new(url: TEST_NODE)
      @jsonrpc = Jsonrpc.new(url: TEST_NODE)
      @methods = @jsonrpc.get_api_methods[@api.class.api_name]
      
      @api.get_config do |result|
        unless result['IS_TEST_NET']
          skip "Skipped, because #{TEST_NODE} is not testnet.  Instead, found chain id: #{result['CREA_CHAIN_ID']}"
        end
      end
    end
    
    def test_get_dynamic_global_properties
      @api.get_dynamic_global_properties do |properties|
        assert '0.000 TBD', properties.confidential_cbd_supply
        assert '0.000 TESTS', properties.confidential_supply
        assert '0.000 TBD', properties.current_cbd_supply
        assert '0.000000 VESTS', properties.pending_rewarded_vesting_shares
        assert '0.000 TESTS', properties.pending_rewarded_vesting_crea
        assert '0.000 TESTS', properties.total_reward_fund_crea
      end
    end
  end
end