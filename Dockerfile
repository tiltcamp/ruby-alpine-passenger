FROM ruby:alpine

RUN PACKAGES="curl pcre libstdc++ libexecinfo" \
 && BUILD_PACKAGES="build-base ruby-dev curl-dev pcre-dev libexecinfo-dev" \
 && apk add --update $PACKAGES $BUILD_PACKAGES \ 
 && gem install passenger --no-document \
 && passenger-config compile-agent --auto --optimize \
 && passenger-config install-standalone-runtime --auto --url-root=fake --connect-timeout=1 \
 && passenger-config build-native-support \
 && rm -rf /tmp/* \
 && passenger-config validate-install --auto \
 && apk del $BUILD_PACKAGES \
 && rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT ["passenger", "start", "--no-install-runtime", "--no-compile-runtime"]
