--local dbh = freeswitch.Dbh("pgsql://host=10.10.60.232 dbname=PortaControl user=portacontrol password='dPegVuUtq' options='-c client_min_messages=NOTICE' application_name='freeswitch'")
local dbh = freeswitch.Dbh("odbc://freeswitch:portacontrol:dPegVuUtq")

local list_subscriber_domain = "select domain from domain"

local list_sip_interfaces = "select * from sip_interfaces"

local xml = {}

table.insert(xml, [[<?xml version="1.0" encoding="UTF-8" standalone="no"?>]]);
table.insert(xml, [[<document type="freeswitch/xml">]]);

table.insert(xml, [[  <section name="configuration">]]);

table.insert(xml, [[  <configuration name="sofia.conf" description="sofia gw config">]]);
table.insert(xml, [[    <global_settings>]]);
table.insert(xml, [[      <param name="log-level" value="0"/>]]);
table.insert(xml, [[      <param name="debug-presence" value="0"/>]]);
table.insert(xml, [[    </global_settings>]]);
table.insert(xml, [[    <profiles>]]);
--table.insert(xml, [[<X-PRE-PROCESS cmd="include" data="../sbc_profiles/*.xml"/>]]);

assert (dbh:query(list_sip_interfaces, function(a)
    
table.insert(xml, [[<profile name="]]..a.name..[[">]]);
table.insert(xml, [[<settings>]]);
table.insert(xml, [[<param name="message-threads" value="10"/>]]);
table.insert(xml, [[<param name="auth-calls" value="]]..a.authcalls..[["/>]]);
table.insert(xml, [[<param name="apply-nat-acl" value="rfc1918.auto"/>]]);
table.insert(xml, [[<param name="local-network-acl" value="localnet.auto"/>]]);
table.insert(xml, [[<param name="accept-blind-auth" value="true"/>]]);
table.insert(xml, [[<param name="enforce-blind-auth-result" value="true"/>]]);
table.insert(xml, [[<param name="channel-xml-fetch-on-nightmare-transfer" value="true"/>]]);
table.insert(xml, [[<param name="fire-transfer-events" value="true"/>]]);
table.insert(xml, [[<param name="challenge-realm" value="]]..a.challenge_realm..[["/>]]);
table.insert(xml, [[<param name="multiple-registrations" value="false"/>]]);
table.insert(xml, [[<param name="nonce-ttl" value="86400"/>]]);
table.insert(xml, [[<param name="disable-register" value="]]..a.disable_register..[["/>]]);
table.insert(xml, [[<param name="inbound-reg-force-matching-username" value="true"/>]]);
table.insert(xml, [[<param name="auth-all-packets" value="false"/>]]);
table.insert(xml, [[<param name="context" value="params"/>]]);
table.insert(xml, [[<param name="dialplan" value="XML"/>]]);
table.insert(xml, [[<param name="manual-redirect" value="true"/>]]);
table.insert(xml, [[<param name="disable-transfer" value="false"/>]]);
table.insert(xml, [[<param name="sip-ip" value="auto"/>]]);
table.insert(xml, [[<param name="ext-sip-ip" value="]]..a.extsip_ip..[["/> ]]);
table.insert(xml, [[<param name="sip-port" value="]]..a.sip_port..[["/>]]);
table.insert(xml, [[<param name="username" value="]]..a.user_agent..[["/>]]);
table.insert(xml, [[<param name="user-agent-string" value="]]..a.user_agent..[["/>]]);
table.insert(xml, [[<param name="enable-100rel" value="false"/>]]);
table.insert(xml, [[<param name="max-proceeding" value="1000"/>]]);
table.insert(xml, [[<param name="track-calls" value="true"/>]]);
table.insert(xml, [[<param name="disable-srv" value="false" />]]);
table.insert(xml, [[<param name="disable-naptr" value="false" />]]);
table.insert(xml, [[<param name="extension-in-contact" value="true"/>]]);
table.insert(xml, [[<param name="enable-3pcc" value="true"/>]]);
table.insert(xml, [[<param name="rtp-ip" value="auto"/>]]);
table.insert(xml, [[<param name="ext-rtp-ip" value="]]..a.extrtp_ip..[["/>]]);
table.insert(xml, [[<param name="rtp-timer-name" value="soft"/>]]);
table.insert(xml, [[<param name="rtp-autoflush-during-bridge" value="true"/>]]);
table.insert(xml, [[<param name="rtp-rewrite-timestamps" value="false"/>]]);
table.insert(xml, [[<param name="rtp-enable-zrtp" value="true"/>]]);
table.insert(xml, [[<param name="hold-music" value="local_stream://default"/>]]);
table.insert(xml, [[<param name="record-path" value="$${recordings_dir}"/>]]);
table.insert(xml, [[<param name="record-template" value="${caller_id_number}.${target_domain}.${strftime(%Y-%m-%d-%H-%M-%S)}.wav"/>]]);
table.insert(xml, [[<param name="tls" value="false"/>]]);
table.insert(xml, [[<param name="tls-sip-port" value="5061"/>]]);
table.insert(xml, [[<param name="tls-bind-params" value="transport=tls"/>]]);
table.insert(xml, [[<param name="tls-version" value="tlsv1"/>]]);
table.insert(xml, [[<param name="tls-bind-params" value="transport=tls"/>]]);
table.insert(xml, [[<param name="tls-passphrase" value=""/>]]);
table.insert(xml, [[<param name="tls-verify-date" value="true"/>]]);
table.insert(xml, [[<param name="tls-verify-policy" value="none"/>]]);
table.insert(xml, [[<param name="tls-verify-depth" value="2"/>]]);
table.insert(xml, [[<param name="tls-verify-in-subjects" value=""/>]]);
table.insert(xml, [[<param name="tls-version" value="$${sip_tls_version}"/>-->]]);
table.insert(xml, [[<param name="dtmf-duration" value="960"/>]]);
table.insert(xml, [[<param name="rfc2833-pt" value="101"/>]]);
table.insert(xml, [[<param name="dtmf-type" value="rfc2833"/>]]);
table.insert(xml, [[<param name="pass-rfc2833" value="false"/>]]);
table.insert(xml, [[<param name="liberal-dtmf" value="true"/>]]);
table.insert(xml, [[<param name="inbound-codec-prefs" value="$${global_codec_prefs}"/>]]);
table.insert(xml, [[<param name="outbound-codec-prefs" value="$${outbound_codec_prefs}"/>]]);
table.insert(xml, [[<param name="inbound-codec-negotiation" value="greedy"/>]]);
table.insert(xml, [[<param name="inbound-late-negotiation" value="true"/>]]);
table.insert(xml, [[<param name="disable-transcoding" value="false"/>]]);
table.insert(xml, [[<param name="t38-passthru" value="true"/>]]);
table.insert(xml, [[<param name="all-reg-options-ping" value="true"/>]]);
table.insert(xml, [[<param name="enable-timer" value="false"/>]]);
table.insert(xml, [[<param name="media_timeout" value="3600"/>]]);
table.insert(xml, [[<param name="media_hold_timeout" value="3600"/>]]);
table.insert(xml, [[<param name="minimum-session-expires" value="60"/>]]);
table.insert(xml, [[<param name="pass-callee-id" value="false"/>]]);
table.insert(xml, [[<param name="manage-presence" value="true"/>]]);
table.insert(xml, [[<param name="send-message-query-on-register" value="false"/>]]);
table.insert(xml, [[<param name="watchdog-enabled" value="false"/>]]);
table.insert(xml, [[<param name="debug" value="info"/>]]);
table.insert(xml, [[<param name="sip-trace" value="false"/>]]);
table.insert(xml, [[<param name="log-auth-failures" value="true"/>]]);
table.insert(xml, [[<param name="fire-transfer-events" value="true"/>]]);
table.insert(xml, [[<param name="channel-xml-fetch-on-nightmare-transfer" value="true"/>]]);
table.insert(xml, [[</settings>]]);
table.insert(xml, [[<gateways>]]);

local list_trunks = "select * from sip_trunks where enabled='true' and sip_interfaces = '"..a.name.."'"

assert (dbh:query(list_trunks, function(b)

table.insert(xml, [[<gateway name="]] .. b.gateway_name .. [[">]]);
table.insert(xml, [[<param name="username" value="]] .. b.username .. [["/>]]);
table.insert(xml, [[<param name="realm" value="]] .. b.realm .. [["/>]]);
table.insert(xml, [[<param name="from-user" value="]] .. b.fromuser .. [["/>]]);
table.insert(xml, [[<param name="from-domain" value="]] .. b.fromdomain .. [["/>]]);
table.insert(xml, [[<param name="password" value="]] .. b.password .. [["/>]]);
table.insert(xml, [[<param name="extension" value="]] .. b.extension .. [["/>]]);
table.insert(xml, [[<param name="proxy" value="]] .. b.proxy .. [["/>]]);
table.insert(xml, [[<param name="register-proxy" value="]] .. b.registerproxy .. [["/>]]);
table.insert(xml, [[<param name="expire-seconds" value="]] .. b.expireseconds .. [["/>]]);
table.insert(xml, [[<param name="register" value="]] .. b.register .. [["/>]]);
table.insert(xml, [[<param name="register-transport" value="]] .. b.registertrans .. [["/>]]);
table.insert(xml, [[<param name="retry-senconds" value="]] .. b.retryseconds .. [["/>]]);
table.insert(xml, [[<param name="caller-id-in-from" value="]] .. b.calleridinfrom .. [["/>]]);
table.insert(xml, [[<param name="context" value="params"/>]]);
if ( pingenabled == true or pingenabled == 'true' ) then
    table.insert(xml, [[<param name="ping" value="]] .. b.ping .. [["/>]]);
end
table.insert(xml, [[</gateway>]]);

end ))

table.insert(xml, [[</gateways>]]);
table.insert(xml, [[</profile>]]);
end))
table.insert(xml, [[</profiles>]]);
table.insert(xml, [[</configuration>]]);
table.insert(xml, [[</section>]]);




table.insert(xml, [[<section name="directory">]]);

assert (dbh:query(list_subscriber_domain, function(c)

    if not ( c.domain == nil or c.domain == '' ) then 
        table.insert(xml, [[<domain name="]]..c.domain..[[">]]);
        table.insert(xml, [[<users>]]);

        local list_local_callees = "select * from subscriber where domain ='"..c.domain.."'"
            assert (dbh:query(list_local_callees, function(d)
            table.insert(xml, [[<user id="]]..d.clientid..[[">]]);
            table.insert(xml, [[<params>]]);
                table.insert(xml, [[<param name="password" value="]]..d.password..[["/>]]);
                table.insert(xml, [[<param name="dial-string" value="{rtp_secure_media=${regex(${sofia_contact(${dialed_user}@${dialed_domain})}|transport=tls)},presence_id=${dialed_user}@${dialed_domain}}${sofia_contact(${dialed_user}@${dialed_domain})}" />]]);
                table.insert(xml, [[<param name="jsonrpc-allowed-methods" value="verto"/>]]);
                table.insert(xml, [[<param name="jsonrpc-allowed-event-channels" value="demo,conference"/>]]);
            table.insert(xml, [[</params>]]);
            table.insert(xml, [[<variables>]]);
                if not ( d.calleridnum == nil or d.calleridnum == '' ) then 
                    table.insert(xml, [[<variable name="effective_caller_id_number" value="]]..d.calleridnum..[["/>]]);
                end
                if not ( d.calleridnum == nil or d.calleridnum == '' ) then 
                    table.insert(xml, [[<variable name="outbound_caller_id_number" value="]]..d.calleridnum..[["/>]]);
                end
                --table.insert(xml, [[<variable name="nibble_rate" value="0.05"/>]]);
                table.insert(xml, [[<variable name="nibble_account" value="]]..d.clientid..[["/>]]);
                if not ( d.default_areacode == nil or d.default_areacode == '' ) then
                    table.insert(xml, [[<variable name="default_areacode" value="]]..d.default_areacode..[["/>]]);
                end
                table.insert(xml, [[<variable name="user_context" value="]]..d.domain..[["/>]]);
            table.insert(xml, [[</variables>]]);
            table.insert(xml, [[</user>]]);
        end))

        table.insert(xml, [[</users>]]);
        table.insert(xml, [[</domain>]]);
    end
end))

table.insert(xml, [[</section>]]);


table.insert(xml, [[<section name="dialplan" description="Regex/XML Dialplan">]]);

table.insert(xml, [[<context name="params">]]);

assert (dbh:query(list_subscriber_domain, function(h)
    local list_trunks_exten = "select * from sip_trunks where enabled='true'"
        assert (dbh:query(list_trunks_exten, function(g)
        table.insert(xml, [[<extension name="]]..g.extension..[[">]]);
        table.insert(xml, [[<condition field="destination_number" expression="^]]..g.extension..[[$">]]);
        table.insert(xml, [[<action application="transfer" data="]]..g.extension..[[ XML ]]..h.domain..[["/>]]);
        table.insert(xml, [[</condition>]]);
        table.insert(xml, [[</extension>]]);
    end))
end))
    
    table.insert(xml, [[</context>]]);

assert (dbh:query(list_subscriber_domain, function(e)

    if not ( e.domain == nil or e.domain == '' ) then 
        table.insert(xml, [[<context name="]]..e.domain..[[">]]);

            table.insert(xml, [[<extension name="unloop">]]);
                table.insert(xml, [[<condition field="${unroll_loops}" expression="^true$"/>]]);
                table.insert(xml, [[<condition field="${sip_looped_call}" expression="^true$">]]);
                    table.insert(xml, [[<action application="deflect" data="${destination_number}"/>]]);
                table.insert(xml, [[</condition>]]);
            table.insert(xml, [[</extension>]]);

            table.insert(xml, [[<extension name="global" continue="true">]]);
                table.insert(xml, [[<condition field="${call_debug}" expression="^true$" break="never">]]);
                    --table.insert(xml, [[<action application="set" data="disable_q850_reason=true"/>]]);
                    --table.insert(xml, [[<action application="info"/>]]);
                table.insert(xml, [[</condition>]]);
                table.insert(xml, [[<condition field="${rtp_has_crypto}" expression="^($${rtp_sdes_suites})$" break="never">]]);
                    table.insert(xml, [[<action application="set" data="rtp_secure_media=true"/>]]);
                table.insert(xml, [[</condition>]]);
                table.insert(xml, [[<condition field="${endpoint_disposition}" expression="^(DELAYED NEGOTIATION)"/>]]);
                table.insert(xml, [[<condition field="${switch_r_sdp}" expression="(AEAD_AES_256_GCM_8|AEAD_AES_128_GCM_8|AES_CM_256_HMAC_SHA1_80|AES_CM_192_HMAC_SHA1_80|AES_CM_128_HMAC_SHA1_80|AES_CM_256_HMAC_SHA1_32|AES_CM_192_HMAC_SHA1_32|AES_CM_128_HMAC_SHA1_32)" break="never">]]);
                    table.insert(xml, [[<action application="set" data="rtp_secure_media=true"/>]]);
                table.insert(xml, [[</condition>]]);
            table.insert(xml, [[</extension>]]);

                local list_trunks_exten = "select * from sip_trunks where enabled='true'"
                assert (dbh:query(list_trunks_exten, function(f)
                    table.insert(xml, [[<extension name="]]..f.extension..[[">]]);
                    table.insert(xml, [[<condition field="destination_number" expression="^]]..f.extension..[[$">]]);
                    table.insert(xml, [[<action application="respond" data="603 Declined"/>]]);
                    table.insert(xml, [[<action application="hangup"/>]]);
                    table.insert(xml, [[</condition>]]);
                    table.insert( xml, [[</extension>]]);
                end))



        table.insert(xml, [[</context>]]);
    end
end))

table.insert(xml, [[</section>]]);
table.insert(xml, [[</document>]]);
 
dbh:release();
 
XML_STRING = table.concat(xml, "\n")

freeswitch.consoleLog("notice", "Debug from core.lua, generated XML:\n" .. XML_STRING .. "\n")