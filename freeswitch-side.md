In the dialplan:

```
<extension name="pysds">
        <condition field="destination_number" expression="^1001">
                <action application="answer" />
                <action application="conference_set_auto_outcall" data="user/1001"/>
                <action application="conference" data="${destination_number}-${strftime(%Y-%m-%d %T)}@myconference"/>
        </condition>
</extension>
```

In ./autoload_config/conference.conf.xml:

```
<profile name="myconference">
    <param name="domain" value="$${domain}"/>
    <param name="rate" value="8000"/>
    <param name="channels" value="1"/>
    <param name="energy-level" value="0" />
    <param name="enter-sound" value="tone_stream://%(200,0,500,600,700)"/>
    <param name="caller-id-name" value="$${outbound_caller_name}"/>
    <param name="caller-id-number" value="$${outbound_caller_id}"/>
    <param name="video-mode" value="mux"/>
    <param name="conference-falgs" value="minimize-video-encoding|audio-always"/>
    <param name="video-layout-name" value="1x1"/>
    <param name="video-canvas-size" value="640x480"/>
    <param name="video-canvas-bgcolor" value="#333333"/>
    <param name="video-layout-bgcolor" value="#000000"/>
    <param name="video-codec-bandwidth" value="1mb"/>
    <param name="video-fps" value="15"/>
    <param name="min-required-recording-participants" value="2"/>
    <param name="max-members" value="2"/>
</profile>
```

in ./directory create a new user:

<include>
  <user id="1001">
    <params>
      <param name="password" value="some-password"/>
    </params>
    <variables>
      <variable name="toll_allow" value="domestic,international,local"/>
      <variable name="accountcode" value="1001"/>
      <variable name="user_context" value="default"/>
      <variable name="effective_caller_id_name" value="Extension 1001"/>
      <variable name="effective_caller_id_number" value="1001"/>
    </variables>
  </user>
</include>

