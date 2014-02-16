require 'omniauth-saml'

module OmniAuth
  module Strategies
    class SAMLRMUnify < SAML

      option :name, "saml_rmunify"

      info do
        {
          :email             => @attributes['urn:oid:0.9.2342.19200300.100.1.3'],
          :name              => @attributes['urn:oid:2.16.840.1.113730.3.1.241'] ||
                                @attributes['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'] ||
                                @attributes['urn:oid:2.5.4.42'] + ' ' + @attributes['urn:oid:2.5.4.4'],
          :nickname          => @attributes['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'],
          :first_name        => @attributes['urn:oid:2.5.4.42'],
          :last_name         => @attributes['urn:oid:2.5.4.4'],
          # underscore version of rm unify attribute names.
          :display_name      => @attributes['urn:oid:2.16.840.1.113730.3.1.241'],
          :user_name         => @attributes['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'],
          :persistent_id     => @attributes['urn:oasis:names:tc:SAML:2.0:nameid-format:persistent'],
          :identity_guid     => @attributes['http://schemas.rm.com/identity/claims/identityguid'],
          :scope_targeted_id => @attributes['urn:mace:dir:attribute-def:eduPersonTargetedID'],
          :organization_guid => @attributes['http://schemas.rm.com/identity/claims/organisationid'],
          :organization_name => @attributes['urn:oid:2.5.4.10'],
          :organization_code => @attributes['http://schemas.rm.com/identity/claims/organisationCode'],
          :display_name      => @attributes['urn:oid:2.16.840.1.113730.3.1.241'],
          :role              => @attributes['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'],
          :scope_affiliation => @attributes['urn:oid:1.3.6.1.4.1.5923.1.1.1.9'],
          :is_unify_admin    => @attributes['http://schemas.rm.com/identity/claims/isunifyadmin'] == 'True',
          :year_of_entry     => @attributes['http://schemas.rm.com/identity/claims/yearofentry'],
          :app_licence       => licence,
          :app_user_id       => @attributes['http://schemas.rm.com/identity/claims/appuserid'],
          :app_establishment_key => @attributes['http://schemas.rm.com/identity/claims/appestablishmentkey']
        }
      end

      private

      def licence
        licence_str =  @attributes['http://schemas.rm.com/identity/claims/applicence']
        licence = Hash[licence_str[1..-2].split('|').map{|kv|
          (k,v) = kv.split(':')
          [k.underscore, v]
        }]
        licence['is_trial'] = licence['is_trial'] == 'True'
        licence['is_connector'] = licence['is_connector'] == 'True'
        licence.merge!(licence_description(licence))
      end

      def licence_description(licence)
        desc = licence['description'].split('/')
        {
          :app_name     => desc[0],
          :package_name => desc[1],
          :school_type  => desc[2],
          :term         => desc[3]
        }
      end
    end
  end
end

OmniAuth.config.add_camelization 'saml_rmunify', 'SAMLRMUnify'
