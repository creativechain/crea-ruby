module Crea
  module ChainConfig
    EXPIRE_IN_SECS = 600
    EXPIRE_IN_SECS_PROPOSAL = 24 * 60 * 60
    
    NETWORKS_CREA_CHAIN_ID = '0000000000000000000000000000000000000000000000000000000000000000'
    NETWORKS_CREA_ADDRESS_PREFIX = 'CREA'
    NETWORKS_CREA_CORE_ASSET = ["0", 3, "@@000000021"] # CREA
    NETWORKS_CREA_DEBT_ASSET = ["0", 3, "@@000000013"] # CBD
    NETWORKS_CREA_VEST_ASSET = ["0", 6, "@@000000037"] # VESTS
    NETWORKS_CREA_DEFAULT_NODE = 'https://node1.creary.net' # √
    # NETWORKS_CREA_DEFAULT_NODE = 'https://api.crearystage.com' # √
    # NETWORKS_CREA_DEFAULT_NODE = 'https://api.crearydev.com' # √
    # NETWORKS_CREA_DEFAULT_NODE = 'https://appbasetest.timcliff.com'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://gtg.crea.house:8090'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://api.crea.house' # √?
    # NETWORKS_CREA_DEFAULT_NODE = 'https://seed.bitcoiner.me'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://cread.minnowsupportproject.org'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://cread.privex.io'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://rpc.crealiberator.com'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://rpc.curiecrea.com'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://rpc.buildteam.io'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://cread.pevo.science'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://rpc.creaviz.com'
    # NETWORKS_CREA_DEFAULT_NODE = 'https://cread.creagigs.org'
    
    NETWORKS_TEST_CHAIN_ID = '46d82ab7d8db682eb1959aed0ada039a6d49afa1602491f93dde9cac3e8e6c32'
    NETWORKS_TEST_ADDRESS_PREFIX = 'TST'
    NETWORKS_TEST_CORE_ASSET = ["0", 3, "@@000000021"] # TESTS
    NETWORKS_TEST_DEBT_ASSET = ["0", 3, "@@000000013"] # TBD
    NETWORKS_TEST_VEST_ASSET = ["0", 6, "@@000000037"] # VESTS
    NETWORKS_TEST_DEFAULT_NODE = 'https://testnet.crearydev.com'
    
    NETWORK_CHAIN_IDS = [NETWORKS_CREA_CHAIN_ID, NETWORKS_TEST_CHAIN_ID]
  end
end
