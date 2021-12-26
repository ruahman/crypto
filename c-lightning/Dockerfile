FROM ubuntu:focal as base

# Install unzip jq and bash-completion
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && apt-get install -yqq \
		curl unzip jq bash-completion


FROM base as c-lighting

# Copy bitcoin-cli from bitcoind to this container
COPY --from=crypto/bitcoind:latest /usr/bin/bitcoin-cli /usr/bin

# Set CL_VER ENV from ARG
ARG CL_VER=0.10.1
ENV CL_VER=${CL_VER}

# get gpg, etc
RUN apt-get update -qq && apt-get install -yqq \
		gpg xz-utils libpq5 libsodium23 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# download c-lighting
RUN cd /tmp && \
    curl -sLO https://github.com/ElementsProject/lightning/releases/download/v${CL_VER}/clightning-v${CL_VER}-Ubuntu-20.04.tar.xz

# Verify developer signatures. The `gpg --verify` command will print a
# couple of warnings about the key not being trusted. That's ok. The
# important part is that it doesn't error and reports "Good
# signature".
ADD devkeys.pem /tmp/devkeys.pem
RUN gpg --import /tmp/devkeys.pem
ADD https://github.com/ElementsProject/lightning/releases/download/v0.10.1/SHA256SUMS /tmp/SHA256SUMS
ADD https://github.com/ElementsProject/lightning/releases/download/v0.10.1/SHA256SUMS.asc /tmp/SHA256SUMS.asc
RUN cd /tmp && \
    gpg -q --verify SHA256SUMS.asc SHA256SUMS && \
    cat SHA256SUMS && \
    sha256sum --ignore-missing -c SHA256SUMS

# extract c-lightning
RUN tar -xvf /tmp/clightning-v${CL_VER}-Ubuntu-20.04.tar.xz -C /

# Add bash auto complete for c-lightning
ADD https://raw.githubusercontent.com/ElementsProject/lightning/master/contrib/lightning-cli.bash-completion /usr/share/bash-completion/completions/lightning-cli

# Copy lightning config dir
COPY lightningd /lightningd
WORKDIR /lightningd
RUN ln -s /lightningd /root/.lightning

# Copy bashrc
COPY bashrc /root/.bashrc

# Copy entrypoint-script
COPY c-lightning-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/c-lightning-entrypoint.sh

# Copy fund-c-lightning
COPY fund-c-lightning.sh /usr/local/bin
RUN chmod +x /usr/local/bin/fund-c-lightning.sh

# Copy logtail
COPY logtail.sh /usr/local/bin
RUN chmod +x /usr/local/bin/logtail.sh

# Copy wait-for-bitcoind
COPY wait-for-bitcoind.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wait-for-bitcoind.sh

# Alias for lighting
COPY cli /usr/local/bin
RUN chmod +x /usr/local/bin/cli


EXPOSE 9735 9835
ENTRYPOINT ["/usr/local/bin/c-lightning-entrypoint.sh"]
CMD ["/usr/local/bin/logtail.sh"]
















