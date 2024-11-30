#!/bin/bash
set -euxo pipefail

# renovate: datasource=github-releases depName=kubeconform packageName=yannh/kubeconform
KUBECONFORM_VERSION=v0.6.7

# CHART_DIRS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/main -- charts | cut -d '/' -f 2 | uniq)"
SCHEMA_LOCATION="https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/"

# install kubeconform
brew install kubeconform

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  (cd "${CHART_DIR}"; helm dependency build)
  for VALUES_FILE in "${CHART_DIR}"/ci/*.yaml; do
    helm template \
      --api-versions batch/v1/CronJob \
      --values "${VALUES_FILE}" \
      "${CHART_DIR}" | kubeconform \
        --strict \
        --ignore-missing-schemas \
        --kubernetes-version "${KUBERNETES_VERSION#v}" \
        --schema-location "${SCHEMA_LOCATION}"
  done
done