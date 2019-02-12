# encoding: UTF-8
require 'json' unless defined?(JSON)
require 'net/https'

require 'hashie'
require 'crea/version'
require 'crea/utils'
require 'crea/base_error'
require 'crea/mixins/serializable'
require 'crea/mixins/jsonable'
require 'crea/mixins/retriable'
require 'crea/chain_config'
require 'crea/type/base_type'
require 'crea/type/amount'
require 'crea/operation'
require 'crea/operation/account_create.rb'
require 'crea/operation/account_create_with_delegation.rb'
require 'crea/operation/account_update.rb'
require 'crea/operation/account_witness_proxy.rb'
require 'crea/operation/account_witness_vote.rb'
require 'crea/operation/cancel_transfer_from_savings.rb'
require 'crea/operation/challenge_authority.rb'
require 'crea/operation/change_recovery_account.rb'
require 'crea/operation/claim_account.rb'
require 'crea/operation/claim_reward_balance.rb'
require 'crea/operation/comment.rb'
require 'crea/operation/comment_options.rb'
require 'crea/operation/convert.rb'
require 'crea/operation/create_claimed_account.rb'
require 'crea/operation/custom.rb'
require 'crea/operation/custom_binary.rb'
require 'crea/operation/custom_json.rb'
require 'crea/operation/decline_voting_rights.rb'
require 'crea/operation/delegate_vesting_shares.rb'
require 'crea/operation/delete_comment.rb'
require 'crea/operation/escrow_approve.rb'
require 'crea/operation/escrow_dispute.rb'
require 'crea/operation/escrow_release.rb'
require 'crea/operation/escrow_transfer.rb'
require 'crea/operation/feed_publish.rb'
require 'crea/operation/limit_order_cancel.rb'
require 'crea/operation/limit_order_create.rb'
require 'crea/operation/limit_order_create2.rb'
require 'crea/operation/prove_authority.rb'
require 'crea/operation/recover_account.rb'
require 'crea/operation/report_over_production.rb'
require 'crea/operation/request_account_recovery.rb'
require 'crea/operation/reset_account.rb'
require 'crea/operation/set_reset_account.rb'
require 'crea/operation/set_withdraw_vesting_route.rb'
require 'crea/operation/transfer.rb'
require 'crea/operation/transfer_from_savings.rb'
require 'crea/operation/transfer_to_savings.rb'
require 'crea/operation/transfer_to_vesting.rb'
require 'crea/operation/vote.rb'
require 'crea/operation/withdraw_vesting.rb'
require 'crea/operation/witness_update.rb'
require 'crea/operation/witness_set_properties.rb'
require 'crea/marshal'
require 'crea/transaction'
require 'crea/transaction_builder'
require 'crea/rpc/base_client'
require 'crea/rpc/http_client'
require 'crea/rpc/thread_safe_http_client'
require 'crea/api'
require 'crea/jsonrpc'
require 'crea/block_api'
require 'crea/formatter'
require 'crea/broadcast'
require 'crea/stream'

module Crea
  def self.api_classes
    @api_classes ||= {}
  end
  
  def self.const_missing(api_name)
    api = api_classes[api_name]
    api ||= Api.clone(freeze: true) rescue Api.clone
    api.api_name = api_name
    api_classes[api_name] = api
  end
end

Hashie.logger = Logger.new(ENV['HASHIE_LOGGER'])
