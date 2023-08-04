require 'jwt'
require 'openssl'

lane :get_api_token do |options|
    key_id = "-----"
    issuer_id = "-----"
    key = "-----BEGIN PRIVATE KEY----- KEY KEY KEY -----END PRIVATE KEY-----"

    peky = OpenSSL::PKey::EC.new(key)
    
    now = Time.now
    expiration = now + 1200

    header = {
      kid: key_id,
      typ: 'JWT'
    }

    payload = {
      iss: issuer_id,
      iat: now.to_i,
      exp: expiration.to_i,
      aud: 'appstoreconnect-v1'
    }

    api_token = JWT.encode(payload, peky, 'ES256', header)

    puts api_token
end
