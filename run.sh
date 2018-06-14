export PYTHONPATH=rtclite:py-audio
python -m rtclite.app.sip.caller2 \
    --user=1001 \
    --domain=<IP-OF-YOUR-FS-SERVER> \
    --authuser=1001 \
    --authpass=some-password \
    --listen \
    --register \
    --samplerate=48000 \
    --recognize \
    --textspeech \
    --no-audio