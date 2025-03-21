{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cloudflared.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cloudflared.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cloudflared.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "cloudflared.labels" -}}
app.kubernetes.io/name: {{ include "cloudflared.name" . }}
helm.sh/chart: {{ include "cloudflared.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "cloudflared.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "cloudflared.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Credentials Secret default name
*/}}
{{- define "cloudflared.credentialsSecretName" -}}
{{- if .Values.credentials.create -}}
    {{- printf "%s-%s" (include "cloudflared.fullname" .) "-credentials" -}}
{{- else -}}
    {{ default "default" .Values.credentials.secretName }}
{{- end -}}
{{- end -}}

{{/*
Tunnel Secret default name
*/}}
{{- define "cloudflared.tunnelIdSecretName" -}}
{{- if .Values.tunnel_id.create -}}
    {{- printf "%s-%s" (include "cloudflared.fullname" .) "-tunnel" -}}
{{- else -}}
    {{ default "default" .Values.tunnel_id.secretName }}
{{- end -}}
{{- end -}}

{{/*
Config ConfigMap default name
*/}}
{{- define "cloudflared.configConfigMapName" -}}
{{- if .Values.config.create -}}
    {{- printf "%s-%s" (include "cloudflared.fullname" .) "-config" -}}
{{- else -}}
    {{ default "default" .Values.config.secretName }}
{{- end -}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "cloudflared.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cloudflared.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}