# Helm Charts

[![Release](https://img.shields.io/github/actions/workflow/status/ewatkins/helm-charts/release-on-merge.yaml?branch=main&style=for-the-badge&logo=github&logoColor=white&labelColor=222222&color=darkgreen
)](https://github.com/ewatkins/helm-charts/actions/workflows/release.yaml)&nbsp;&nbsp;
[![License: Apache-2.0](https://img.shields.io/github/license/ewatkins/helm-charts?style=for-the-badge&labelColor=222222&color=darkgreen
)](https://opensource.org/license/apache-2-0)&nbsp;&nbsp;
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/ewatkins&style=for-the-badge)](https://artifacthub.io/packages/search?ts_query_web=ewatkins&sort=last_updated)

## Usage

[Helm](https://helm.sh) must be installed to use these charts; please refer to the _Helm_ [documentation](https://helm.sh/docs/) to get started.

### OCI Repositories

The recommended way to install these charts is via OCI and the `helm search hub ewatkins` command should list the available charts.

### Non-OCI Repository

If you don't want to use the OCI repositories you can add the `ewatkins` repository as follows.

```shell
helm repo add ewatkins https://helm.ewatkins.dev
helm repo update
```

You can then run `helm search repo ewatkins` to see the charts.

## Charts

- [cloudflared](./charts/cloudflared/README.md)

## License

[Apache 2.0](./LICENSE)
