FROM ghcr.io/containerbase/devcontainer:13.23.2

ENV container=docker

USER root

COPY tools/*.sh /usr/local/containerbase/tools/

# installs files to /etc/ct
# renovate: datasource=github-releases packageName=helm/chart-testing
RUN install-tool chart-testing v3.11.0

USER vscode

# renovate: datasource=github-releases packageName=kubernetes/kubernetes
RUN install-tool kubectl v1.31.3

# renovate: datasource=github-releases packageName=helm/helm
RUN install-tool helm v3.16.3

# renovate: datasource=github-releases packageName=norwoodj/helm-docs
RUN install-tool helm-docs 1.14.2

# renovate: datasource=github-releases packageName=yannh/kubeconform
RUN install-tool kubeconform v0.6.7

COPY --chmod=755 ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]