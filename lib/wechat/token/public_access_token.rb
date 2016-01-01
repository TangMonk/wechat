require 'wechat/token/access_token_base'

module Wechat
  module Token
    class PublicAccessToken < AccessTokenBase
      def refresh
        data = client.get('token', params: { grant_type: 'client_credential', appid: appid, secret: secret })
        write_token_to_file(data)
        read_token_from_file
      end
    end
  end
end