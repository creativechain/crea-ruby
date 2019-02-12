require 'test_helper'

module Crea
  class AmountTest < Crea::Test
    def setup
      @amount = Crea::Type::Amount.new('0.000 CREA')
    end
    
    def test_to_s
      assert_equal '0.000 CBD', Crea::Type::Amount.to_s(['0', 3, '@@000000013'])
      assert_equal '0.000 CREA', Crea::Type::Amount.to_s(['0', 3, '@@000000021'])
      assert_equal '0.000000 VESTS', Crea::Type::Amount.to_s(['0', 6, '@@000000037'])
      
      assert_raises TypeError do
        Crea::Type::Amount.to_s(['0', 3, '@@00000000'])
      end
    end
    
    def test_to_h
      assert_equal({amount: '0', precision: 3, nai: '@@000000013'}, Crea::Type::Amount.to_h('0.000 CBD'))
      assert_equal({amount: '0', precision: 3, nai: '@@000000021'}, Crea::Type::Amount.to_h('0.000 CREA'))
      assert_equal({amount: '0', precision: 6, nai: '@@000000037'}, Crea::Type::Amount.to_h('0.000000 VESTS'))
      
      assert_raises TypeError do
        Crea::Type::Amount.to_h('0.000 BOGUS')
      end
    end
    
    def test_to_bytes
      assert @amount.to_bytes
    end
  end
end